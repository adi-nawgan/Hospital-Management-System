<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Hospital Management System</title>
</head>
<body>
    <section class="bg-light p-3 p-md-4 p-xl-5">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                    <div class="card border border-light-subtle rounded-4">
                        <div class="card-body p-3 p-md-4 p-xl-5 mt-5">
                            <h2 class="h4 text-center" style="color:rgb(227, 42, 42);">Login</h2>
                            <h3 class="fs-6 fw-normal text-secondary text-center m-0">Enter your details to login</h3>

                            <form action="<%= request.getContextPath() +"/Login" %>" method="POST">
                                <div class="form-floating mb-3 mt-3">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                                    <label for="email">Email</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                                    <label for="password">Password</label>
                                </div>
                                <div class="d-grid">
                                    <button class="btn bsb-btn-xl btn-primary" type="submit">Login</button>
                                </div>
                            </form>
							<p class="m-0 text-secondary text-center mt-5">
                                    <a href="<%=request.getContextPath() +"/ForgotPassword"  %>" class="link-primary text-decoration-none">Forgot Password ?</a>
                                </p>
                            <hr class="mt-5 mb-4 border-secondary-subtle">
                            <div class="d-flex justify-content-center">
                                <p class="m-0 text-secondary text-center">New to Hospital Management?
                                    <a href="<%= request.getContextPath() +"/Signup" %>" class="link-primary text-decoration-none">Register</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%
    
    String email = "";
     String pass = "";  
     String existingEmail = "";
     String existingPass = "";
     String patientEmail = "";
     int isAdmin=-1;
     int patientId=-1;
    if(request.getMethod().equalsIgnoreCase("POST"))
    {
    	 if(request.getParameter("email")!=null && !request.getParameter("email").isEmpty())
    	  {	
    		 email = request.getParameter("email");
    	   } 
    	 if(request.getParameter("password")!=null && !request.getParameter("password").isEmpty())
          {	
    	 	pass = request.getParameter("password");
    	  }
   
    try
    {  	
    	ps=con.prepareStatement("SELECT USER_EMAIL,USER_PASS,IS_ADMIN FROM LOGIN WHERE USER_EMAIL=? AND USER_PASS=?");
    	ps.setString(1,email);// check log query here
    	ps.setString(2,pass);
    	rs=ps.executeQuery();
    	
    	if(rs.next())
    	{
    		existingEmail = rs.getString("USER_EMAIL");
    		existingPass = rs.getString("USER_PASS");
    		isAdmin = rs.getInt("IS_ADMIN");
    		out.println(existingEmail);
    		out.println(existingPass);
    	}
    
   	 if(email.equals(existingEmail) && pass.equals(existingPass))
   	 {
    		if(isAdmin == 1)
    		{
    			HttpSession s = request.getSession();
                s.setAttribute("username", "Admin");
                response.sendRedirect(request.getContextPath() + "/Admin");
    		}
    		else if(isAdmin == 0)
    		{
    			System.out.println("IN ELSE");
    			ps=con.prepareStatement("SELECT PATIENT_EMAIL,PATIENT_ID FROM PATIENT WHERE PATIENT_EMAIL=?");
    	    	ps.setString(1,email);
    	    	System.out.println("Email is"+email); // check logpat query here
    	    	rs=ps.executeQuery();
    	    	if(rs.next())
    	    	{
    	    		System.out.println("In while");
    	    		patientEmail = rs.getString("PATIENT_EMAIL");
    	    		patientId = rs.getInt("PATIENT_ID");
    	    		out.println("PATIENT_EMAIL");
    	    		out.println("PATIENT_ID");
    	    	}
    			HttpSession s = request.getSession();
                s.setAttribute("patientEmail",patientEmail);
                s.setAttribute("patientId",patientId);
                response.sendRedirect(request.getContextPath()+"/Patient");
    		}
    		else
    		{
    			/*  response.sendRedirect("./patient-registration.jsp");*/
    		}
    }
    	 if(!pass.equals(existingPass))
    	{
    		%>
    	   	 <div class="w-25 alert alert-danger position-absolute top-0 start-25" role="alert" id="alertbox">
    				Incorrect Password Entered
    			</div>
    	   		<%	
    	}
    	 if(!email.equals(existingEmail))
    	{
    		%>
    	   	 <div class="w-25 alert alert-danger position-absolute top-0 start-25" role="alert" id="alertbox">
    				Incorrect Email Entered
    			</div>
    	   		<%	
    	}
   
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    finally{
    	if(rs!=null && con!=null && ps!=null)
    	{
    		rs.close();
    		con.close();
    		ps.close();
    	}
    }
    }

   
    
     %>
     <script>
     
     </script>
</body>
</html>