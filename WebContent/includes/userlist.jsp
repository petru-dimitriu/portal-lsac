<%@page import="com.tip.connection.SqlConnection, java.sql.*" %>
<br>
<div id = "innerBody">

	<input type="button" id="b0" value="Adaugare utilizator nou">
	<script type=text/javascript>
$(document).ready(function(){
	$("#b0").click(function(){
		$("#target").load("includes/adduser.jsp");
	});
});
</script>
	<%ResultSet users = new SqlConnection().getUsers();%>
	<h1 style="text-align:center">Utilizatori inregistrati</h1>
	<%while(users.next()){%>
		<div id="userBox">
		<a href="../user.jsp?id=<%= users.getString("id_user")  %>"><% out.print(users.getString("name")); %></a>
		
		
		
		<form method = "post" class="edit-form" action="EditUser">
  				      <input name="username" type="hidden" >
  				      <input name="email" type="hidden" >
                      <button type="submit">Edit</button>
                      </form>
		<form method = "post" class="delete-form" action="DeleteUser">
  				      <input name="username" type="hidden" >
  				      <input name="email" type="hidden" >
                      <button type="submit">Delete</button>
                      
                      </form>
		
		
		
		
		</div>
		<%
	}
	%>
	
</div>

