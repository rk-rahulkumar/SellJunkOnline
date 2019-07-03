<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin Login</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/welcome.css" rel="stylesheet"></link>
	</head>

	<body>
		<div class="sell-junk-header-wrapper dflex-align-item-center">
			<div class="sell-junk-logo dflex-align-item-center dflex-justify-content-left">
				<img src="images/logo.png" alt="Sell Junk Online logo"/>
			</div>
			
			<ul class="top-nav-bar dflex-align-item-center dflex-justify-content-right P0">
				<li class="active">
					 <a href="AdminLogin.jsp">Admin-Login</a>
				</li>
				<li>
					<a href="About.jsp">About</a>
				</li>
				<li>
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
			</ul>
		</div>
			
		<div class='sell-junk-online-wrapper'>
			<div class="new-user-register-marquee-container">
				<marquee onmouseover="this.stop();" onmouseout="this.start();">
					<blink> &#9733</blink> Want To Sell Your Junk Online ?  <a href="UserRegister.jsp"> Get Registered</a>
				</marquee>
			</div>
				
			<div class="sell-junk-main-wrapper dflex">
				<div class="sell-junk-info-container dflex-justify-content-left">
					<div>
						<h1 class="M0">  WELCOME TO SELL JUNK ONLINE</h1>
						<h2>Smart way to sell your home junk online</h2>
						<img src="images/home.png" alt="Sell Junk Online Home Image"/> 
					</div>
				</div>
				
				<div class="sell-junk-login-form-container dflex-justify-content-right">
					<div>
						<h2 class="M0">ADMIN LOGIN</h2>
						<form class="sell-junk-login-form" action="AdminLogin" method="post">
							<input id="Email" type="text" name="Email" placeholder="Email" autofocus class="form-control" required>
							<input id="Password" type="password" name="Password" placeholder="Password"  class="form-control" required>
							
							<p class="login-error M0">${message}</p>
							<c:remove var="message" scope="session"/>
							
							<input class="btn btn-normal btn-ok submit-btn" type="submit" value="Login">
						</form>
					</div>
				</div>
			</div>
			
			
			<div class="sell-junk-footer">
				<div>
					<h1>WHY WE ?</h1>
					<ul>
						<li>Book your request by web </li>
						<li>Save your valuable time</li>
						<li>Book your time slot for pickup</li>
						<li>Get verified pickup boy</li>
					</ul>
				</div>
			</div>
		</div>
	</body>

</html>