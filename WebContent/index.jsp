<!DOCTYPE html>
<html>
  <head>
    <title> Liga Studen?ilor Faculta?ii de Automatica ?i Calculatoare din Ia?i </title>
    <meta charset="utf-8">
    <link href ="style/css/style.css" rel ="stylesheet">
  </head>
  <body>
    <div id = "body">
	
		<%@ include file= "menu.jsp" %>
		
		<%@ include file= "user_log.jsp" %>
	
      <%@ include file= "header.jsp" %>
      
      <h3>Welcome ${sessionScope.username}</h3>
      <a href="LoginSession">Logout</a>

      <%@ include file= "main.jsp" %>
      
      <%@ include file= "footer.jsp" %>
      
      
  </div>
  </body>
</html>
