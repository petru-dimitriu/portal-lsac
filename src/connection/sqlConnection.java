package connection;

import java.sql.*;

public class sqlConnection {
	
	private Connection con;
	private Statement st;
	private ResultSet rs;
	
		public sqlConnection(){
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
				System.out.println("Interogare DB");
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
		
//		public static boolean close(Connection c){
//			try{
//				c.close();
//				return true;
//			}catch(Exception e){
//				return false;
//			}
//		}
		
		
		public static void main(String[] args){
			//sqlConnection conn = new sqlConnection();
			//conn.getData();
		}
}