<%@page import="com.tip.connection.*, java.sql.*" %>

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
	<%
	Article article = new Article();
	ResultSet articles = article.getArticles();
	while(articles.next()){
		out.print(articles.getString("title") + " " + articles.getString("username") +" " + articles.getString("content"));
		out.println();
	}
	%>
	
	<div class="text1">
		<p> hello </p>
	</div>
      
</div>

