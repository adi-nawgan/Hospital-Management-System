<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital Management System - Sign Up</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Bootstrap Icons -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <!-- Custom CSS -->
    <link href="./css/Signup.css" rel="stylesheet" />
  </head>
  <body>
    <div class="container mt-5">
      <div class="row justify-content-center mt-5">
        <div class="col-md-6">
          <div class="card mt-5">
            <div class="card-header text-center mt-5">
              <div class="d-flex align-items-center justify-content-center">
                <div class="icon-container">
                  <i class="bi bi-plus-square-fill fs-2"></i>
                </div>
                <h2 class="mb-0">Hospital Management System</h2>
              </div>
              <p class="mt-2 mb-0">Create your account</p>
            </div>
            <div class="card-body p-4">
              <form method="POST" action="<%=request.getContextPath() +"/Signup" %>" id="signupForm">
                <div class="mb-3">
                  <label for="username" class="form-label">
                    <i class="bi bi-person me-2"></i>Username
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    required
                    name="email"
                  />
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">
                    <i class="bi bi-lock me-2"></i>Password
                  </label>
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    required
                    name="password"
                  />
                </div>
                <div class="mb-3">
                  <label for="confirmPassword" class="form-label">
                    <i class="bi bi-lock-fill me-2"></i>Confirm Password
                  </label>
                  <input
                    type="password"
                    class="form-control"
                    id="confirmPassword"
                    required
                  />
                </div>
                <div
                  id="passwordError"
                  class="text-danger mb-3"
                  style="display: none"
                >
                  Passwords do not match!
                </div>
                <div class="d-grid">
                  <button type="submit" class="btn btn-primary btn-lg">
                    <i class="bi bi-person-plus me-2"></i>Sign Up
                  </button>
                </div>
               <div class="row">
                    <div class="col-12">
                      <hr class="mt-5 mb-4 border-secondary-subtle">
                      <div class="d-flex justify-content-center">
                      <p class="m-0 text-secondary text-center">Already a User<!-- <form action="" method="POST"></form> --> <a href="<%=request.getContextPath() +"/Login" %>" class="link-primary text-decoration-none" name="register"><button type="button" style="border: none; background-color: inherit;"class="m-0 text-primary text-center">Login</button></form></a></p>
                    	</div>
                    </div>
                  </div>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
         <%
         String userEmail = request.getParameter("email");
         String userPass = request.getParameter("password");
         String existingEmail="";
         int isAdmin = 1;
         int isPatient = 0;
         int sval = 0;
        if(userEmail!=null && !userEmail.isEmpty() )
        {
        	try{
           	 ps=con.prepareStatement("SELECT USER_EMAIL FROM LOGIN WHERE USER_EMAIL=?");
           	 ps.setString(1,userEmail);
           	 rs=ps.executeQuery();
           	 while(rs.next())
           	 {
           		 existingEmail=rs.getString("USER_EMAIL");
           		
           	 }
           	 if(existingEmail.equals(userEmail))
           	 {
           		 %>
           		 <div class="alert alert-danger position-absolute top-0" role="alert">
   					User with this email already exists!
   				</div>
   				<%
           	 }
           	 else
           	 {
           		 if(userEmail.equals("admin@hospitalmanagement"))
               	 {
               		 ps=con.prepareStatement("INSERT INTO LOGIN(USER_EMAIL,USER_PASS,IS_ADMIN)VALUES(?,?,?)");
               		 ps.setString(1,userEmail);
               		 ps.setString(2,userPass);
               		 ps.setInt(3,isAdmin);
               		 sval=ps.executeUpdate();
               			 if(sval!=0)
               			 {
               		 %>
               		 <div class="alert alert-success position-absolute top-0" role="alert">
   					Admin Succesfully Registered
   				</div>
               		 <% 
               		 }
               			 else
               			 {
               				 %>
                       		 <div class="alert alert-success position-absolute top-0" role="alert">
           					Admin  Registeration Unsuccesfull
           				</div>
                       		 <% 
               			 }
               		 
               	 }
           		 else
           		 {
           			 ps=con.prepareStatement("SELECT USER_EMAIL FROM LOGIN WHERE USER_EMAIL=?");
                   	 ps.setString(1,userEmail);
                   	 rs=ps.executeQuery();
                   	 while(rs.next())
                   	 {
                   		 existingEmail=rs.getString("USER_EMAIL");
                   		
                   	 }
           			 
           			 
           		 	ps=con.prepareStatement("INSERT INTO LOGIN(USER_EMAIL,USER_PASS,IS_ADMIN)VALUES(?,?,?)");
           		 	ps.setString(1,userEmail);
           		 	ps.setString(2,userPass);
           		 	ps.setInt(3,isPatient);
           		 	
           		 	 sval=ps.executeUpdate();
           		 	if(sval==0)
           		 	{
           		 	%>	
               		 <div class="alert alert-success position-absolute top-0" role="alert">
   					User Succesfulll Registered
   				</div>
               		 <%
           		 		
           		 	}
           		 	else
           		 	{
           		 		%>
           		 		 <div class="alert alert-success position-absolute top-0" role="alert">
        					User Succesfulll Registered
        				</div>
                    		 <%
           		 	}
           		 }
           		 
           	 }
           	 
            }
            catch(Exception e)
            {
           	 e.printStackTrace();
            }
           }
        	
        else{
        	
        	
        }
                  	
         
         
         %>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./js/Signup.js"></script>
  </body>
</html>
