
<%@page import="com.tip.connection.*, java.sql.*"%>
<%if(session.getAttribute("id") != null && session !=null){%>
<div id="innerBody">
	<h1>Editare articol</h1>
	<form method="post" class="edit-form" action="../EditArticle">
		<input name="id" type="hidden"
			value="<%= request.getParameter("id") %>"><br> Titlu: <input
			name="title" type="text" value="<%= request.getParameter("title") %>"><br>
		Continut: <br>
		<textarea name="content" rows="10" cols="50"><%= request.getParameter("content") %></textarea>
		<button type="submit">Edit</button>
	</form>


</div>
<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>