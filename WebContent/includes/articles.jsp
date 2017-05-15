<%@page import="com.tip.connection.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id = "innerBody">

		<div id ="flex-sections">
			
			<%
			ResultSet articles = new SqlConnection().getArticles();%>
			<%while(articles.next()){%>
			<div id="sectiune">
				<h1><%out.print(articles.getString("title")); %></h1> 
				<br> 
			<%	out.print(articles.getDate("postDate")); %>
				<br>
			<%	out.print(articles.getString("user_id")); %>
				<br> <br> <br>
				<a href="article.jsp?id=<%= articles.getString("id") %>" class="button"> Citeste </a>
				</div>
			<% } %>

	
		</div>
      
</div>

