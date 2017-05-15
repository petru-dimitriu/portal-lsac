<%@page
	import="com.tip.connection.SqlConnection, java.sql.*, com.tip.data.*, java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
<title>Liga Studenților Facultății de Automatică și Calculatoare
	din Iași</title>
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
			<%
				SqlConnection conn = new SqlConnection();
					Article article = conn.getArticle(id);
			%>
			<div id="title">
				<%
					out.print(article.getTitle());
				%>
			</div>
			<div id="underTitle">
				<%
					out.print("Data postării:  " + new SimpleDateFormat("dd-MM-yyyy")
								.format(new java.util.Date(article.getTimestamp().getTime())));
				%>
				<br>
				<%
					out.print("Postat de: ");
				%>
				<a href="user.jsp?id=<%=article.getUserId()%>"> <%
 	out.print(conn.getUserInfo(article.getUserId()).getName());
 %>
				</a>
			</div>
		</div>

		<div id="innerBody">
			<%
				out.print(article.getContents());
			%>
			<br>


		</div>

		}

		<%@ include file="footer.jsp"%>
	</div>
	<%
		} else {
			response.sendRedirect("/notLogged.jsp");
		}
	%>
</body>
</html>