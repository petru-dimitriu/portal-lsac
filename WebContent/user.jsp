<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tip.connection.*"%>
<%@page import="com.tip.data.*"%>
<% 
int id = Integer.parseInt(request.getParameter("id"));

User user = new SqlConnection().getUserInfo(id);

%>
<!DOCTYPE html>
<html>
  <head>
    <title> Utilizatorul <% out.println(user.getName()); %> </title>
    <meta charset="utf-8">
    <link href ="style/css/style.css" rel ="stylesheet">
  </head>
  <body>
    <div id = "body">
	
		<%@ include file= "menu.jsp" %>
	
    	 <div id = "upperThird">
        <div id = "title" >
          Utilizatorul <% out.print(user.getName());%> 
        </div>
		</div>
 		<div id = "innerBody">
 		   <p align="center">
 		   		<table>
 		   		<tr> <td> Nume: </td> <td> <% out.print(user.getName()); %> </td> </tr>
 		   		<tr> <td> Adresa de mail: </td> <td> <%  out.print(user.getMail()); %> </td> </tr>
 		   		<tr> <td> Data inscrierii: </td> <td> <%  out.print(user.getDate()); %> </td> </tr>
 		   		</table>
    			 
    		 </p>
    	</div>
        
      
      	<%@ include file= "footer.jsp" %>
  </div>

  </body>
</html>