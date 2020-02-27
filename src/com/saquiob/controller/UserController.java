package com.saquiob.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.saquib.data.UserDAOImpl;
import com.saquib.model.User;


@WebServlet("/UserController")
@MultipartConfig(						// using for photo size
		fileSizeThreshold = 1024 * 10, //10kb
		maxFileSize = 1024 * 300,	  // 300kb
		maxRequestSize = 1024 * 1024 //1MB
		)
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAOImpl userUtil=null;
	
	@Override
	public void init() throws ServletException {
		userUtil =new UserDAOImpl();
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			try {
			String command= request.getParameter("command");	
			
			switch(command)
			{
			case "ADD":
				  addUser(request,response);
				  break;
				  
			case "USER":
				 getUser(request,response);
				 break;
				 
		    case "UPDATEPHOTO":
				updatePhoto(request,response);
				break;
				
			case "LOGOUT":
				logout(request,response);
				break;
			
			}
			}
		catch(Exception e) {
		throw new ServletException(e);
		}
	}
	

	private void updatePhoto(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String userId = request.getParameter("userId");
		
		Part filePart = request.getPart("photo");
		
		InputStream inputStream = null;
		
		if(filePart != null) {
			inputStream = filePart.getInputStream();
		}
		
		userUtil.updatePhoto(userId,inputStream);
		
		User user = userUtil.getUser(userId);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		
	    response.sendRedirect(request.getContextPath() + "/itemController");
		
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		String message = "Log out Successfully";
		RequestDispatcher rd = request.getRequestDispatcher("login1.jsp");
		request.setAttribute("msg", message);
		rd.forward(request,response);
		
	}

	private void getUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		String message = null;
		String resource ="login1.jsp";
		
		try {
			User user = userUtil.getUser(userId);
			if(user.getPassword().equals(password)) {
				resource = "itemController";
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				
		}
		else {
				message = "Wrong password : please try again";
		}
		}catch (Exception e) {
			message = e.getMessage();
		
	}
		request.setAttribute("msg", message);
		RequestDispatcher rd=request.getRequestDispatcher(resource);
		rd.forward(request,response);
		
		
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");	
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		
		Part filePart = request.getPart("photo");				// part use for photo conversion
		InputStream inputStream = null;
		
		if(filePart!=null) {									// checking photo
			inputStream =filePart.getInputStream();
		}
		
		String message=null;
		String resource="registration1.jsp";
		
		User user= new User(userId,password,firstName,lastName,address,city,inputStream);
	 try{
		 userUtil.addUser(user);
		// System.out.println("Record inserted successfull");
		 message="Record inserted successfull: please login";
		 resource="login1.jsp";
	 }
	 catch (Exception e) {
		  message = e.getMessage();
		 
	 }
	 	request.setAttribute("msg", message);
		RequestDispatcher rd=request.getRequestDispatcher(resource);
		rd.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
