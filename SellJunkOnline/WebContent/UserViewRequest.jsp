<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="CancelConfirmation.js"></script>
		<meta charset="ISO-8859-1">
		<title>User View  Request</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/userViewRequest.css" rel="stylesheet"></link>
	</head>
	<body>
	
		<%  
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			if(session.getAttribute("Email")==null) {
				response.sendRedirect("welcome.jsp");
			} else {
				int u_id=0;
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
						u_id=rs.getInt("id");
				
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
				
		<div class='sell-junk-view-request-wrapper'>
			<aside class="user-actions-container">
				<div class="user-profile-picture">
		            <img src="images/profilex.png" class="img-circle" alt="logo">
		
			        <div class="user-name">
			            <span class="text-uppercase"><%=rs.getString("UserName") %></span>
			        </div> 
			    </div>
			    
			    <ul class="user-actions-menu M0" id="side-menu">
			        <li>
			            <a href="UserHome.jsp">Home</a>
			        </li>
			        <li>
			        	<a href="UserAddRequest.jsp">Add Request</a>
			        </li>
			        <li class="active">
			        	<a href="UserViewRequest.jsp">View Request</a>
			        </li>
			        <li>
			        	<a href="UserProfile.jsp">Profile</a>
			        </li>
			    </ul>
			</aside>
			<% 
				}/////////////////
			%>  
			
			<section class="sell-junk-request-detail-wrapper">
				<h1 class="M0 text-center">Request Details</h1>
				
				<div class="request-details-container">
					<% 					
						String sql="select * from userpickuprequest where u_id="+u_id+"";
						Statement stmt1=conn.createStatement();
						ResultSet rs1=stmt1.executeQuery(sql);
						if(!rs1.next()) {
					%> 
					<div class="no-result-div dflex-align-item-center dflex-justify-content-center">No Request Found</div>
					 <%
					} else { ////////////////
						rs1.beforeFirst();
						while(rs1.next()) {
						%>
					<div class="dflex-align-item-center request-item">
						<div class="request-item-info-container">
							<div class="request-label-info-container dflex">
								<div class="dflex-align-item-center">
									<label class="form-label">Request Id</label>
									<span class="info-val"><%=rs1.getString("id") %></span> 
								</div>
								
								<div class="dflex-align-item-center">
									<label class="form-label">Address</label>
									<span class="info-val"><%=rs1.getString("Address")%> <%=rs1.getString("City")%> <%= rs1.getString("State") %></span>
								</div>
							</div>
						
							<div class="request-label-info-container dflex">
								<div class="dflex-align-item-center">
									<label class="form-label">Status</label> 
									<span class="info-val"><%=rs1.getString("Status") %></span>
								</div>
								
								<div class="dflex-align-item-center">
									<label class="form-label">Submitted</label>
									<span class="info-val"><%=rs1.getString("Submitted") %></span>
								</div>
							</div>
						
							 <% 
								if(!rs1.getString("Status").equals("Canceled")) {
							%>
							<div class="request-label-info-container dflex">
								<div class="dflex-align-item-center">
									<label class="form-label">Scheduled Date</label>
									<span class="info-val"><%=rs1.getString("PickUpDate") %></span>
								</div>
								
								<div class="dflex-align-item-center">
									<label class="form-label">Time Slot</label>
									<span class="info-val"><%=rs1.getString("Slot") %></span>
								</div>
							</div>
							 <%
							} ////////////////
							%>
						</div>
						
						<div class="request-item-actions-container">
							 <%
								if(!rs1.getString("Status").equals("Canceled")) {
							%>
							<a class="dflex-align-item-center dflex-justify-content-center"  href="UserRequestCancel?id=<%=rs1.getString("id")%>" onclick="return confirmation()">Cancel Request</a>
							<a class="dflex-align-item-center dflex-justify-content-center" href="UserRequestEdit.jsp?id=<%=rs1.getString("id")%>">Edit Request</a> 
							<%
							} else { ////////////
							%>
							<span class="dflex-align-item-center request-cancel-status">Request was canceled</span> 
							<% 
							} /////////////////
						
					
							%> 
						</div>
					</div>
					<% 
						} ///////////
					}//////////////
					%>
				</div>
			</section>
		</div>
		<%
			rs1.close();
		    stmt1.close();
		    rs.close();
		    st.close();
		    conn.close();
		} catch(Exception e) {///////////////////
			e.printStackTrace();
		}
	} ///////////////////
	%> 
	</body>
</html>