package com.tip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tip.connection.SqlConnection;
import com.tip.data.Article;

/**
 * Servlet implementation class DeleteArticle
 */
@WebServlet("/DeleteArticle")
public class DeleteArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int articleId = Integer.parseInt(request.getParameter("id"));
		if (articleId == 0 || request.getSession().getAttribute("id") == null)
			return;
		
		int userId = Integer.parseInt((String)request.getSession().getAttribute("id"));
		SqlConnection conn = new SqlConnection();
		
		Article article = conn.getArticle(articleId);
		if (article.getUserId() == userId || ((String)request.getSession().getAttribute("username")).equals("admin"))
		{
			conn.deleteArticle(articleId);
			response.getWriter().append("success");			
		}
	}

}
