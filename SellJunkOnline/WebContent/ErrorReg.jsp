<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Error</title>
</head>
<body>
<%
out.println("<script>alert('OOPS! 404 Error Found : Your Data is Not Added!')</script>");
/* out.println("<h2>OOPS! Your Data is Not Added</h2>");
out.print("<br>");
out.print("<br"
		+ "></body>");
   out.print("</html>"); */
getServletContext().getRequestDispatcher("/welcome.jsp").include(request, response);

%>
</body>
</html>