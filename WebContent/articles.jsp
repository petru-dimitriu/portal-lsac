<%@page import="com.tip.connection.*, java.sql.*" %>

 <link rel="stylesheet" type="text/css" href="style/css/style_headers.css"> 
 
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
	
	<div class=sectionare>
		<%
		Article article = new Article();
		ResultSet articles = article.getArticles();
		while(articles.next()){
			out.print(articles.getString("title")); %> 
			<br> 
		<%	out.print(articles.getDate("postDate")); %>
			<br>
		<%	out.print(articles.getString("username")); %>
			<br>
		
			
		<% } %>
	</div>
	
      
</div>

