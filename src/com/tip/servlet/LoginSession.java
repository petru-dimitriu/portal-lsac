package com.tip.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tip.connection.*;
import com.tip.data.SessionUser;
/**
 * Servlet implementation class LoginSession
 */
@WebServlet("/LoginSession")
public class LoginSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if ((new SqlConnection()).checkLoginInfo(username, password)){
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("id", SessionUser.getInstance().getUser().getId());
			System.out.println("id " + SessionUser.getInstance().getUser().getId());
			response.sendRedirect("article.jsp");
		}else{
			request.setAttribute("mesaj", "Contul este gresit sau nu exista!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		

		
	}

}
