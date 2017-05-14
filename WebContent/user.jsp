<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tip.connection.SqlConnection"%>
<%@page import="com.tip.data.*, java.sql.*"%>
<% 
int id = Integer.parseInt(request.getParameter("id"));

User user = new SqlConnection().getUserInfo(id);

%>
<!DOCTYPE html>
<html>
<head>
<title>Utilizatorul <% out.println(user.getName()); %>
</title>
<meta charset="utf-8">
<link href="style/css/styleMain.css" rel="stylesheet">
</head>
<body>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<div id="upperThird">
			<div id="title">
				Utilizatorul
				<% out.print(user.getName());%>
			</div>
		</div>
<<<<<<< HEAD
 		<div id = "innerBody">
 		<h1> Informatii </h1>
 		   		<table>
 		   		<tr> <td> Nume: </td> <td> <% out.print(user.getName()); %> </td> </tr>
 		   		<tr> <td> Adresa de mail: </td> <td> <%  out.print(user.getMail()); %> </td> </tr>
 		   		<tr> <td> Data inscrierii: </td> <td> <%  out.print(user.getDate()); %> </td> </tr>
 		   		</table>
    		 <br><br>
    		 <h1> Articolele postate de <% out.print(user.getName()); %> </h1>
    		 		
    		 			<ul>
=======
		<div id="innerBody">
			<p align="center">
			<table>
				<tr>
					<td>Nume:</td>
					<td>
						<% out.print(user.getName()); %>
					</td>
				</tr>
				<tr>
					<td>Adresa de mail:</td>
					<td>
						<%  out.print(user.getMail()); %>
					</td>
				</tr>
				<tr>
					<td>Data inscrierii:</td>
					<td>
						<%  out.print(user.getDate()); %>
					</td>
				</tr>
			</table>

			</p>
			<br>
			<br>
			<p>

				<tr> Articolele postate de <% out.print(user.getName()); %>: </tr>
    		 			
			<ul>
>>>>>>> 85f354ebe6a6959d1e3e7f7a0833b5bccd9f5f29
    		 				<%
    		 				ResultSet articles = new SqlConnection().getArticlesByAuthor(id);
    		 				boolean hasAnyArticles = false;
    		 				while(articles.next())
    		 				{
<<<<<<< HEAD
    		 					hasAnyArticles = true;
    		 					%> <li> <%out.print(articles.getString("title"));%> </li>
    		 					<%
=======
    		 					%> <li> <%out.print(articles.getString("title"));%> </li>	
    		 				<%
>>>>>>> 85f354ebe6a6959d1e3e7f7a0833b5bccd9f5f29
    		 				}
    		 				if (!hasAnyArticles) {
    		 				%>
    		 				<p> Niciun articol pana acum! </p>
    		 				<% } %>
    		 				
    		 				
    		 			</ul>
    		 </p>
    		 <br><br>
    		 
    		 <% 
    		 String id1 = (String)request.getParameter("id");
    		 String id2 = (String)session.getAttribute("id");
    		  if(id2.equals (id1))
    		  { %>
    		  	<a href="creare_articol.jsp" class="button_articol"> Creare articol </a>
    			
    		  <%} %>
    		 
    	</div>
        
      
      	<%@ include file="footer.jsp"%>
  </div>

  </body>
</html>