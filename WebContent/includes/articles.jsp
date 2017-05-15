<%@page
	import="com.tip.connection.*, java.sql.*, com.tip.data.*, java.util.*, java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%if(session.getAttribute("id") != null && session !=null){%>
<div id="innerBody">

	<div id="flex-sections">

		<%
			SqlConnection conn = new SqlConnection();
			List<Article> articles = conn.getArticles();%>
		<%for (Article article : articles){%>
		<div id="sectiune">
			<h1>
				<%out.print(article.getTitle()); %>
			</h1>
			<br>
			<%	java.util.Date timestamp = new java.util.Date(article.getTimestamp().getTime());
				out.print(new SimpleDateFormat("dd-MM-yyyy").format(timestamp)); %>
			<br> <a href="user.jsp?id=<%=article.getUserId()%>"> <%	out.print(conn.getUserInfo(article.getUserId()).getName()); %>
			</a> <br> <br> <br> <a
				href="article.jsp?id=<%= article.getId() %>" class="button">
				Citeste </a>
		</div>
		<% } %>


	</div>

</div>
<%}else{
		response.sendRedirect("notLogged.jsp");
	}%>

