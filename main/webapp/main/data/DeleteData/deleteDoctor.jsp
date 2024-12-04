<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Doctor | Hospital Management System</title>
</head>
<body>
<%
		int doctorId = 0;
			if(request.getMethod().equalsIgnoreCase("POST"))
			{
				if(request.getParameter("doctorId")!=null)
				{
					doctorId=Integer.parseInt(request.getParameter("doctorId"));
					out.println("Doctor Id is"+doctorId);
					System.out.println("patient id is"+doctorId);
				}
			}
			
			
			try{
				ps=con.prepareStatement("DELETE FROM DOCTOR WHERE DOCTOR_ID=?");
				ps.setInt(1,doctorId);
				int sval = ps.executeUpdate();
				if(sval==0)
				{
%>
					
					<div class="alert alert-danger" role="alert">
  					<h4 class="alert-heading">Cannot Delete Doctor : <%=doctorId %></h4>
  					<hr>
  					<p class="mb-0">Redirecting to Admin Please Wait </p>
					</div>
					<% 	
				}
				else
				{
%>
					
					<div class="alert alert-success" role="alert">
  					<h4 class="alert-heading">Succesfully Deleted Doctor : <%=doctorId %></h4>
  					<hr>
  					<p class="mb-0">Redirecting to Admin Please Wait </p>
					</div>
					<% 
				}
					response.sendRedirect(request.getContextPath() +"/Admin#Doctor");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		
		%>
</body>
</html>