<%@page import="com.tip.connection.SqlConnection, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% int id = Integer.parseInt(request.getParameter("id")); %>
<!DOCTYPE html>
<html>
<head>
<title>Liga Studenților Facultății de Automatică și Calculatoare
	din Iași</title>
<meta charset="utf-8">
<link href="style/css/styleMain.css" rel="stylesheet">
</head>
<body>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<div id="upperThird">

			<%
					ResultSet articles = new SqlConnection().getArticles(id);
					while (articles.next()) {%>
			<div id="title">
				<%
				out.print(articles.getString("title")); %>
			</div>
			<div id="underTitle">
				<%	out.print("Data postării:  " + articles.getDate("postDate")); %>
				<br>
				<%	out.print("Postat de:  " + articles.getString("user_id")); %>
			</div>

		</div>

		<div id="innerBody">
			<%
					out.print(articles.getString("content"));
				%>
			<br>
			<%
					}
				%>

		</div>

		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>