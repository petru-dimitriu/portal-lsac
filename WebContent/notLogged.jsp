<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Liga Studenților Facultății de Automatică și Calculatoare
	din Iași</title>
<meta charset="utf-8">
<link href="style/css/styleFiles.css" rel="stylesheet">
</head>
<body>
<%
		if (session.getAttribute("id") == null || session == null) {
	%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_notLogged.jsp"%>

		<div id="innerBody">

			<h2>Trebuie să fii logat pentru a avea acces la
				funcționalitățile site-ului!!</h2>


		</div>


		<%@ include file="footer.jsp"%>


	</div>
	<%}else{
		response.sendRedirect("/index.jsp");
	}%>
</body>
</html>
