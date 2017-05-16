package com.tip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tip.connection.SqlConnection;

/**
 * Servlet implementation class DeleteArticle
 */
@WebServlet("/DeletePoll")
public class DeletePoll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePoll() {
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
		
		int pollId = Integer.parseInt(request.getParameter("id"));
		if (pollId == 0 || request.getSession().getAttribute("id") == null)
			return;
		
		if (! request.getSession().getAttribute("username").equals("admin"))
			return;
		SqlConnection conn = new SqlConnection();
		conn.deletePoll(pollId);
		response.getWriter().append("success");			
	}

}
