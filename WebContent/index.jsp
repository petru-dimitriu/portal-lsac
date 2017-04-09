<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
    <title> Liga Studenților Facultății de Automatică și Calculatoare din Iași </title>
    <meta charset="utf-8">
    <link href ="style/css/style.css" rel ="stylesheet">
  </head>
  <body>
    <div id = "body">
	
		<%@ include file= "menu.jsp" %>
	
      <%@ include file= "header.jsp" %>
      
      <h3>Welcome ${sessionScope.username}</h3>
      <a href="LoginSession">Logout</a>

      <%@ include file= "main.jsp" %>
      
      <%@ include file= "footer.jsp" %>
      
      
  </div>
  </body>
</html>
