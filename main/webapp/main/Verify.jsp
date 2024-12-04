<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%
HttpSession s=request.getSession(false);
String OTP = null;
if(s==null || (s.getAttribute("patientEmail")==null && s.getAttribute("patientId")==null))
{
	response.sendRedirect(request.getContextPath()+"/Login");
}
else
{
	OTP=(String)s.getAttribute("OTP");

	int userOTP = 000000;
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		OTP=(request.getParameter("OTP"));
	}
	
	if(userOTP.equals(OTP))
	{
		response.sendRedirect(request.getContextPath() +"/Patient");
	}
	else
	{
		response.sendRedirect(request.getContextPath() +"/Payment");
	}
}
%> --%>