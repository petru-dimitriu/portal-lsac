<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href ="style/css/style.css" rel ="stylesheet">
    <link href ="style/css/styleFirst.css" rel="stylesheet">
    <style>
footer{
position: fixed;
bottom: 0;
    left: 0;
    right:0;
  padding: 1rem;
  background-color: #efefef;
  text-align: center;
}
#authForm{
position: absolute;
top: 25%;
left:40%;
background-color:green;
padding: 50px;}

form input{
    border-radius: 5px;
    border-color: transparent;
}

</style>
    
</head>
<body>
<div id = "body">
    <%@ include file= "menu.jsp" %>
	
	<% String un = (String)request.getSession().getAttribute("username"); 
        if(un!=null)
        { %> <h2>Sunteti deja logat! Veti fi redirectat catre pagina principala</h2>
        	<META http-equiv="refresh" content="3;URL=/">
        	<%
        }else{%>
	

	<div id = "innerBodyLogin">
		<div id="authForm">
                <div id = "title" >
                      Autentificare
                </div>
                <br>
               
                    <form method = "post" action="LoginSession">
                    ${mesaj} 
                      <div style="width: 60%; margin: 0 auto;">
                      <div class="form-group">
  				      <p>Nume</p>
  				      <input class="form-control" name="username" id="inputdefault" type="text">
  				    </div>
  				    
                      <div class="form-group">
  				      <p>Parola</p>
  				      <input class="form-control" name="password" id="inputdefault" type="password">
  				    </div>
                      <button type="submit" class="btn btn-primary style="margin: 0 auto;"">Login</button>
                      </div>
                      </form>
                      </div>
            </div>
            
			
	<% }%>


<footer>
    <div id = "innerBody">
    <p align="center"> Nu esti inregistrat? Inregistrarea se face de catre <a href="#">administratorul</a> site-ului si este disponibila doar pentru membrii LSAC.</p>
        </div>
    </footer>
</div>
</body>
</html>