package com.tip.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		
		public boolean getData(String uname, String pw){
			try{
				
				String query = "select * from users";
				rs = st.executeQuery(query);
				//System.out.println("Interogare DB");
				while(rs.next()){
					String name = rs.getString("name");
					String parola = rs.getString("password");
					if(uname.equals(name) && pw.equals(parola))
					return true;
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
					user.setEmail(rs.getString("email"));
					result.add(user);
				}
			} catch (Exception ex) {
				System.out.println(ex);
				return null;
			}
			return result;
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