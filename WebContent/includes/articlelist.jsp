
<%@page
	import="com.tip.connection.SqlConnection, java.sql.*, java.util.*, com.tip.data.*, java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%if(session.getAttribute("id") != null && session !=null){%>
<br>

<script>
function deleteArticle(id) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
				if (this.responseText == "success")
				{
					$("#b2").click(); // reload
				}
					
		}
	};
	xhttp.open("GET", "DeleteArticle?id=" + id, true);
	xhttp.send();
}
</script>

<div id="innerBody">

	<% 
			SqlConnection conn = new SqlConnection();
			List<Article> articles = conn.getArticles();%>

	<h1 style="text-align: center">Lista articole</h1>
	<%for (Article article : articles){%>
	<div>
			<div>
			<div class = "rightFloater">
				<a href="creare_articol.jsp?id=<%= article.getId() %>">Editare</a> /
				<a href ="javascript:deleteArticle(<%= article.getId() %>)"> Eliminare</a></div>
			<div> 
				<%=article.getTitle() %>
			</div>
			</div>		

	</div>
	<%
	}
	%>

</div>
<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>