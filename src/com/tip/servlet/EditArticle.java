package com.tip.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tip.connection.SqlConnection;

/**
 * Servlet implementation class EditArticle
 */
@WebServlet("/EditArticle")
public class EditArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditArticle() {
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

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int id = Integer.parseInt(request.getParameter("id"));
		if (!title.equals(null) && !title.equals("") && !title.equals(null) && !title.equals("") ){
			new SqlConnection().editArticle(title, content, id);
			response.sendRedirect("admin.jsp");
		}else{
			request.setAttribute("mesaj", "Nu trebuie sa existe campuri goale!");
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
