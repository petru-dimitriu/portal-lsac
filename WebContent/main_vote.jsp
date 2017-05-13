 <link rel="stylesheet" type="text/css" href="style/css/style_headers.css"> 
 <%@page import="com.tip.connection.*, java.sql.*" %>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id = "innerBody">

	Vă rugăm să acordați o notă noului site LSAC!
		<div class="rating">
			<span>&#9734;</span>
			<span>&#9734;</span>
			<span>&#9734;</span>
			<span>&#9734;</span>
			<span>&#x2606;</span>
		</div>
		
</div>
<div id = "innerBody">

	<%!
	public class Sondaje {
		
		private Connection con;
		private Statement st;
		private ResultSet rs;
		PreparedStatement selectSondaje;
		
			public Sondaje(){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
					selectSondaje = con.prepareStatement("SELECT * FROM sondaje");
					
				}catch(Exception ex){
					throw new Error(ex);
				}
			}
			
			public ResultSet getSondaje(){
				try{
					rs = selectSondaje.executeQuery();					
				}catch (Exception ex){
					System.out.println(ex);
				}
				return rs;
			}
	}
	%>
	<%
	Sondaje sondaj = new Sondaje();
	ResultSet sondaje = sondaj.getSondaje();
	while(sondaje.next())
	{
		out.print(sondaje.getString("titlu"));
		String x=sondaje.getString("optiuni");
		String[] optiuni=x.split(",");

		for(int i=0;i<optiuni.length;i++)
		{ 
		%>
			<br>
			<input type="radio" name="ans" value="${optiuni[i]}"><%out.print(optiuni[i]);%>
		<% 
		} %>
		<br><br>
		<input type="submit" value="Votează!">
	<%}%>
     
     
</div>