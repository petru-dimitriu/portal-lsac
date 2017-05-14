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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_article.jsp"%>






		<div id="innerBody">

			<div id="admin_buttons">
				<input type="button" id="b1" value="Administrare utilizatori">
				<input type="button" id="b2" value="Lista utilizatori"> <input
					type="button" id="b3" value="Administrare galerie"> <input
					type="button" id="b4" value="Administrare poll">
			</div>
		</div>
		<br>

		<div id="target"></div>


		<script type=text/javascript>
$(document).ready(function(){
	$("#b1").click(function(){
		$("#target").load("includes/adduser.jsp");
	});
});
$(document).ready(function(){
	$("#b2").click(function(){
		$("#target").load("includes/userlist.jsp");
	});
});




</script>









	</div>









	<%@ include file="footer.jsp"%>


	</div>
</body>
</html>
