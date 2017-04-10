package com.tip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet 
{
    /**
	 * Servlet implementation class Logout
	 */
	private static final long serialVersionUID = 1L;
	public Logout() 
    {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       HttpSession session = request.getSession(false);
       
      
      if (session!=null && session.getAttribute("username")!=null) {
            session.removeAttribute("username");
            session.removeAttribute("password");
           
            request.setAttribute("mesaj", "V-ati deconectat cu succes!");
    	  
           request.getRequestDispatcher("login.jsp").forward(request, response);
    	  session.invalidate();
      }
      else
      {
    	  request.setAttribute("mesaj", "Nu sunteți logat!");
    	  request.getRequestDispatcher("login.jsp").forward(request, response);
      }
    } 
	 

}