<%@page import="com.tip.connection.*, java.sql.*"%>
<%if(session.getAttribute("id") != null && session !=null){%>
<div id="innerBody">
	<h1>Adaugare utilizator nou</h1>
	<form method="post" action="AddUser">

		<div style="width: 60%;">

			<p>Nume</p>
			<input name="username" type="text" required> <input
				name="password" type="hidden">
			<p>Email</p>
			<input name="email" type="email" required> <br> <br>
			<button type="submit">Adaugare</button>
		</div>
	</form>
</div>
<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>