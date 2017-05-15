
<%@page
	import="com.tip.connection.SqlConnection, java.sql.*, java.util.*, com.tip.data.*, java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%if(session.getAttribute("id") != null && session !=null){%>
<br>
<div id="innerBody">

	<% 
			SqlConnection conn = new SqlConnection();
			List<Article> articles = conn.getArticles();%>

	<h1 style="text-align: center">Lista articole</h1>
	<%for (Article article : articles){%>
	<div>
			<div>
			<div class = "rightFloater">
				<a href="creare_articol.jsp?id=<%= article.getId() %>">Edit</a> / Delete</div>
			<div> 
				<%=article.getTitle() %>
			</div>
			</div>		

	</div>
	<%
	}
	%>

</div>
<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>