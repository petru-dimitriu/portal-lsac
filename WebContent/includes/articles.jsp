<%@page import="com.tip.connection.*, java.sql.*, com.tip.data.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id = "innerBody">

		<div id ="flex-sections">
			
			<%
			List<Article> articles = new SqlConnection().getArticles();%>
			<%for (Article article : articles){%>
			<div id="sectiune">
				<h1><%out.print(article.getTitle()); %></h1> 
				<br> 
			<%	out.print(article.getTimestamp()); %>
				<br>
			<%	out.print(article.getUserId()); %>
				<br> <br> <br>
				<a href="article.jsp?id=<%= article.getId() %>" class="button"> Citeste </a>
				</div>
			<% } %>

	
		</div>
      
</div>

