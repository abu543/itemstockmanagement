package com.saquiob.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saquib.data.ItemDAOImp;
import com.saquib.model.Item;

@WebServlet("/itemController")
public class itemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ItemDAOImp itemUtil =  null;   //connect the ItemDAOImp
	
	
   
    @Override
	public void init() throws ServletException {
		
		super.init();
		
		itemUtil = new ItemDAOImp();
	}

	public itemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		try {
			
			String command = request.getParameter("command");
			
			if(command == null) {
				command = "LIST";
			}
			switch(command) {
			case "LIST":
				listItem(request,response);						//List<Item> items = itemUtil.getItem();
				break;											//System.out.println(items);
			
			case "ADD":
				addItem(request,response);
				break;
			case "LOAD":
				loadItem(request,response);
				break;
			case "UPDATE":
				updateItem(request,response);
				break;
			case "DELETE":
				deleteItem(request,response);
				break;
			case "SEARCH":
				searchItem(request,response);
				break;
			default:
				listItem(request,response);
				break;
			}
				
		}catch (Exception e) {
			throw new ServletException(e);
		
		}
	}

	private void searchItem(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		String searchName= request.getParameter("searchName");
		
		List<Item> items = itemUtil.searchItem(searchName);
		request.setAttribute("item_list",items);
		
		RequestDispatcher rd = request.getRequestDispatcher("list-item.jsp");
		rd.forward(request,response);
	}

	private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int itemCode = Integer.parseInt(request.getParameter("itemCode"));
				
       itemUtil.deleteItem(itemCode);   //Model ko date dega
		
		listItem(request,response); // list call
				

		
	}

	private void updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int itemCode = Integer.parseInt(request.getParameter("itemCode"));
		
		String itemName = request.getParameter("itemName");
		String unit = request.getParameter("unit");
		int beginningInventory = Integer.parseInt(request.getParameter("beginningInventory"));
		int quantityOnHand = Integer.parseInt( request.getParameter("quantityOnHand"));
		double pricePerUnit = Double.parseDouble( request.getParameter("pricePerUnit"));
		String dateOfManufacture = request.getParameter("dateOfManufacture");
		String dateOfExpiry = request.getParameter("dateOfExpiry");
		String location = request.getParameter("location");
		String category = request.getParameter("itemCategory");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");     // this method for changing string into date 
		Date dom = new Date();
		dom = sdf.parse(dateOfManufacture);
		
		Date doe = new Date();
		doe = sdf.parse(dateOfExpiry);
		
		Item item = new Item(itemCode, itemName, unit, beginningInventory, quantityOnHand, pricePerUnit, dom, doe, location, category);
					
		itemUtil.updateItem(item);   //Model ko date dega
		
		//listItem(request,response); // list call
				
		response.sendRedirect("itemController?command=LIST");
	}

	private void loadItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int itemCode = Integer.parseInt(request.getParameter("itemCode"));
		System.out.println(itemCode);
		Item item = itemUtil.getItem(itemCode);   //itemcode ko call krega 
		System.out.println(item);
		request.setAttribute("ITEM",item); //jsp page pe le kr jaata hai record ko
		RequestDispatcher rd = request.getRequestDispatcher("update-item-form.jsp"); 
		rd.forward(request, response);
		 
	}

	private void addItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		String itemName = request.getParameter("itemName");
		String unit = request.getParameter("unit");
		int beginningInventory = Integer.parseInt(request.getParameter("beginningInventory"));
		int quantityOnHand = Integer.parseInt( request.getParameter("quantityOnHand"));
		double pricePerUnit = Double.parseDouble( request.getParameter("pricePerUnit"));
		String dateOfManufacture = request.getParameter("dateOfManufacture");
		String dateOfExpiry = request.getParameter("dateOfExpiry");
		String location = request.getParameter("location");
		String category = request.getParameter("itemCategory");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");     // this method for changing string into date 
		Date dom = new Date();
		dom = sdf.parse(dateOfManufacture);
		
		Date doe = new Date();
		doe = sdf.parse(dateOfExpiry);
		
		String message = null;
		if(!doe.after(dom)) {
			message = "Date of Expiry can't be less than Date of Manufacture";
			request.setAttribute("msg", message);
			RequestDispatcher rd = request.getRequestDispatcher("add-item-form.jsp");
			rd.forward(request, response);
		}
		
		else {
		
		Item item = new Item(itemName, unit, beginningInventory, quantityOnHand, pricePerUnit, dom, doe, location, category);
		
		itemUtil.addItem(item);  
		
		//listItem(request,response);  //send back to main page(the item list)
		
		response.sendRedirect("itemController?command=LIST");  //doublicate  value nhi create krega in DB
	}
	}
	private void listItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Item> items = itemUtil.getItem();
		request.setAttribute("item_list",items);
		
		RequestDispatcher rd = request.getRequestDispatcher("list-item.jsp");
		rd.forward(request,response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
