<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title> Utilizatorul ${sessionScope.username} </title>
    <meta charset="utf-8">
    <link href ="style/css/style.css" rel ="stylesheet">
  </head>
  <body>
    <div id = "body">
	
		<%@ include file= "menu.jsp" %>
	
    	<%@ include file= "header_user.jsp" %>
 		<div id = "innerBody">
 		   <p align="center">
 		   		<table>
 		   		<tr> <td> Nume: </td> <td> ${sessionScope.username} </td> </tr>
 		   		<tr> <td> Adresa de mail: </td> <td> ${sessionScope.email} </td> </tr>
 		   		<tr> <td> Data inscrierii: </td> <td> ${sessionScope.entryDate} </td> </tr>
 		   		</table>
    			 
    			 </p>
    	</div>
        
      
      	<%@ include file= "footer.jsp" %>
  </div>

  </body>
</html>