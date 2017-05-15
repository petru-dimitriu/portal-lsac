package com.tip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tip.connection.SqlConnection;

/**
 * Servlet implementation class AddArticle
 */
@WebServlet("/AddArticle")
public class AddArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArticle() {
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
		
		SqlConnection connection = new SqlConnection();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userId = Integer.parseInt(request.getParameter("id"));
		int articleId = Integer.parseInt(request.getParameter("articleId"));
		
		if (articleId != -1)
			connection.deleteArticle(articleId); // sterge articolul daca exista deja (il editam)
		
		if (!title.equals(null) && !title.equals("") && !content.equals(null) && !content.equals("") && userId!=0){
			{
				if (articleId == -1)
				{
					connection.addArticle(title, content, userId);
					response.sendRedirect("articles.jsp");
				}
				else
				{
					connection.addArticle(title, content, userId, articleId);
					response.sendRedirect("articles.jsp");
				}
			}
		}else{
			request.setAttribute("mesaj", "Nu trebuie sa existe campuri goale!");
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
