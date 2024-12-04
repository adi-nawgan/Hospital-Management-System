<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Staff | Hospital Management System</title>
</head>
<body>
<%
		int staffId = 0;
			if(request.getMethod().equalsIgnoreCase("POST"))
			{
				if(request.getParameter("staffId")!=null)
				{
					staffId=Integer.parseInt(request.getParameter("staffId"));
					out.println("Staff Id is"+staffId);
					System.out.println("Staff id is"+staffId);
				}
			}
			
			
			try{
				ps=con.prepareStatement("DELETE FROM STAFF WHERE STAFF_ID=?");
				ps.setInt(1,staffId);
				int sval = ps.executeUpdate();
				if(sval==0)
				{
%>
					
					<div class="alert alert-danger" role="alert">
  					<h4 class="alert-heading">Cannot Delete Staff : <%=staffId %></h4>
  					<hr>
  					<p class="mb-0">Redirecting to Admin Please Wait </p>
					</div>
					<% 	
				}
				else
				{
%>
					
					<div class="alert alert-success" role="alert">
  					<h4 class="alert-heading">Succesfully Deleted Staff : <%=staffId %></h4>
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