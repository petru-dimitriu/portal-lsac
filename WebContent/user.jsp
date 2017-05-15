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
<title>Utilizatorul <%
	out.println(user.getName());
%>
</title>
<meta charset="utf-8">
<link href="style/css/styleMain.css" rel="stylesheet">
</head>
<body>
	<%
		if (session.getAttribute("id") != null && session != null) {
	%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<div id="upperThird">
			<div id="title">
				Utilizatorul
				<%
				out.print(user.getName());
			%>
			</div>
		</div>
		<div id="innerBody">
			<h1>Informatii</h1>
			<table>
				<tr>
					<td>Nume:</td>
					<td>
						<%
							out.print(user.getName());
						%>
					</td>
				</tr>
				<tr>
					<td>Adresa de mail:</td>
					<td>
						<%
							out.print(user.getMail());
						%>
					</td>
				</tr>
				<tr>
					<td>Data inscrierii:</td>
					<td>
						<%
							out.print(user.getDate());
						%>
					</td>
				</tr>
			</table>
			<h1>
				Articolele postate de
				<%
				out.print(user.getName());
			%>
			</h1>

			<ul>

				<%
					ResultSet articles = new SqlConnection().getArticlesById(id);
						boolean hasAnyArticles = false;
						while (articles.next()) {
							hasAnyArticles = true;
				%>
				<li>
					<%
						out.print(articles.getString("title"));
					%>
				</li>
				<%
					}
						if (!hasAnyArticles) {
				%>
				<p>Niciun articol pana acum!</p>
				<%
					}
				%>


			</ul>
			</p>
			<%
				String id1 = (String) request.getParameter("id");
					String id2 = (String) session.getAttribute("id");
					if (id2.equals(id1)) {
			%>
			<a href="creare_articol.jsp" class="button_articol"> Scrie un
				articol! </a>
			<%
				}
			%>

		</div>


		<%@ include file="footer.jsp"%>
	</div>
	<%
		} else {
			response.sendRedirect("/notLogged.jsp");
		}
	%>
</body>
</html>