<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Medicine | Hospital Management System</title>
</head>
<body>
<%
		int medicineId = 0;
			if(request.getMethod().equalsIgnoreCase("POST"))
			{
				if(request.getParameter("medicineId")!=null)
				{
					medicineId=Integer.parseInt(request.getParameter("medicineId"));
					out.println("Medicine Id is"+medicineId);
					System.out.println("medicine id is"+medicineId);
				}
			}
			
			
			try{
				ps=con.prepareStatement("DELETE FROM MEDICINE WHERE MEDICINE_ID=?");
				ps.setInt(1,medicineId);
				int sval = ps.executeUpdate();
				if(sval==0)
				{
%>
					
					<div class="alert alert-danger" role="alert">
  					<h4 class="alert-heading">Cannot Delete Medicine : <%=medicineId %></h4>
  					<hr>
  					<p class="mb-0">Redirecting to Admin Please Wait </p>
					</div>
					<% 	
				}
				else
				{
%>
					
					<div class="alert alert-success" role="alert">
  					<h4 class="alert-heading">Succesfully Deleted Medicine : <%=medicineId %></h4>
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