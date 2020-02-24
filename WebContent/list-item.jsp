<%@ page language="java" contentType="text/html,charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html">
<html>
<head>
<title>List Items</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>



<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>


<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="ItemController" class="navbar-brand">AS Saree</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="ItemController" class="nav-link active">Home</a>
          </li>
             
        </ul>

        <ul class="navbar-nav ml-auto">
        
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fa fa-user-times"></i> 
            </a>
          </li>
          
          <li class="nav-item mr-3">
            <a href="#" class="nav-link">
              <i class="fa fa-user"></i>welcome: ${user.firstName}
              </a>
           
          </li>
          <li class="nav-item">
            <a href="UserController?command=LOGOUT" class="nav-link">
              <i class="fa fa-user-times"></i> LogOut
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
<div class="container">
<header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
         <img src="Image/saquib.jpg" class="rounded float-left" alt="Roxx" height="100" width="100" > <h1>Item Stock Management</h1>
        </div>
      </div>
    </div>
  </header>
  </div>
  
  
 <div class="container mt-3 mb-3">
  
 
	<form action="add-item-form.jsp">
	<button type="submit" class="btn btn-primary">Add Item</button>
	</form>
	
	<form class="form-inline my-2 my-lg-0" action="itemController">
	 <input type="hidden" name="command" value="SEARCH"/>
      <input class="form-control mr-sm-2" type="search" name="searchName" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
	</div>
	
	<div class="container">
<table class="table table-hover">
<thead class="bg-primary text-white">
				<tr>
					<th>Item Name</th>
					<th>Unit</th>
					<th>Quantity On Hand</th>
					<th>Price Per Unit</th>
					<th>Date Of Expiry</th>
					<th>Location</th>
					<th>Action</th>
					</tr>
					</thead>
    <tbody>
			 <c:forEach var="item" items="${item_list}">
			 <c:url var="updateLink" value="itemController">
			 <c:param name="command" value="LOAD"/>
			 <c:param name="itemCode" value="${item.itemCode }"/>
			 </c:url>
			 <c:url var="deleteLink" value="itemController">
			 <c:param name="command" value="DELETE"/>
			 <c:param name="itemCode" value="${item.itemCode }"/>
						 
			  </c:url>
			   
					<tr>
					<td>${item.itemName }</td>
					<td>${item.unit }</td>
					<td>${item.quantityOnHand }</td>
					<td>${item.pricePerUnit }</td>
					<td>${item.dateOfExpiry }</td>
					<td>${item.location }</td>
					<td><a href="${updateLink}">Update</a>
					<a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this item'))) return false"> | Delete</a></td>
					
				</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
</body>
</html>