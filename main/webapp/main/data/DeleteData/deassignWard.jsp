<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%

String wardId = "";


if(request.getMethod().equalsIgnoreCase("POST"))
{
	
	if(request.getParameter("wardId")!=null)
	{
		wardId = request.getParameter("wardId");
				
	}
}

try{
	ps=con.prepareStatement("UPDATE WARD SET PATIENT_ID=?,DOCTOR_ID=?,STAFF_ID=?,WARD_IS_ASSIGNED=? WHERE WARD_ID=?");
	/* ps.setInt(1,null);
	ps.setInt(2,null);
	ps.setInt(3,null); */
	ps.setNull(1, java.sql.Types.INTEGER); 
	ps.setNull(2, java.sql.Types.INTEGER); 
	ps.setNull(3, java.sql.Types.INTEGER);
	ps.setInt(4,0);
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