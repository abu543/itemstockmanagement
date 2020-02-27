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
<body style="background-color: #e1f2fb;">



<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>  <!-- cache ko clear krta hai jab login karete hai toh -->


<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="itemController" class="navbar-brand">AS Saree</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="itemController" class="nav-link active">Home</a>
          </li>
             
        </ul>

        <ul class="navbar-nav ml-auto">
        
           <li class="nav-item">
            <a href="#" class="nav-link">
            <a href="#" data-toggle="modal" data-target="#addPostModal">
              <i class="fa fa-user-times"></i> <img src="data:image/jpg;base64,${user.base64Image }" class="rounded-circle" align="top" width="40" height="40"/>
            </a>
          </li>
          
          <li class="nav-item ">
            <a href="#" class="nav-link">
             <i class="fa fa-user">
             </i>welcome: ${user.firstName}
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
<header id="main-header" class="py-2 bg-Danger link text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
         <img src="Image/icon.png" class="rounded float-left" alt="Roxx" height="100" width="100" > <h1 align="center">Stock Management</h1>
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
			
			<div class="modal fade" id="addPostModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title">Update Photo</h5>
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
        </div>
        
        <div class="modal-body">
        
          <form action="UserController" method="post" enctype="multipart/form-data">
          
         	 <input type="hidden" name="command" value="UPDATEPHOTO">
         	 <input type="hidden" name="userId" value="${user.userId}">
          
              <div class="form-group">
              <label for="file">Photo Upload</label>
              <input type="file" name="photo" class="form-control-file">
              <small class="form-text text-muted">Max Size 3mb</small>
            </div>
            
            <div class="modal-footer">
          <button class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button class="btn btn-primary" type="submit">Update Photo</button>
        </div>
            
            </form>
            
        </div>
        
        
        
        
      </div>
    </div>
  </div>
  
  
  
			
	 <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
  
</body>
</html>