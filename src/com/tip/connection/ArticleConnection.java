package com.tip.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tip.data.User;

public class ArticleConnection {

	private Connection con;
	private Statement st;
	private ResultSet rs;
	
		public ArticleConnection(){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
				st = con.createStatement();
				
				String sql = ("SELECT * FROM articles; ");
				ResultSet rs = st.executeQuery(sql);
				if(rs.next()) {
					String bdtitle = rs.getString("title");
					
				}

				con.close();
				
			}catch(Exception ex){
				throw new Error(ex);
			}
			
		}
		
		
		
}
