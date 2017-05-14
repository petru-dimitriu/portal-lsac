<%@page import="com.tip.connection.*, java.sql.*" %>
<br>
<div id = "innerBody">

	<%
	new SqlConnection().insertUser("aoe", "e0a@a");
	ResultSet users = new SqlConnection().getUsers();
	while(users.next()){%>
		<div id="userBox">
		<a href="../user.jsp?id=<%= users.getString("id_user")  %>"><% out.print(users.getString("name")); %></a>
		</div>
		<%
	}
	%>
	
</div>

