<%@page import="com.tip.connection.SqlConnection, java.sql.*, java.util.*, com.tip.data.*"%>

<script>
function deleteArticle(id) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
				if (this.responseText == "success")
				{
					$("#b3").click(); // reload
				}
					
		}
	};
	xhttp.open("GET", "DeletePoll?id=" + id, true);
	xhttp.send();
}
</script>

<h1> Sondaje </h1>
<table>
<%

if(session.getAttribute("id") != null && session !=null){

SqlConnection connection = new SqlConnection();
List<Poll> polls = connection.getPolls(true); // get active polls 
polls.addAll(connection.getPolls(false)); // get inactive polls

for (int i = 0; i < polls.size(); i++)
{
	String optionsList = "";
	for (String s : polls.get(i).getOptions())
	{
		optionsList += s + ",";
	}
	optionsList = optionsList.substring(0, optionsList.length()-1);
	%>
	
	<tr>
	<td> <%= polls.get(i).getTitle() %> </td>
	<td> <%= polls.get(i).getStart() %> </td>
	<td> <%= polls.get(i).getStop() %> </td>
	<td> <%= optionsList %> </td>
	<td> <a href="javascript:deleteArticle(<%= polls.get(i).getId() %>)"> Eliminare </a></td>
	</tr>
	
	<%
}
%>
</table>

<%}else{
		response.sendRedirect("notLogged.jsp");
	}%>

