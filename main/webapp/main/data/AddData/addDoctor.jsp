<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.time.format.DateTimeFormatter" %>
     <%@page import="java.time.format.DateTimeParseException" %>
    <%@page import="java.time.LocalDateTime" %>
        <%@page import="java.time.LocalDate" %>
<%
String doctorName = "";
int doctorAge = 0;
String doctorSpeciality = "";
Timestamp doctorAdmitDate = null;
String doctorAddress = "";
String doctorPhNo = "";
String workingHours = "";
float doctorSalary = 0;
if(request.getMethod().equalsIgnoreCase("POST"))
{
	if(request.getParameter("doctorName")!=null)
	{
		doctorName =request.getParameter("doctorName");
	}
	if(request.getParameter("doctorAge")!=null)
	{
		doctorAge=Integer.parseInt(request.getParameter("doctorAge"));
	}
	if(request.getParameter("doctorSpeciality")!=null)
	{
		doctorSpeciality=request.getParameter("doctorSpeciality");
	}
	if(request.getParameter("doctorAdmitDate")!=null)
	{

		if( request.getParameter("doctorAdmitDate")!= null && !request.getParameter("doctorAdmitDate").isEmpty()) {
		    try {
		        // Adjusting the format to match the HTML datetime-local value
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		        LocalDateTime localDateTime = LocalDateTime.parse(request.getParameter("doctorAdmitDate"), formatter);
		        
		        // Converting LocalDateTime to Timestamp
		         doctorAdmitDate = Timestamp.valueOf(localDateTime);
		        System.out.println("Parsed Timestamp: " + doctorAdmitDate); // Debugging

		    } catch (DateTimeParseException e) {
		        e.printStackTrace(); // Handle parsing error
		    }
		}
		
	}
	if(request.getParameter("doctorAddress")!=null)
	{
		doctorAddress=request.getParameter("doctorAddress");
	}
	if(request.getParameter("doctorPhNo")!=null)
	{
		doctorPhNo=request.getParameter("doctorPhNo");
	}
	if(request.getParameter("workingHours")!=null)
	{
		workingHours=request.getParameter("workingHours");
	}
	if(request.getParameter("doctorSalary")!=null)
	{
		doctorSalary=Float.parseFloat(request.getParameter("doctorSalary"));
	}
}
out.println("Doctor Name"+doctorName);
out.println("Doctor Age"+doctorAge);
out.println("Doctor Speciality"+doctorSpeciality);
out.println("Doctor Address"+doctorAddress);
out.println("Doctor Ph No"+doctorPhNo);
out.println("Working Hours"+workingHours);
out.println("ADMINT DATE"+doctorAdmitDate);

try{
	ps=con.prepareStatement("INSERT INTO DOCTOR(DOCTOR_NAME,DOCTOR_AGE,DOCTOR_SPECIALITY,DOCTOR_JOINED_DATE,DOCTOR_ADDRESS,DOCTOR_PH_NO,DOCTOR_SALARY) VALUES(?,?,?,?,?,?,?)");
	ps.setString(1,doctorName);
	ps.setInt(2,doctorAge);
	ps.setString(3,doctorSpeciality);
	ps.setTimestamp(4,doctorAdmitDate);
	ps.setString(5,doctorAddress);
	ps.setString(6,doctorPhNo);
	ps.setFloat(7,doctorSalary);
	int sval = ps.executeUpdate();
	if(sval>0)
	{
		System.out.println("Doctor Registered SuccessFull");
		response.sendRedirect(request.getContextPath() +"/Admin#Doctor");
	}
	else
	{
		System.out.println("Doctor Registered UnSuccessFull");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}


%>