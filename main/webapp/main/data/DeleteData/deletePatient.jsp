<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Patient | Hospital Management System</title>
</head>
<body>
<%
		int patientId = 0;
			if(request.getMethod().equalsIgnoreCase("POST"))
			{
				if(request.getParameter("patientId")!=null)
				{
					patientId=Integer.parseInt(request.getParameter("patientId"));
					out.println("patient id is"+patientId);
					System.out.println("patient id is"+patientId);
				}
			}
			
			
			try{
				ps=con.prepareStatement("DELETE FROM PATIENT WHERE PATIENT_ID=?");
				ps.setInt(1,patientId);
				int sval = ps.executeUpdate();
				if(sval==0)
				{
%>
					
					<div class="alert alert-danger" role="alert">
  					<h4 class="alert-heading">Cannot Delete Patient : <%=patientId %></h4>
  					<hr>
  					<p class="mb-0">Redirecting to Admin Please Wait </p>
					</div>
					<% 	
				}
				else
				{
%>
					
					<div class="alert alert-success" role="alert">
  					<h4 class="alert-heading">Succesfully Deleted Patient : <%=patientId %></h4>
  					<hr>
  					<p class="mb-0">Redirecting to Admin Please Wait </p>
					</div>
					<% 
				}
					response.sendRedirect(request.getContextPath() +"/Admin");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		
		%>
</body>
</html>