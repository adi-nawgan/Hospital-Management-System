<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database Creation | Hospital Management System</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">
</head>
<body>
 <section class="bg-light p-3 p-md-4 p-xl-5">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
              <div class="card border border-light-subtle rounded-4">
                <div class="card-body p-3 p-md-4 p-xl-5">
                  <div class="row">
                    <div class="col-12">
                      <div class="mb-5">
                        <div class="text-center mb-4">
                          <a href="#!">
                          
                          </a>
                        </div>
                        <h2 class="h4 text-center" style="color:rgb(227, 42, 42);">Database Configuration</h2>
                        <h3 class="fs-6 fw-normal text-secondary text-center m-0">Enter your details to configure database</h3>
                      </div>
                    </div>
                  </div>
                  <form action="Dbconfig.jsp" method="POST">
                    <div class="row gy-3 overflow-hidden">
                      <div class="col-12">
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control" name="dbUser" id="dbUser" placeholder="DB USERNAME" required>
                          <label for="dbUser" class="form-label">Database UserName</label>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="form-floating mb-3">
                          <input type="password" class="form-control" name="dbPass" id="dbPass" value="" placeholder="Database Password" required>
                          <label for="dbPass" class="form-label">Database Password</label>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="d-grid">
                          <button class="btn bsb-btn-xl btn-primary" type="submit">Config</button>
                        </div>
                      </div>
                    </div>
                  </form>
                 
</div>
</div>
<%
Connection con ;
PreparedStatement ps;
Statement stmt;
ResultSet rs;
String dbUrl = "jdbc:mysql://localhost:3306";
 String dbUser= request.getParameter("dbUser");
String dbPass = request.getParameter("dbPass"); 

//Writing Username and password to file pass.txt

int result;
//Connecting to Database
try{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
	ps=con.prepareStatement("CREATE USER 'admin' identified with mysql_native_password BY 'admin@123'; ");
	 result = ps.executeUpdate();
	 %>
	 <div class="row gy-2 overflow-hidden">
                    <ul class="list-group list-group-flush">
	 
	 <% 
	 if(result == 0)
	{
		 %>
		 <li class="list-group-item"><span class="badge text-bg-success">User  Created</span>
  		</li>
		 
		 <% 
		
		  
	}
	else
	{
		 %>
		 <li class="list-group-item"><span class="badge text-bg-danger">User Not Created</span>
  		</li>
		 
		 <% 	
	}
	 ps=con.prepareStatement(" GRANT ALL privileges ON *.*  TO 'admin' WITH GRANT OPTION");
	 	int sval = ps.executeUpdate();
	 	if(sval==0)
	 	{
	 		%>
			 <li class="list-group-item"><span class="badge text-bg-success">Privileges Granted</span>
	  		</li>
			 
			 <% 
	 	}
	 	else
	 	{
	 		%>
			 <li class="list-group-item"><span class="badge text-bg-danger">Privileges Not Granted</span>
	  		</li>
			 
			 <% 
	 	}
	 	ps=con.prepareStatement("FLUSH PRIVILEGES");
	 	 sval = ps.executeUpdate();
	 	if(sval==0)
	 	{
	 		%>
			 <li class="list-group-item"><span class="badge text-bg-success">Flushing Privileges</span>
	  		</li>
			 
			 <% 
	 	}
	 	else
	 	{
	 		%>
			 <li class="list-group-item"><span class="badge text-bg-success">NOT Flushing Privileges</span>
	  		</li>
			 
			 <% 
	 	}

	}

catch(Exception e)
{
	e.printStackTrace();
}
dbUser="admin";
dbPass="admin@123";
// Connecting to newly created user
try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
		
		ps=con.prepareStatement("SHOW Databases");
		rs=ps.executeQuery();
		while(rs.next())
		{
			if(rs.getString(1).equals("hospitalmanagement"))
			{
				ps=con.prepareStatement("USE hospitalmanagement");
				int sval = ps.executeUpdate();
				if(sval==0)
				{
					%>
					<div class="alert alert-success position-absolute top-0 start-0 w-100" role="alert">
			    							Using hospital</div>
				
				<%
					System.out.println("Using Database hospital");
				}
				else
				{
					%>
					<div class="alert alert-success position-absolute top-0 start-0 w-100" role="alert">
			    							NOT Using hospital</div>
				
				<%
					System.out.println("Not Using Database hospital");
				} 
			}
			else
			{
				ps=con.prepareStatement("CREATE DATABASE IF NOT EXISTS hospitalmanagement");
				int sval = ps.executeUpdate();
				if(sval==0)
				{
					%>
					<div class="alert alert-success position-absolute top-0 start-0 w-100" role="alert">
			    						NOT	Created  hospital</div>
				
				<%
					System.out.println("NOT CREATED `Database hospital`");
					
				}
				else
				{
					%>
					<div class="alert alert-success position-absolute top-0 start-0 w-100" role="alert">
			    							Created hospital</div>
				
				<%
					System.out.println("CREATED `Database hospital`");
					
				}
			}
		}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
</ul>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
