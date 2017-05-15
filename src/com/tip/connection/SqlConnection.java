package com.tip.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tip.data.Article;
import com.tip.data.SessionUser;
import com.tip.data.User;

public class SqlConnection {
	
	private Connection con;
	private Statement st;
	private ResultSet rs;
	PreparedStatement selectUsers;
	PreparedStatement selectArticles;
	PreparedStatement selectSondaje;
	
		public SqlConnection(){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
				st = con.createStatement();
			}catch(Exception ex){
				throw new Error(ex);
			}
		}
		
		public boolean checkLoginInfo(String username, String password){
			try{
				String query = "select * from users";
				rs = st.executeQuery(query);
				while(rs.next()){
					String dbName = rs.getString("name");
					String dbPassword = rs.getString("password");
					String dbEmail = rs.getString("email");
					String dbId = rs.getString("id_user");
					Date dbEntryDate = rs.getDate("entryDate");
					if(username.equals(dbName) && password.equals(dbPassword))
					{
						User user = new User();
						SessionUser sessionUser = SessionUser.getInstance();
						user.setId(dbId);
						user.setName(dbName);
						user.setMail(dbEmail);
						user.setDate(dbEntryDate);
						sessionUser.setUser(user);
						
						return true;
					}
				}
				
			}catch (Exception ex){
				System.out.println(ex);
			}
			return false;
		}
		
		public boolean isUserInDatabase(String username) {
			try{
				String query = "select * from users";
				rs = st.executeQuery(query);
				while(rs.next()) {
					String dbName = rs.getString("name");
					if(username.equals(dbName)) {
						return true;
					}
				}
			}catch (Exception ex){
				System.out.println(ex);
			}
			return false;
		}
		
		public List<User> getUserList() {
			ArrayList<User> result = new ArrayList<User>();
			String query = "select * from users";
			try {
				rs = st.executeQuery(query);
				while(rs.next()){
					User user = new User();
					user.setName(rs.getString("name"));
					user.setMail(rs.getString("email"));
					result.add(user);
				}
			} catch (Exception ex) {
				System.out.println(ex);
				return null;
			}
			return result;
		}
		
		public User getUserInfo(int id)
		{
			try {
			rs = st.executeQuery("select * from users where id_user = " + id);
			while (rs.next())
			{
				User result = new User();
				result.setDate(rs.getDate("entryDate"));
				result.setMail(rs.getString("email"));
				result.setName(rs.getString("name"));
				result.setId(new Integer(id).toString());
				return result;
			}
			return null;
			} catch (Exception ex)
			{
				System.out.println(ex);
				return null;
			}
		}
		public void insertUser(String name, String password, String email) {
			try{
			Statement st = con.createStatement();
			String sql = "INSERT INTO users"
						+ "(name, password, email)"
						+ "values (\""+name+"\", \""+password+"\", \""+email+"\")";
			st.executeUpdate(sql);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		public void addArticle(String title, String content, int id) {
			try{
			Statement st = con.createStatement();
			String sql = "INSERT INTO articles"
						+ "(title, content, user_id)"
						+ "values (\""+title+"\", \""+content+"\", \""+id+"\" )" ;
			st.executeUpdate(sql);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		public ResultSet getUsers(){
			try{
				PreparedStatement selectUsers = con.prepareStatement("SELECT * FROM users");
				rs = selectUsers.executeQuery();					
			}catch (Exception ex){
				System.out.println(ex);
			}
			return rs;
		}
		public void updateUser(String name, String email, int id) {
			try{
			Statement st = con.createStatement();
			String sql = "UPDATE users SET name = " + "\"" +name + "\"" +"," + "email =" + "\"" +email + "\"" + "WHERE id_user = " + id;
			st.executeUpdate(sql);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		public void editArticle(String title, String content, int id) {
			try{
			Statement st = con.createStatement();
			String sql = "UPDATE articles SET title = " + "\"" +title + "\"" +"," + "content =" + "\"" +content + "\"" + "WHERE id = " + id;
			st.executeUpdate(sql);
			st.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		public void deleteUser(String name) {
			try{
			Statement st = con.createStatement();
			String sql = "DELETE FROM users WHERE name = " + "\"" +name + "\"";
			st.executeUpdate(sql);
			st.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		public void deleteArticle(int id) {
			try{
			Statement st = con.createStatement();
			String sql = "DELETE FROM articles WHERE id =" + id;
			st.executeUpdate(sql);
			st.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		public ResultSet getArticles(int id) {
			try {
				selectArticles = con.prepareStatement("SELECT * FROM articles WHERE id = "+ id);
				rs = selectArticles.executeQuery();
			} catch (Exception ex) {
				System.out.println(ex);
			}
			return rs;
		}
		public Article getArticle(int id) {
			Article currentArticle = null;
			try {
				selectArticles = con.prepareStatement("SELECT * FROM articles WHERE id = "+ id);
				rs = selectArticles.executeQuery();
				rs.next();
				currentArticle = new Article();
				currentArticle.setId(rs.getInt("id"));
				currentArticle.setContents(rs.getString("content"));
				currentArticle.setTitle(rs.getString("title"));
				currentArticle.setTimestamp(rs.getTimestamp("postDate"));
				currentArticle.setUserId(rs.getInt("user_id"));
			} catch (Exception ex) {
				System.out.println(ex);
			}
			return currentArticle;
		}
		public ResultSet getArticlesById(int id) {
			try {
				selectArticles = con.prepareStatement("SELECT * FROM articles a WHERE a.user_id= " + id );
				rs = selectArticles.executeQuery();
			} catch (Exception ex) {
				System.out.println(ex);
			}
			return rs;
		}
		public List<Article> getArticles(){
			List<Article> result = null;
			try{
				selectArticles = con.prepareStatement("SELECT * FROM articles");
				rs = selectArticles.executeQuery();
				result = new ArrayList<Article>();
				while (rs.next())
				{
					Article currentArticle = new Article();
					currentArticle.setId(rs.getInt("id"));
					currentArticle.setContents(rs.getString("content"));
					currentArticle.setTitle(rs.getString("title"));
					currentArticle.setTimestamp(rs.getTimestamp("postDate"));
					currentArticle.setUserId(rs.getInt("user_id"));
					result.add(currentArticle);
				}
			}catch (Exception ex){
				System.out.println(ex);
			}
			return result;
		}
		public ResultSet getSondaje(){
			try{
				selectSondaje = con.prepareStatement("SELECT * FROM sondaje");
				rs = selectSondaje.executeQuery();					
			}catch (Exception ex){
				System.out.println(ex);
			}
			return rs;
		}
		public boolean hasUserVotedFor(int userId, int pollId)
		{
			long result = -1;
			Statement statement;
			try {
				statement = con.createStatement();
				ResultSet rs = statement.executeQuery("SELECT COUNT(*) FROM votes WHERE id_user = " + userId + " AND id_poll = " + pollId);
				rs.next();
				result = rs.getLong(1);
				statement.close();
				
			}
			catch (Exception ex)
			{
				System.out.println("Eroare in hasUserVotedFor" + ex);
			}
			
			if (result == 1)
				return true;
			else
				return false;
		}
		public void registerVote(int userId, int pollId, int answerId)
		{
			try {
			Statement statement = con.createStatement();
			if (hasUserVotedFor(userId,pollId))
			{
				statement.executeUpdate("DELETE FROM votes WHERE id_user = " + userId + " AND id_poll = " + pollId);
			}
			String sql = "INSERT INTO votes "
					+ "values ("+userId+", "+pollId+", "+answerId+")";
			statement.executeUpdate(sql);
			statement.close();
			}
			catch (Exception ex)
			{
				System.out.println("Eroare in registerVote:" + ex);
			}
		}
		//		public static boolean close(Connection c){
//			try{
//				c.close();
//				return true;
//			}catch(Exception e){
//				return false;
//			}
//		}
		
		
}