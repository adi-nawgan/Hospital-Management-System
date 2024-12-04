<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@include file="/database/Connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			}
		
		%>
</body>
</html>