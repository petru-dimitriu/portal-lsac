<%@page
	import="com.tip.servlet.LoginSession, java.sql.*, com.tip.data.*, java.text.*, java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Liga Studenților Facultății de Automatică și Calculatoare
	din Iași</title>
<meta charset="utf-8">
<link href="style/css/style.css" rel="stylesheet">

<style>
#admin_buttons {
	margin: 0 auto;
}

#userBox {
	width: 800px;
	height: 40px;
	padding: 5px;
	margin-bottom: 4px;
	background-color: #f5f5f5;
	border-radius: 4px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	position: relative;
	margin: 10px auto;
	overflow: auto;
	width: 60%;
	min-height: 100px;
}

.edit-form {
	position: absolute;
	top: 0px;
	right: 60px;
}

.edit-form button {
	width: 40px;
	height: 30px;
	color: white;
	background-color: green;
	opacity: 0.6;
}

.edit-form button:hover {
	opacity: 1;
	cursor: pointer;
}

.delete-form {
	position: absolute;
	top: 0px;
	right: 0px;
}

.delete-form button {
	width: 50px;
	height: 30px;
	color: white;
	background-color: red;
	opacity: 0.6;
}

.delete-form button:hover {
	opacity: 1;
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%if(session.getAttribute("id") != null && session != null){
		String v = "" + session.getAttribute("id") + "";
		if (Integer.parseInt(v) == 1) {
	%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<div id="upperThird">
		<div id="title">Panoul administratorului</div>
		</div>


		<div id="innerBody">

			<div id="admin_buttons">
				<input type="button" id="b1" value="Administrare utilizatori">
				<input type="button" id="b2" value="Administrare articole">
				<input type="button" id="b3" value="Administrare poll">
			</div>

		<br>

		<div id="target"></div>


		<script type=text/javascript>
			$(document).ready(function() {
				$("#b1").click(function() {
					$("#target").load("includes/userlist.jsp");
				});
			});
			$(document).ready(function() {
				$("#b2").click(function() {
					$("#target").load("includes/articlelist.jsp");
				});
			});
			$(document).ready(function() {
				$("#b3").click(function() {
					$("#target").load("includes/pollList.jsp");
				});
			});
		</script>

	
	<%@ include file="footer.jsp"%>

	<%
		} else {
			response.sendRedirect("/index.jsp");
		}
	}else {
		response.sendRedirect("/index.jsp");
	}
	%>
	</div>
	</div>
</body>
</html>