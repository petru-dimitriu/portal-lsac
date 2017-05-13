<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title> Informații personale </title>
    <meta charset="utf-8">
    <link href ="style/css/style.css" rel ="stylesheet">
  </head>
  <body>
    <div id = "body">
	
		<%@ include file= "menu.jsp" %>
	
    	<%@ include file= "header_user.jsp" %>
 		<div id = "innerBody">
 		   <p align="center">
    			 Numele Utilizatorului : ${sessionScope.username}
    			 </p>
    	</div>
        
      
      	<%@ include file= "footer.jsp" %>
  </div>

  </body>
</html>