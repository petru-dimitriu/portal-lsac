package com.tip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tip.connection.SqlConnection;

/**
 * Servlet implementation class RegisterVote
 */
@WebServlet("/RegisterVote")
public class RegisterVote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterVote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlConnection conn = new SqlConnection();
		int votingPollId = Integer.parseInt(request.getParameter("id_poll"));
		int votingAnswerId = Integer.parseInt(request.getParameter("id_ans"));
		int votingUserId = Integer.parseInt((String)request.getSession().getAttribute("id"));
		
		if (! conn.hasUserVotedFor(votingUserId, votingPollId))
			response.getWriter().append("success");
		else
			response.getWriter().append("already");
		conn.registerVote(votingUserId, votingPollId, votingAnswerId);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
