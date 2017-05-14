<%@page import="com.tip.connection.*, java.sql.*" %>
<div id = "innerBody">
	<h1>Adaugarea unui utilizator nou</h1>
		<form method = "post" action="AddUser">
                    
                      <div style="width: 60%; margin: 0 auto;">
                      
  				      <p>Nume</p>
  				      <input name="username" type="text" required>
  				      <input name="password" type="hidden">
  				      <p>Email</p>
  				      <input name="email" type="email" required>
  				      <br>
  				      <br>
                      <button type="submit">Submit</button>
                      </div>
                      </form>
</div>