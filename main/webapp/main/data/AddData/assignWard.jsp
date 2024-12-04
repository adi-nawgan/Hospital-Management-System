<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%
int patientId = 0;
int doctorId = 0;
int staffId = 0;
String wardId = "";
int wardIsAssigned = 0;

if(request.getMethod().equalsIgnoreCase("POST"))
{
	if(request.getParameter("patientId")!=null)
	{
		patientId = Integer.parseInt(request.getParameter("patientId"));
				
	}
	if(request.getParameter("doctorId")!=null)
	{
		doctorId = Integer.parseInt(request.getParameter("doctorId"));
				
	}
	if(request.getParameter("staffId")!=null)
	{
		staffId = Integer.parseInt(request.getParameter("staffId"));
				
	}
	if(request.getParameter("wardId")!=null)
	{
		wardId = request.getParameter("wardId");
				
	}
}

try{
	ps=con.prepareStatement("UPDATE WARD SET PATIENT_ID=?,DOCTOR_ID=?,STAFF_ID=?,WARD_IS_ASSIGNED=? WHERE WARD_ID=?");
	ps.setInt(1,patientId);
	ps.setInt(2,doctorId);
	ps.setInt(3,staffId);
	ps.setInt(4,1);
	ps.setString(5,wardId);
	int sval = ps.executeUpdate();
	if(sval > 0)
	{
		System.out.println("Ward Updated Succesfully");
		response.sendRedirect(request.getContextPath() +"/Admin");
	}
	else
	{
		System.out.println("Ward Updated UnSuccesfully");
	}
	
	
}catch(Exception e)
{
	e.printStackTrace();
}



%>