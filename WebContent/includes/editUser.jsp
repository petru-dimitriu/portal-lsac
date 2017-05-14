<%
String id = request.getParameter("uid");
String user = request.getParameter("uname");
String email  = request.getParameter("email");
%>

<form method='POST' action=''>
        <p>
            <input type='text' name='cid' value='${sessionScope.uname}' />
          <input type='text' name='uid' value='user' />
          <input type='text' name='email' value='email' />
          <button name='commentSubmit' type='submit'>Submit</button>
        </p>
      </form>