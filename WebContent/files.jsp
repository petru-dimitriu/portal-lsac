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
	<%if(session.getAttribute("id") != null && session !=null){%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_files.jsp"%>

		<div id="innerBody">

			<form method="post" action="UploadServlet"
				enctype="multipart/form-data">
				<br> Upload fisier: <input type="file" name="file" size="20" />

				<input type="submit" value="Trimite">
			</form>


		</div>


		<%@ include file="footer.jsp"%>


	</div>
	<%}else{
		response.sendRedirect("notLogged.jsp");
	}%>
</body>
</html>
