<div id = "upperNavBar">
        <p>
          <a href="/">LSAC Iași</a>
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
          <li id="liArticles">/articole</li>
          <li id="liVote">/vot</li>
          <li id="liFiles">/fișiere</li>
        </ul>
        
        <ul class = "userTools">
          <li>/${sessionScope.username}</li>
          <li><a href="Logout">/ieșire</a></li>
        </ul>
       <%}
        else if(found){ %>
       
       <%}else{%>
    	   <li><a href="login.jsp">Autentificare</a></li>
           </ul>
      <% }
       %>
         
</div>