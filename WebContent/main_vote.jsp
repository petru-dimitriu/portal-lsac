<link rel="stylesheet" type="text/css" href="style/css/style_headers.css"> 
<link rel="stylesheet" type="text/css" href="style/css/styleVotes.css"> 
 <%@page import="com.tip.connection.SqlConnection, java.sql.*, java.util.*, com.tip.data.*" %>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="js/script.js"></script>

<div id = "innerBody">

	<script> countDownDate = []; // array
	function voteFor(pollId, ansId) {
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4) {
		    	if (this.status == 200)
		    	{
			    	if (this.responseText == "success")
			     		document.getElementById("msg"+ pollId).innerHTML="Votul a fost inregistrat cu succes!";
			    	else
			    		document.getElementById("msg"+ pollId).innerHTML="Votul a fost modificat!";
		    	}
		    	else
		    	{
		    		document.getElementById("msg"+ pollId).innerHTML="...";
		    	}
		    }
		    
		    setTimeout(function(){
		    	document.getElementById("msg"+ pollId).innerHTML = "";
		    },5000);
		    
		  };
		  xhttp.open("GET", "RegisterVote?id_poll=" + pollId + "&id_ans=" + ansId, true);
		  xhttp.send();
		}
	</script>
	
	<% 
	SqlConnection conn = new SqlConnection();
	List<Poll> polls = conn.getPolls(true); 
	int indexSondaj = 0;
	for (Poll poll : polls)
	{
		int idSondaj=poll.getId();%>
		<div class="poll" id="poll<%=idSondaj%>">
		<div id="rightFloater"> AMR: <span id="stop<%=indexSondaj%>"> </span>
			<br><span class="msg" id="msg<%= idSondaj %>"></span>
		</div>
		<h1>
		<% out.print(poll.getTitle());%>
		</h1>
		<%
		
		Timestamp stopVot=poll.getStop();
		
		List<String> options=poll.getOptions();
		int i = 0;
		for(String option: options)
		{ 
			i++;
		%>
			<div class="option"><a href="javascript:voteFor(<%=idSondaj%>,<%=i %>)"><%out.println(option); %></a></div>
			<br>
		<%	
		}
		%>
		
		<script>countDownDate[<%=indexSondaj%>] = new Date(<% out.print(stopVot.getTime());%>);</script>
		
		<div>
		</div>
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