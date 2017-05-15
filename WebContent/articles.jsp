<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Liga Studenților Facultății de Automatică și Calculatoare
	din Iași</title>
<meta charset="utf-8">
<link href="style/css/styleMain.css" rel="stylesheet">
</head>
<body>
	<%if(session.getAttribute("id") != null && session !=null){%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_article.jsp"%>

		<%@ include file="includes/articles.jsp"%>

		<%@ include file="footer.jsp"%>

	</div>
	<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>
</body>
</html>
