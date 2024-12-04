<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.time.format.DateTimeFormatter" %>
     <%@page import="java.time.format.DateTimeParseException" %>
    <%@page import="java.time.LocalDateTime" %>
        <%@page import="java.time.LocalDate" %>
        
<%
String staffName = "";
int staffAge = 0;
String staffDesignation = "";
Timestamp staffAdmitDate = null;
String staffAddress = "";
String staffPhNo = "";
float staffSalary = 0;

if(request.getMethod().equalsIgnoreCase("POST"))
{
	if(request.getParameter("staffName")!=null)
	{
		staffName =request.getParameter("staffName");
	}
	if(request.getParameter("staffAge")!=null)
	{
		staffAge=Integer.parseInt(request.getParameter("staffAge"));
	}
	if(request.getParameter("staffDesignation")!=null)
	{
		staffDesignation=request.getParameter("staffDesignation");
	}
	if(request.getParameter("staffAdmitDate")!=null)
	{

		if( request.getParameter("staffAdmitDate")!= null && !request.getParameter("staffAdmitDate").isEmpty()) {
		    try {
		        // Adjusting the format to match the HTML datetime-local value
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		        LocalDateTime localDateTime = LocalDateTime.parse(request.getParameter("staffAdmitDate"), formatter);
		        
		        // Converting LocalDateTime to Timestamp
		         staffAdmitDate = Timestamp.valueOf(localDateTime);
		        System.out.println("Parsed Timestamp: " + staffAdmitDate); // Debugging

		    } catch (DateTimeParseException e) {
		        e.printStackTrace(); // Handle parsing error
		    }
		}
		
	}
	if(request.getParameter("staffAddress")!=null)
	{
		staffAddress=request.getParameter("staffAddress");
	}
	if(request.getParameter("staffPhNo")!=null)
	{
		staffPhNo=request.getParameter("staffPhNo");
	}
	if(request.getParameter("staffAddress")!=null)
	{
		staffAddress=request.getParameter("staffAddress");
	}
}
out.println(staffName);
out.println(staffAge);
out.println(staffDesignation);
out.println(staffAdmitDate);
out.println(staffAddress);
out.println(staffPhNo);
out.println(staffPhNo);
out.println(staffName);


try{
	ps=con.prepareStatement("INSERT INTO STAFF(STAFF_NAME,STAFF_AGE,STAFF_DESIGNATION,STAFF_ADMIT_DATE,STAFF_ADDRESS,STAFF_PHN_NO,STAFF_SALARY)VALUES(?,?,?,?,?,?,?)");
	ps.setString(1,staffName);
	ps.setInt(2,staffAge);
	ps.setString(3,staffDesignation);
	ps.setTimestamp(4,staffAdmitDate);
	ps.setString(5,staffAddress);
	ps.setString(6,staffPhNo);
	ps.setFloat(7,200000);
	int sval = ps.executeUpdate();
	
	if(sval > 0)
	{
		System.out.println("STAFF REGISTERED SUCCESFULLY");
		response.sendRedirect(request.getContextPath() + "/Admin");
	}
	else
	{
		System.out.println("STAFF REGISTRATION UNSUCCESFULL");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}


%>