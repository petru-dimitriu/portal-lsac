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
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_files.jsp"%>

		<div id="innerBody">

			<h3><%=request.getAttribute("Message")%></h3>

		</div>

		<%@ include file="footer.jsp"%>


	</div>
</body>
</html>