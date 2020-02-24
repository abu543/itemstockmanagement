<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
</head>
<body>
<h1>Login Form</h1>
<form action="UserController" method="post">
<input type ="hidden" name="command" value="USER"/>
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
<td>User ID :</td>
<td><input type="text" name="userId" required="required"/>
</td>
</tr>
<tr>
<td>password :</td>
<td><input type="text" name="password" required="required"/>
</td>
</tr>
<tr align="center">
<td><input type="submit" value="login"/></td>
<td><input type="reset" value="reset"/></td>
</tr>
</table>
</form>
</body>
</html>