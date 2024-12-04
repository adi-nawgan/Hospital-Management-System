<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.time.format.DateTimeFormatter" %>
     <%@page import="java.time.format.DateTimeParseException" %>
    <%@page import="java.time.LocalDateTime" %>
        <%@page import="java.time.LocalDate" %>
<%
String medicineName = "";
String medicineType = "";
Timestamp expiryDate = null;
int quantity = 0;


if(request.getMethod().equalsIgnoreCase("POST"))
{
	if(request.getParameter("medicineName")!=null)
	{
		medicineName =request.getParameter("medicineName");
	}
	if(request.getParameter("medicineType")!=null)
	{
		medicineType=(request.getParameter("medicineType"));
	}
	if(request.getParameter("quantity")!=null)
	{
		quantity=Integer.parseInt(request.getParameter("quantity"));
	}
	if(request.getParameter("expiryDate")!=null)
	{

		if( request.getParameter("expiryDate")!= null && !request.getParameter("expiryDate").isEmpty()) {
		    try {
		        // Adjusting the format to match the HTML datetime-local value
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		        LocalDateTime localDateTime = LocalDateTime.parse(request.getParameter("expiryDate"), formatter);
		        
		        // Converting LocalDateTime to Timestamp
		         expiryDate = Timestamp.valueOf(localDateTime);
		        System.out.println("Parsed Timestamp: " + expiryDate); // Debugging

		    } catch (DateTimeParseException e) {
		        e.printStackTrace(); // Handle parsing error
		    }
		}
		
	}
	
}


try{
	ps=con.prepareStatement("INSERT INTO MEDICINE(MEDICINE_NAME,MEDICINE_TYPE,QUANTITY,EXPIRY_DATE) VALUES(?,?,?,?)");
	ps.setString(1,medicineName);
	ps.setString(2,medicineType);
	ps.setInt(3,quantity);
	ps.setTimestamp(4,expiryDate);
	
	int sval = ps.executeUpdate();
	if(sval>0)
	{
		System.out.println("MEDICINE Registered SuccessFull");
		response.sendRedirect(request.getContextPath() +"/Admin");
	}
	else
	{
		System.out.println("MEDICINE Registered UnSuccessFull");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}


%>