<%@page import="com.tip.connection.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id = "innerBody">

	<%!
	public class Article {
		
		private Connection con;
		private Statement st;
		private ResultSet rs;
		PreparedStatement selectArticles;
		
			public Article(){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
					selectArticles = con.prepareStatement("SELECT * FROM articles");
				}catch(Exception ex){
					throw new Error(ex);
				}
			}
			
			public ResultSet getArticles(){
				try{
					rs = selectArticles.executeQuery();					
				}catch (Exception ex){
					System.out.println(ex);
				}
				return rs;
			}
	}
	%>
	
	<div id="sectiune">
		<%
		Article article = new Article();
		ResultSet articles = article.getArticles();
		while(articles.next()){
			out.print(articles.getString("title")); %> 
			<br> 
		<%	out.print("Data postării:  " + articles.getDate("postDate")); %>
			<br>
		<%	out.print("Postat de:  " + articles.getString("username")); %>
			<br> <br> <br>
			<a href="main_article.jsp" class="button"> Read more </a>
			
		<% } %>
	</div>
	
      
</div>

