<%@page import="com.tip.connection.SqlConnection, java.sql.*" %>
<br>
<div id = "innerBody">



	<%ResultSet articles = new SqlConnection().getArticlesAdmin();%>
	<h1 style="text-align:center">Lista articole</h1>
	<%while(articles.next()){%>
		<div id="userBox">
		<h2><a style="text-decoration: none;"href="../article.jsp?id=<%= articles.getString("id")  %>"><% out.print(articles.getString("title")); %></a></h2>
		
		<form method = "post" class="edit-form" action="includes/edit_article.jsp">
			
  				     <input name="title" type="hidden"  value="<%= articles.getString("title") %>">
  					<input name="content" type="hidden" value="<%= articles.getString("content") %>"> 
  					<input name="id" type="hidden" value="<%= articles.getString("id") %>"> 
                      <button type="submit">Edit</button>
                      
                      </form>
                      
                    <form method = "post" class="delete-form" action="DeleteArticle">
					<input name="id" type="hidden" value="<%= articles.getString("id") %>"> 
                    <button type="submit">Delete</button>
                    
                    </form>


		</div>
		<%
	}
	%>
	
</div>