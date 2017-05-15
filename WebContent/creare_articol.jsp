<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.tip.connection.*, java.sql.*, com.tip.data.*, java.util.*, java.text.*"%>
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

<%
	int id = -1;
	if (request.getParameter("id") != null)
	{
		id = Integer.parseInt((String)request.getParameter("id"));
	}
	Article article = null;
	if (id != -1)
	{
		article = new SqlConnection().getArticle(id);
	}
	
%>
	<%if(session.getAttribute("id") != null && session !=null){%>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%
		if (article != null && ! session.getAttribute("username").equals("admin"))
		{
			int userId = Integer.parseInt((String)session.getAttribute("id"));
			if (article.getUserId() != userId) // nu e articolul userului => nu permite
					article = null;
		}
		%>
		<div id="upperThird">
			<div id="title">
			<% if (article != null) {%>
				Editeaza articolul "<%=article.getTitle() %>"
			<% } else { %>
				Scrie un articol nou
			<% } %>
			</div>
			<div id="underTitle">
				
			</div>
		</div>

		<div id = "innerBody">
		<form method="post" action="AddArticle">
		<input type="hidden" name="articleId" value="<%=id%>">
		<input type="hidden" name="id" value="${sessionScope.id}">
		Titlu:<br><input type="text" name="title" style="width:100%" value ="<% if (article != null) out.print(article.getTitle());%>"><br><br>
		Conținut:<br>    <textarea name="content" rows="10" style="width:100%">
		<% if (article != null)
		{
			out.print(article.getContents());
		}%>
		</textarea><br>
		<input type="submit" value="Trimite">
		</form>	
	</div>


		<%@ include file="footer.jsp"%>

	</div>
	<%}else{
		response.sendRedirect("/notLogged.jsp");
	}%>
</body>
</html>