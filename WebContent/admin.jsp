<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
    <title> Liga Studenților Facultății de Automatică și Calculatoare din Iași </title>
    <meta charset="utf-8">
    <link href ="style/css/style.css" rel ="stylesheet">
    
    <style>
	#admin_buttons{ 
	margin:0 auto;
	}
	</style>
	
  </head>
  <body>
    <div id = "body">
	
	<%@ include file= "menu.jsp" %>
	
      <%@ include file= "header_article.jsp" %>






<div id = "innerBody">

	<div id="admin_buttons">
	<button>Administrare utilizatori</button>
	<button>Adaugare articole</button>
	<button>Administrare galerie</button>
	<button>Administrare poll</button>
	</div>
</div>
<br>

<%@ include file= "includes/adduser.jsp" %>
<%@ include file= "includes/userlist.jsp" %>
	
	
	
	


	
      
</div>
      
      
      
      
      
      
      
      
      
      <%@ include file= "footer.jsp" %>
      
      
  </div>
  </body>
</html>
