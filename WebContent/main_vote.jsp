 <link rel="stylesheet" type="text/css" href="style/css/style_headers.css"> 
 <%@page import="com.tip.connection.*, java.sql.*" %>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="js/script.js"></script>

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

	<script> countDownDate = []; // array
	</script>
	
	<% 
	ResultSet sondaje = new SqlConnection().getSondaje();
	int indexSondaj = 0;
	while(sondaje.next())
	{
		out.print(sondaje.getString("titlu"));
		String x=sondaje.getString("optiuni");
		Timestamp stopVot=sondaje.getTimestamp("stopSondaj");
		String[] optiuni=x.split(",");

		for(int i=0;i<optiuni.length;i++)
		{ 
		%>
			<br>
			<input type="radio" name="ans" value="${optiuni[i]}"><%out.print(optiuni[i]); %>
		<%	
		}
		%>
		
		<script>countDownDate[<%=indexSondaj%>] = new Date(<% out.print(stopVot.getTime());%>);</script>
		<br><br>
		<input type="submit" value="Votează!">
		
		<div>
		<br>
		Timpul ramas de votare : <span id="stop<%=indexSondaj%>"> </span>
		</div>
		<br><br>
		
	<%
	indexSondaj++;
	}
	%>
	
	<script>
	for (var i = 0; i<countDownDate.length; i ++)
	{
		countTimeFor("stop"+i,countDownDate[i]);
	}
	</script>
	
</div>