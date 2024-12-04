<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logging Out</title>
</head>
<body>

</body>
</html>

<%
HttpSession s= request.getSession(false);
String sessionId = s.getId();
if(session!=null)
{
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/Login");

}


%>