<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.tip.connection.SqlConnection, java.sql.*, java.util.*, com.tip.data.*, java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Liga votează!</title>
<meta charset="utf-8">
<link href="style/css/styleVote.css" rel="stylesheet">
</head>
<body>
	<div id="body">

		<%@ include file="menu.jsp"%>

		<%@ include file="header_vote.jsp"%>

		<div id="innerBody">
		
		<h1> Ultimele 5 sondaje incheiate</h1>
		
			<%
				SqlConnection conn = new SqlConnection();
				List<Poll> polls = conn.getPolls(false);
				int indexSondaj = 0;
				for (Poll poll : polls) {
					int idSondaj = poll.getId();
			%>
			<div class="poll" id="poll<%=idSondaj%>">


				<b>
					<%
						out.print(poll.getTitle());
					%>
				</b> incheiat la data de: 
					<%
						out.print(new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date(poll.getStop().getTime())));
					%>
				
				<p>
					<%
						List<String> options = poll.getOptions();
						List<Integer> vals = poll.getValues();
						double sum = 0;
						for (Integer val : vals)
							sum += val;
						for (int i = 0 ; i < options.size(); i++)
						{
							out.print(options.get(i) + " ( " + Math.round((vals.get(i) / sum)) * 100  + "% ) / ");
						}
					%>
				</p>
				<div></div>
			</div>
			<%
				indexSondaj++;
				}
			%>

		</div>

		<%@ include file="footer.jsp"%>


	</div>
</body>
</html>
