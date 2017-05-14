<%@page import="com.tip.connection.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id = "innerBody">

		<%
		ResultSet articles = new SqlConnection().getArticles();%>
		<ul>
		<%while(articles.next()){%>
		<div id="sectiune">
		<li>
			<%out.print(articles.getString("title")); %> 
			<br> 
		<%	out.print("Data postării:  " + articles.getDate("postDate")); %>
			<br>
		<%	out.print("Postat de:  " + articles.getString("username")); %>
			<br> <br> <br>
			<a href="article.jsp?id=<%= articles.getString("id") %>" class="button"> Read more </a>
			</li></div>
		<% } %>
		</ul>
	
	
      
</div>

