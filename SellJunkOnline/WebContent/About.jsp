<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 --><!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>About</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/about.css" rel="stylesheet"></link>
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
				<li >
					<a href="AdminLogin.jsp">Admin-Login</a>
				</li>
				<li class="active">
					<a href="About.jsp">About</a>
				</li>
				<li>
					<a href="Contact.jsp">Contact</a>
				</li>
				<li class="">
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
				<li class="active">
					<a href="About.jsp">About</a>
				</li>
				<li>
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
	
		
		<div class="sell-junk-about-info-wrapper">
			<h1 class="M0 text-center">About Sell Junk Online</h1>
			<p>TheSellJunkOnline.com is a product of Liferk. A technology driven company working on SaaS (Software as a Service) based model for the technology platform to make Smart Waste Management system. Our platform helps to find and map assets that streamline the collection of post-consumer waste, schedule efficient & cost-effective pickups and incorporates them into Recycling/vendor network.</p>
			<h3>Innovative Organisation</h3>
			<p>The SELL JUNK ONLLINE is an Innovative organisation providing the facility for people to sell their waste online and user get paid for it. We provide the easiest way to people to sell your waste/scrap at their doorstep for offices, institutions, households and schools to dispose of their waste and further supply this waste to authorized recycling centres, ensuring safety and sustainability.</p>
			<h3>Key Motto</h3>
			<p>We are providing a platform for our customer to book an order from our website. We have verified agents who arrive at customer doorstep as per the scheduled time. Our agents will be armed with eco-friendly carry bags and an electronic weighing machine to give the customer exact weight as transparency is our key motto.</p>
			<h3>Solving loopholes</h3>
			<p>The SELL JUNK ONLLINE enters into online Scrap market to organize the process related to Buy & Sell of waste from the customers online. As there are many loopholes in the existing scrap/kabaad system. We made a wider impact in our flourishing waste management industry by forming our own team and collaborating with all the vendors to form a profitable chain management with a hassle-free online pick up pre-arrangement for our customers through a dedicated website & a vendor purposed mobility solution to crack down nerve free communication between customers and vendors where we have our dedicated team to monitor all the web process for a smooth functioning.</p>
			<h3>Our Concern</h3>
			<p>Our dedicated teamwork on the request and deliver the best service and solution for the request. Buying product online is easy, getting rid of them when it becomes useless/redundant/old is not. We provide the service for the same. We buy old products junk material. We clean house, apartment, city & world. Our concern is to take care of people concern i.e. Clean India Digital India.</p>
		</div>
	</body>
</html>