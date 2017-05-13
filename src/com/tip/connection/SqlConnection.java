package com.tip.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tip.data.SessionUser;
import com.tip.data.User;

public class SqlConnection {
	
	private Connection con;
	private Statement st;
	private ResultSet rs;
	
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
					Date dbEntryDate = rs.getDate("entryDate");
					if(username.equals(dbName) && password.equals(dbPassword))
					{
						User user = new User();
						SessionUser sessionUser = SessionUser.getInstance();
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
				return result;
			}
			return null;
			} catch (Exception ex)
			{
				System.out.println(ex);
				return null;
			}
		}
		
		
}