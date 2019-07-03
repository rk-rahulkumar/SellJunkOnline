<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Contact</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/contact.css" rel="stylesheet"></link>
	</head>
	<body>
		<div class="sell-junk-header-wrapper dflex-align-item-center">
			<div class="sell-junk-logo dflex-align-item-center dflex-justify-content-left">
				<img src="images/logo.png" alt="Sell Junk Online logo"/>
			</div>
			
			<ul class="top-nav-bar dflex-align-item-center dflex-justify-content-right P0">
			<%
			if(session.getAttribute("Email")==null)
			{
			%>
				<li>
					 <a href="AdminLogin.jsp">Admin-Login</a>
				</li>
				<li>
					<a href="About.jsp">About</a>
				</li>
				<li class="active">
					<a href="Contact.jsp">Contact</a>
				</li>
				<li>
					<a href="Price-List.jsp">Price-List</a>
				</li>
				<li>
					<a href="welcome.jsp">Sign-In</a>
				</li>
				<li>
					 <a href="UserRegister.jsp">Sign-Up</a>
				</li>
			<%
			}
			else
			{
			%>
				<li>
					 <a href="UserHome.jsp"  >Home</a>
				</li>
				<li>
					 <a href="UserAddRequest.jsp"  >Add Request</a>
				</li>
				<li>
					 <a href="UserViewRequest.jsp"  >View Request</a>
				</li>
				<li>
					 <a href="UserProfile.jsp"  >Profile</a>
				</li>
				<li>
					<a href="About.jsp">About</a>
				</li>
				<li class="active">
					<a href="Contact.jsp">Contact</a>
				</li>
				<li>
					<a href="UserLogout">Log-Out</a>
				</li>
				<%
				}
				%>
				
			</ul>
		</div>
		
		<div class="sell-junk-contact-detail-wrapper">
			<h1 class="M0">Contact Details</h1>
			
			<div class="contact-label-info-container">
				<div class="dflex-align-item-center">
					<label class="form-label">Company Name </label><span>:</span>
					<span class="info-val text-uppercase">Sell Junk Online</span>
				</div>
				
				<div class="dflex-align-item-center">
					<label class="form-label">Email </label><span>:</span>
					<a class="info-val" href="mailto:SellJunkOnline@gmail.com">SellJunkOnline@gmail.com</a>
				</div>
				
				<div class="dflex-align-item-center">
					<label class="form-label">Customer Care </label><span>:</span>
					<span class="info-val">123456789</span>
				</div>
			</div>
		</div>
	</body>
</html>