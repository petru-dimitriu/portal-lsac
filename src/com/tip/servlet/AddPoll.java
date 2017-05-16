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
@WebServlet("/AddPoll")
public class AddPoll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPoll() {
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
		
		String title = request.getParameter("title");
		String options = request.getParameter("options");
		String date = request.getParameter("date");

		
		if (! ((String)request.getSession().getAttribute("username")).equals("admin") )
			return;
		
		SqlConnection conn = new SqlConnection();
		conn.addPoll(title, options, date);
		
		response.getWriter().append("success");
		
	}

}
