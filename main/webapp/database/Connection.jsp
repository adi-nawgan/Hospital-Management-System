<%@ page language="java"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="jakarta.servlet.*" %>
<% 

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Statement stmt = null;
	String dbUrl = "jdbc:mysql://localhost:3306";
	String dbUser = "admin";
	String dbPass="admin@123";
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
		
		
				ps=con.prepareStatement("USE hospitalmanagement");
				int sval = ps.executeUpdate();
				if(sval==0)
				{
					
					System.out.println("Using Database hospital");
				}
				else
				{
					System.out.println("Not Using Database hospital");
				} 
			
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}



%>
