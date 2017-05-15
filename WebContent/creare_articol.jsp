<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Liga Studenților Facultății de Automatică și Calculatoare
	din Iași</title>
<meta charset="utf-8">
<link href="style/css/style.css" rel="stylesheet">
<script src="http://js.nicedit.com/nicEdit-latest.js"
	type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>

</head>
<body>
	<%if(session.getAttribute("id") != null && session !=null){%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_creareArticol.jsp"%>

		<%@ include file="includes/addArticle.jsp"%>

		<%@ include file="footer.jsp"%>


	</div>
	<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>
</body>
</html>