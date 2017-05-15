
<%@page import="com.tip.connection.*, java.sql.*" %>
<div id = "innerBody">
	<h1>Editare articol</h1>
		
		<form method = "post" class="edit-form" action="../EditArticle">
						<input name="id" type="hidden"  value="<%= request.getParameter("id") %>"><br>
  				    Titlu: <input name="title" type="text"  value="<%= request.getParameter("title") %>"><br>
  					Continut: <input name="content" type="text" value="<%= request.getParameter("content") %>">
                      <button type="submit">Edit</button>
                      
                      </form>


</div>