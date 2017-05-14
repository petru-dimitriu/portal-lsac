 <link rel="stylesheet" type="text/css" href="style/css/style_headers.css"> 
<link rel="stylesheet" type="text/css" href="style/css/styleVotes.css"> 
 <%@page import="com.tip.connection.SqlConnection, java.sql.*" %>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="js/script.js"></script>

<div id = "innerBody">

	<script> countDownDate = []; // array
	</script>
	
	<% 
	ResultSet sondaje = new SqlConnection().getSondaje();
	int indexSondaj = 0;
	while(sondaje.next())
	{
		String idSondaj=sondaje.getString("id");%>
		
		<b><u>
		<% out.print(sondaje.getString("titlu"));%>
		</u></b><br>
		<% String x=sondaje.getString("optiuni");
		Timestamp stopVot=sondaje.getTimestamp("stopSondaj");
		String[] optiuni=x.split(",");

		for(int i=0;i<optiuni.length;i++)
		{ 
		%>
			<br>
			<div class="option"><a href="registerVote.jsp?id_poll=<%=idSondaj%>&id_ans=<%=i %>"><%out.println(optiuni[i]); %></a></div>
		<%	
		}
		%>
		
		<script>countDownDate[<%=indexSondaj%>] = new Date(<% out.print(stopVot.getTime());%>);</script>
		<br><br>
		
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