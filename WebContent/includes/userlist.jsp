<%@page import="com.tip.connection.*, java.sql.*" %>
<br>
<div id = "innerBody">
<%!
	public class User {
		
		private Connection con;
		private Statement st;
		private ResultSet rs;
		PreparedStatement selectUsers; 
			public User(){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
					selectUsers = con.prepareStatement("SELECT * FROM users");
				}catch(Exception ex){
					throw new Error(ex);
				}
			}
			
			public ResultSet getUsers(){
				try{
					rs = selectUsers.executeQuery();					
				}catch (Exception ex){
					System.out.println(ex);
				}
				return rs;
			}
			
		public void insertUser(String name, String email) {
			try{
			Statement st = con.createStatement();
			System.out.println("!");
			String sql = "INSERT INTO users"
						+ "(name, email)"
						+ "values (\""+name+"\", \""+email+"\")";
			int result = st.executeUpdate(sql);
			System.out.println(result);
			}catch(Exception e){
				System.out.println("??");
				e.printStackTrace();
			}
			
		}
	}

%>
	
	<%
	new User().insertUser("nutzu", "email@a");
	User user = new User();
	ResultSet users = user.getUsers();
	while(users.next()){%>
		<div id="userBox">
		<a href="../user.jsp?id=<%= users.getString("id_user")  %>"><% out.print(users.getString("name")); %></a>
		
		
		</div>
		<%
	}
	%>
	
	
	
	
</div>

