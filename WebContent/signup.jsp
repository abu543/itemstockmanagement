<!DOCTYPE html>
<html>
<head>
<title>SIGN UP</title>
<div align="center">
<h4>Sing Up Here </h4>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<form action="UserController" method="post">
<input type ="hidden" name="command" value="ADD"/>
<% 
String msg=(String)request.getAttribute("msg");
if (msg !=null){
	%>
	<h3 style ="color:red;"> <%=msg %> </h3>
<%
}
%>
<table>
	<tr>
	<td>UserID : </td>
	<td><input type="text" name="userId" required="required" placeholder="User id"/></td>
	</tr>
	<tr>
	<td>Password: </td>
	<td><input type="text" name="password" required="required"/></td>
	</tr>
	<tr>
	<td>FirstName: </td>
	<td><input type="text" name="firstName" required="required"></td>
	</tr>
	<tr>
	<td>LastName: </td>
	<td><input type="text" name="lastName" required="required"></td>
	</tr>
	<tr>
	<td> Address : </td>
	<td><textarea rows="4" cols="32" name="address"></textarea></td>
	</tr>
	<tr>
	<td>City</td>
	<td><name="city"></td>
	<td>
	<select>
	<option> Delhi</option>
	<option> Mau</option>
	<option> Mumbai</option>
	<option> Gr Noida</option>
	</select></td>
	</tr>
	
	<tr colspan="2">
	<td><input  class="btn btn-primary" type="submit" value="login"/></td>
	<td><input  class="btn btn-primary" type="reset" value="reset"/></td>
	</tr>
	</table>
</form>

</body>
</div>
</html>