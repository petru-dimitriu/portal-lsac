<%@page import="com.tip.connection.SqlConnection, java.sql.*, java.util.*, com.tip.data.*" %>
<br>
<div id = "innerBody">



	<%List<Article> articles = new SqlConnection().getArticles();%>
	<h1 style="text-align:center">Lista articole</h1>
	<%for (Article article: articles){%>
		<div id="userBox">
		<h2><a style="text-decoration: none;"href="../article.jsp?id=<%= article.getId()  %>"><% out.print(article.getTitle()); %></a></h2>
		
		<form method = "post" class="edit-form" action="includes/edit_article.jsp"> 
			
  				     <input name="title" type="hidden"  value="<%= article.getTitle() %>">
  					<input name="content" type="hidden" value="<%= article.getContents() %>"> 
  					<input name="id" type="hidden" value="<%= article.getId() %>"> 
                      <button type="submit">Edit</button>
                      
                      </form>
                      
                    <form method = "post" class="delete-form" action="DeleteArticle">
					<input name="id" type="hidden" value="<%= article.getId() %>"> 
                    <button type="submit">Delete</button>
                    
                    </form>


		</div>
		<%
	}
	%>
	
</div>