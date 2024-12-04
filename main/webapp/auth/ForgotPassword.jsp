<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%
String patientEmail = "";
int patientId = -1;
if(request.getMethod().equalsIgnoreCase("POST"))
{
	if(request.getParameter("email")!=null && !request.getParameter("email").isEmpty())
	{
		patientEmail=request.getParameter("email");
	}
}
System.out.println(patientEmail);

%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password | Hospital Management System</title>
</head>
<body>
    <section class="bg-light p-3 p-md-4 p-xl-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                    <div class="card border border-light-subtle rounded-4">
                        <div class="card-body p-3 p-md-4 p-xl-5">
                            <h2 class="h4 text-center" style="color:rgb(227, 42, 42);">Login</h2>
                            <h3 class="fs-6 fw-normal text-secondary text-center m-0">Enter your details to login</h3>

                            <form action="<%= request.getContextPath()+"ForgotPassword"%>" method="POST">
                            <div class="form-floating mb-3 mt-3">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="">
                                    <label for="email">Email</label>
                                </div>
                                <div class="d-grid">
                                    <button class="btn bsb-btn-xl btn-primary" type="submit">Reset Password</button>
                                </div>
                            </form>
                                
                            <hr class="mt-5 mb-4 border-secondary-subtle">
                            <div class="d-flex justify-content-center">
                                <p class="m-0 text-secondary text-center">
                                    <a href="<%=request.getContextPath() +"/Login" %>" class="link-primary text-decoration-none">Login</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%
    String existingEmail = "";
    ps=con.prepareStatement("SELECT LOGIN_ID,USER_EMAIL FROM LOGIN WHERE USER_EMAIL = ?");
    ps.setString(1,patientEmail);
    rs=ps.executeQuery();
    if(rs.next())
    {
    	patientId = rs.getInt("LOGIN_ID");
    	existingEmail=rs.getString("USER_EMAIL");
    	if(patientEmail.equals(existingEmail))
    	{
    	    String to = patientEmail; // Change to recipient's email
    	    String from = "adityanawgan@gmail.com"; // Change to your email
    	    final String username = "adityanawgan@gmail.com"; // Change to your email
    	    final String password = "ykta kmlr rola gxaj"; // Change to your email password

    	    // Set SMTP server properties
    	    Properties properties = new Properties();
    	    properties.put("mail.smtp.auth", "true");
    	    properties.put("mail.smtp.starttls.enable", "true");
    	    properties.put("mail.smtp.host", "smtp.gmail.com");
    	    properties.put("mail.smtp.port", "587");

    	    // Get the Session object
    	    Session s = Session.getInstance(properties,
    	            new javax.mail.Authenticator() {
    	                protected PasswordAuthentication getPasswordAuthentication() {
    	                    return new PasswordAuthentication(username, password);
    	                }
    	            });

    	    try {
    	        // Create a default MimeMessage object
    	        Message message = new MimeMessage(s);

    	        // Set From: header field of the header
    	        message.setFrom(new InternetAddress(from));

    	        // Set To: header field of the header
    	        message.setRecipients(Message.RecipientType.TO,
    	                InternetAddress.parse(to));

    	        // Set Subject: header field
    	        message.setSubject("Password Reset Request");

    	        // Set the actual message
    	        String newPassword = "Patient@123"; // Replace with your logic to generate a new password
    	       
    	        ps=con.prepareStatement("UPDATE LOGIN SET USER_PASS=? WHERE LOGIN_ID=?");
    	        ps.setString(1,newPassword);
    	        ps.setInt(2,patientId);
    	        int sval = ps.executeUpdate();
    	        if(sval > 0)
    	        {
    	        	  message.setText("Dear User ,\n\n" +
    	    	                "You requested to reset your password. Here is your new password: " + newPassword + "\n\n" +
    	    	                "Please change your password after logging in.\n\n" +
    	    	                "Best regards,\n" +
    	    	                "Hospital Management System");

    	    	        // Send message
    	    	        Transport.send(message);

    	    	        System.out.println("Forgot password email sent successfully!");
    	    	        
    	    	        %>
    	   	   	 <div class="w-25 alert alert-success position-absolute top-0" role="alert">
    	   				Email Sent Succesfully !
    	   			</div>
    	   	   		<% 
    	        }
    	        else
    	        {
    	            %>
       	   	   	 <div class="w-25 alert alert-danger position-absolute top-0" role="alert">
       	   				Email Not Sent  !
       	   			</div>
       	   	   		<% 
    	        }
    	           

    	    } catch (MessagingException e) {
    	        e.printStackTrace();
    	    }
    	}
    	else
    	{
    		%>
   	   	 <div class="w-25 alert alert-danger position-absolute top-0" role="alert">
   				User with this email doesnt exist
   			</div>
   	   		<%
    	}
    }
    
    
    
    
    %>
</body>
</html>