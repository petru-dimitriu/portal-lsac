<%@page import="com.tip.connection.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id = "innerBody">

		<%
		ResultSet articles = new SqlConnection().getArticles();%>
		<%while(articles.next()){%>
		<div id="sectiune">
			<b><%out.print(articles.getString("title")); %> </b>
			<br> 
		<%	out.print("Data postării:  " + articles.getDate("postDate")); %>
			<br>
		<%	out.print("Postat de:  " + articles.getString("username")); %>
			<br> <br> <br>
			<a href="article.jsp?id=<%= articles.getString("id") %>" class="button"> Read more </a>
			</div>
		<% } %>
	
	
      
</div>

