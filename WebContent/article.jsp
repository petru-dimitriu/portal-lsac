<%@page import="com.tip.connection.*, java.sql.*"%>
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



			<%!public class Article {

		private Connection con;
		private Statement st;
		private ResultSet rs;
		PreparedStatement selectArticles;

		public Article(int id) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
				selectArticles = con.prepareStatement("SELECT * FROM articles WHERE id = "+ id);
			} catch (Exception ex) {
				throw new Error(ex);
			}
		}

		public ResultSet getArticles() {
			try {
				rs = selectArticles.executeQuery();
			} catch (Exception ex) {
				System.out.println(ex);
			}
			return rs;
		}
	}%>
	
			<%
					Article article = new Article(id);
					ResultSet articles = article.getArticles();
					while (articles.next()) {%>
			<div id="title">
				<%
				out.print(articles.getString("title")); %>
			</div>
			<div id="underTitle">
				<%	out.print("Data postării:  " + articles.getDate("postDate")); %>
				<br>
				<%	out.print("Postat de:  " + articles.getString("username")); %>
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