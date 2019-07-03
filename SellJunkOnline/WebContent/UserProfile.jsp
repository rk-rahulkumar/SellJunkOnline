<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User Profile</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/userProfile.css" rel="stylesheet"></link>
	</head>
	<body>
	
		<% 
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			if(session.getAttribute("Email")==null) {
				response.sendRedirect("welcome.jsp");
			}
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost/SellJunkOnlinedb";
				String username="root";
				String password="root";
				String Email=(String)session.getAttribute("Email");
				String query="select * from users where Email=?";
				Connection conn=DriverManager.getConnection(url,username,password);
				PreparedStatement st=conn.prepareCall(query);
				st.setString(1,Email);
				ResultSet rs=st.executeQuery();
				while(rs.next()) {
		%>
	
		<div class="sell-junk-header-wrapper dflex-align-item-center">
			<div class="sell-junk-logo dflex-align-item-center dflex-justify-content-left">
				<img src="images/logo.png" alt="Sell Junk Online logo"/>
			</div>
			
			<ul class="top-nav-bar dflex-align-item-center dflex-justify-content-right P0">
				<li>
					<a href="About.jsp">About</a>
				</li>
				<li>
					<a href="Contact.jsp">Contact</a>
				</li>
				<li>
					<a href="UserLogout">Log-Out</a>
				</li>
			</ul>
		</div> 
		
		<div class='sell-junk-user-profile-wrapper'>
			<aside class="user-actions-container">
				<div class="user-profile-picture">
		            <img src="images/profilex.png" class="img-circle" alt="logo">
		
			        <div class="user-name">
			            <span class="text-uppercase"><%=rs.getString("UserName")%></span>
			        </div> 
			    </div>
			    
			    <ul class="user-actions-menu M0" id="side-menu">
			        <li>
			            <a href="UserHome.jsp">Home</a>
			        </li>
			        <li>
			        	<a href="UserAddRequest.jsp">Add Request</a>
			        </li>
			        <li>
			        	<a href="UserViewRequest.jsp">View Request</a>
			        </li>
			        <li class="active">
			        	<a href="UserProfile.jsp">Profile</a>
			        </li>
			    </ul>
    
    
    
    
    
			</aside>
						
			<section>
				<div class="sell-junk-profile-detail-wrapper">
					<h1 class="M0">Personal Information</h1>
					
					<div class="profile-label-info-container">
						<div class="dflex-align-item-center">
							<label class="form-label">Name </label><span>:</span>
							<span class="info-val text-uppercase"><%=rs.getString("UserName") %></span>
						</div>
						
						<div class="dflex-align-item-center">
							<label class="form-label">Gender </label><span>:</span>
							<span class="info-val"><%=rs.getString("Gender") %></span>
						</div>
						
						<div class="dflex-align-item-center">
							<label class="form-label">Mobile Number </label><span>:</span>
							<span class="info-val">+91<%=rs.getString("MobileNo") %></span> 
						</div>
						
						<div class="dflex-align-item-center">
							<label class="form-label">Email </label><span>:</span>
							<span class="info-val"><%=rs.getString("Email") %></span>
						</div>
						
						<div class="dflex-align-item-center">
							<label class="form-label">Default Address </label><span>:</span>
							<span class="info-val"> <%=rs.getString("Address") %> <%=rs.getString("City") %> <%=rs.getString("State") %></span>
						</div>
					</div>
				</div>
			</section>			
		</div>	
	        <% 
	
				}
			
			    rs.close();
			    st.close();
			    conn.close();
			   }
				catch(Exception e) {
			    e.printStackTrace();
			  }
			%> 
	</body>
</html>