<div id = "upperNavBar">
        <p>
          <a href="index.jsp">LSAC Iași</a>
        </p>
        <ul>
        <%
        Boolean found;
        String l = "login.jsp";
        String url = request.getRequestURL().toString();
        request.getQueryString();
        found = url.contains(l);
        ;%>
        
        <% String uname = (String)request.getSession().getAttribute("username"); 
        if(uname!=null)
        {%>
          <li id="liArticles"><a href="article.jsp">/articole</a></li>
          <li id="liVote"><a href="vote.jsp">/vot</a></li>
          <li id="liFiles"><a href="files.jsp">/fisiere</a></li>
        </ul>
        
        <ul class = "userTools">
        <li>
        
        <p id="demo"></p>
          <script>
            var myVar = setInterval(myTimer ,0);
            function myTimer() {
                var d = new Date();
                document.getElementById("demo").innerHTML = d.toLocaleTimeString();
            }
            </script>
        
        
        
        </li>
          <li><a href="user.jsp?id=${sessionScope.id}">/${sessionScope.username}</a></li>
          <li><a href="Logout">/ieșire</a></li>
        </ul>
       <%}
        else if(found){ %>
       
       <%}else{%>
    	   <li><a href="login.jsp">Autentificare</a></li>
           
           <ul class = "userTools"> </ul>
        <li>
        
        <p id="demo"></p>
          <script>
            var myVar = setInterval(myTimer ,0);
            function myTimer() {
                var d = new Date();
                document.getElementById("demo").innerHTML = d.toLocaleTimeString();
            }
            </script>
        
        
        
        </li>
      <% }
       %>
</div>