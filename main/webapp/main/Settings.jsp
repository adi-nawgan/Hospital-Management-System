<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <link rel="stylesheet" href="./css/Patient.css">
    <!-- Bootstrap CSS -->  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .output-container {
            display: none;
        }
    </style>
</head>
<body>
<% 

String patientEmail = "";
String patientName = "";
int userpatientId = -1;
HttpSession s=request.getSession(false);
if(s==null || (s.getAttribute("patientEmail")==null && s.getAttribute("patientId")==null))
{
	response.sendRedirect(request.getContextPath()+"/Login");
}
else
{
 patientEmail = (String)s.getAttribute("patientEmail");
 userpatientId =(Integer)s.getAttribute("patientId");
 
 
 try{
		ps=con.prepareStatement("SELECT * FROM PATIENT WHERE PATIENT_ID=?");
		ps.setInt(1,userpatientId);
		rs=ps.executeQuery();
%>
<!-- Dashboard Navigation -->
<div class="container-fluid bg-light p-3">
 <div class="row">
     <div class="col-md-8">
         <h3>Dashboard</h3>
     </div>
     <div class="col-md-4 text-end">
         <h5><span id="patientName"> 
         <%
         if(rs.next())
 		{
 				 patientName=rs.getString("PATIENT_NAME");
 				 out.println(patientName);

         		%></span></h5>
         <div class="dropdown">
             <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                 Settings
             </button>
             <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                 <li><a class="dropdown-item" href="<%=request.getContextPath() +"/Profile" %>">Profile</a></li>
                 <li><a class="dropdown-item" href="<%=request.getContextPath() +"/Patient" %>">Home</a></li>
                 <li><a class="dropdown-item" href="<%= request.getContextPath() + "/Logout"%>">Logout</a></li>
             </ul>
         </div>
     </div>
 </div>
</div>
<div class="container mt-4">
        <div class="card p-4">
        <div class="row mt-4">
                    <div class="col-md-6">
                        <button type="button" class="btn btn-primary w-100 bg-danger border border-danegr">Delete Account</button>
                        <div class="alert alert-danger mt-5" role="alert">
  Warning this is a destructive action once clicked cannot be undone!
</div>
                    </div>
        </div>
        </div>
<%
}
         else
         {
        	 
         }
 }
         catch(Exception e)
         {
        	 e.printStackTrace();
         }
}
%>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
