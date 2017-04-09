<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title> Liga Studenților Facultății de Automatică și Calculatoare din Iași </title>
    <link href ="style/css/style.css" rel ="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>
    <div id = "body">
     
	
	
	  <%@ include file= "menu.jsp" %>
      
      <%@ include file= "user_log.jsp" %>
      <div id="login_form">
          <div id = "innerBodyLogin">
              <div id = "title" >
                    Autentificare
              </div>
              <br>
                  <form method = "post">
                    <div class="form-group">
				      <p>Nume</p>
				      <input class="form-control" id="inputdefault" type="text">
				    </div>
				    
                    <div class="form-group">
				      <p>Parola</p>
				      <input class="form-control" id="inputdefault" type="password">
				    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                    
                    </form>
          
          </div>
    </div>
    
    <footer>
    <div id = "innerBody">
    <p align="center"> Nu ești înregistrat? Înregistrarea se face de către <a href="#">administratorul</a> site-ului și este disponibilă doar pentru membrii LSAC.</p>
        </div>
    </footer>
    
  </div>
 
  
   
  </body>
</html>
