<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html">
<html>
<head>
<title>List Items</title>

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" name="text/css" href="css/styles.css">

</head>
<body style="background-color:#e1f2fb;">



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
              <i class="fa fa-user"></i>welcome: ${user.firstName }
              </a>
           
          </li>
          <li class="nav-item">
            <a href="UserController?command=LOGOUT" class="nav-link">
              <i class="fa fa-user-times"></i> Logout
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
  
  
<!-- <link rel="stylesheet" type="text/css" href="style.jsp/css"/>-->

<div align="center" >
${msg }
<h1>Adding Items</h1>
</head>
<body>

	<form action="itemController" method="post">
	<input type="hidden" name="command" value="ADD"/>
	<table>
	<tbody>
	<tr>
	<th>Item_Name</th>
	<th><input type="text" name="itemName" placeholder="itemName"/></th>
	</tr>
	
	<tr>
	<th>Unit</th>
	<th><input type="text" name="unit" placeholder="Unit"/></th>
	</tr>
	
	<tr>
	<th>Beginning_Inventory</th>
	<th><input type="text" name="beginningInventory" placeholder="BeginningInventory"/></th>
	</tr>
	
	<tr>
	<th>Quantity_On_Hand </th>
	<th><input type="text" name="quantityOnHand" placeholder="QuantityOnHand"/></th>
	</tr>
	
	<tr>
	<th>Price_Per_Unit </th>
	<th><input type="number" name="pricePerUnit" required="required" placeholder="PricePerUnit" min ="0"/></th>
	</tr>
	
	<tr>
	<th>Date_Of_Manufacture</th>
	<th><input type="Date" name="dateOfManufacture" placeholder="DateOfManufacture"/></th>
	</tr>
	
	<tr>
	<th>Date_Of_Expiry</th>
	<th><input type="Date" name="dateOfExpiry" placeholder="DateOfExpiry"/></th>
	</tr>
	
	<tr>
	<th>Location</th>
	<th><select name="location">
	<option disabled selected value="">Selected Location</option>
	<option>Bulk Zone</option>
	<option>Delhi</option>
	<option>Distribution Center</option>
	</select></th>
	</tr>
	
	<tr>
	<th>Category</th>
	<th><select name="category">
	<option disabled selected value="">Selected Category</option>
	<opyion>Pharma Drug</opyion>
	<option>Health and Personal Care</option>
	<option>Baby Care</option>
	<option>Medical Supplies anad Equipments</option>
	</select></th>
	</tr>
	
	<tr>
   <td></td>
   <th></th>
	</tr>
	<tr colspan="2">
	<td><label></label></td>
	<td><input  class="btn btn-primary" type="submit" value="Submit"/></td>
	</tr>
	</tbody>
	</table>
</form>
<div style="clear:both;"></div>
<p>
<a href="itemController">Back To List</a>
</p>
</body>
</div>

</html>