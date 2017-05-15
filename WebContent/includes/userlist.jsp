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
		<h2><a style="text-decoration: none;"href="../user.jsp?id=<%= users.getString("id_user")  %>"><% out.print(users.getString("name")); %></a></h2>
		
		
		
				
		<form method = "post" class="edit-form" action="EditUser">
			
  				     <input name="username" type="text"  value="<%= users.getString("name") %>">
  					<input name="email" type="text" value="<%= users.getString("email") %>"> 
  					<input name="id" type="hidden" value="<%= users.getString("id_user") %>"> 
                      <button type="submit">Edit</button>
                      
                      </form>
                      
                      
                      
			<form method = "post" class="delete-form" action="DeleteUser">
  				      <input name="username" type="hidden" value="<%= users.getString("name") %>" >
                      <button type="submit">Delete</button>
                      
                      </form>
		
		
		
		
		</div>
		<%
	}
	%>
	
</div>

