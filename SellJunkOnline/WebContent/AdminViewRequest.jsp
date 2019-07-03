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
		<title>Admin View  Request</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/adminViewRequest.css" rel="stylesheet"></link>
	</head>
	<body>
		 <%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			if(session.getAttribute("Email")==null)
			{
				response.sendRedirect("AdminLogin.jsp");
			}
			else {
		%>
		
		<div class="sell-junk-header-wrapper dflex-align-item-center">
			<div class="sell-junk-logo dflex-align-item-center dflex-justify-content-left">
				<img src="images/logo.png" alt="Sell Junk Online logo"/>
			</div>
			
			<ul class="top-nav-bar dflex-align-item-center dflex-justify-content-right P0">
				<li class="active">
					<a href="AdminViewRequest.jsp">View-All-Requests</a>
				</li>
				<li>
					<a href="Price-List.jsp">Price-List</a>
				</li>
				<li>
					<a href="AddPriceList.jsp">Add-Price-List</a>
				</li>
				<li>
					 <a href="AdminLogout">Log-Out</a>
				</li>
			</ul>
		</div>
		
		<div class='sell-junk-view-request-wrapper'>
			<h1 class="M0 text-center">Request Details</h1>
			<div class="request-details-container">
				 <%					
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String url="jdbc:mysql://localhost/SellJunkOnlinedb";
						String username="root";
						String password="root";
						Connection conn=DriverManager.getConnection(url,username,password);
						String sql="select users.UserName,users.Gender,users.MobileNo,users.Email,userpickuprequest.id,userpickuprequest.Submitted,"
								+"userpickuprequest.PickUpDate,userpickuprequest.Slot,userpickuprequest.Address,userpickuprequest.State,userpickuprequest.City,"
								+"userpickuprequest.Status from userpickuprequest inner join users  where users.id=u_id";
						PreparedStatement st=conn.prepareCall(sql);
						ResultSet rs=st.executeQuery();
						//Statement stmt1=conn.createStatement();
						//ResultSet rs1=stmt1.executeQuery(sql);
						if(!rs.next()) {
				%> 
				
				<div class="no-result-div dflex-align-item-center dflex-justify-content-center">No Request Found</div>
				 <% 
				} else {
					rs.beforeFirst();
					while(rs.next()) {
				%>
				<div class="dflex-align-item-center request-item">
					<div class="request-item-info-container">
						<div class="request-label-info-container dflex">
							<div class="dflex-align-item-center">
								<label class="form-label">User-Name</label>
								<span class="info-val"><%=rs.getString("UserName") %></span> 
							</div>
							
							<div class="dflex-align-item-center">
								<label class="form-label">Gender</label>
								<span class="info-val"><%=rs.getString("Gender") %></span>
							</div>
						</div>
						
						<div class="request-label-info-container dflex">
							<div class="dflex-align-item-center">
								<label class="form-label">User-Mobile-No.</label>
								<span class="info-val"><%=rs.getString("MobileNo") %></span> 
							</div>
							
							<div class="dflex-align-item-center">
								<label class="form-label">User-Email</label>
								<span class="info-val"><%=rs.getString("Email") %></span> 
							</div>
						</div>
						
						<div class="request-label-info-container dflex">
							<div class="dflex-align-item-center">
								<label class="form-label">Request-Id</label>
								<span class="info-val"><%=rs.getString("id") %></span>
							</div>
							
							<div class="dflex-align-item-center">
								<label class="form-label">Submitted</label>
								<span class="info-val"><%=rs.getString("Submitted") %></span> 
							</div>
						</div>
						
						<div class="request-label-info-container dflex">
							<div class="dflex-align-item-center">
								<label class="form-label">PickUpDate</label>
								<span class="info-val"><%=rs.getString("PickUpDate") %></span>
							</div>
							
							<div class="dflex-align-item-center">
								<label class="form-label">Slot</label>
								<span class="info-val"><%=rs.getString("Slot") %></span> 
							</div>
						</div>
						
						<div class="request-label-info-container dflex">
							<div class="dflex-align-item-center">
								<label class="form-label">Address</label>
								<span class="info-val"><%=rs.getString("Address") %> <%=rs.getString("City") %> <%=rs.getString("State") %></span> 
							</div>
							
							<div class="dflex-align-item-center">
								<label class="form-label">Status</label>
								<span class="info-val"><%=rs.getString("Status") %></span>
							</div>
						</div>
						
						
					</div>
					
					<div class="request-item-actions-container">
						<a class="dflex-align-item-center dflex-justify-content-center" id="Cancel" href="AdminChangeRequestStatus?id=<%=rs.getString("id")%>&Status=Canceled" onclick="return confirmation()">Cancel Request</a>  
						<a class="dflex-align-item-center dflex-justify-content-center" id="Approved" href="AdminChangeRequestStatus?id=<%=rs.getString("id")%>&Status=Approved" onclick="return confirmationAppproved()">Approve Request</a> 
						
						<a class="dflex-align-item-center dflex-justify-content-center" id="In_Progress" href="AdminChangeRequestStatus?id=<%=rs.getString("id")%>&Status=In-Progress" onclick="return confirmationInProgress()">In Progress</a>
						<a class="dflex-align-item-center dflex-justify-content-center" id="Completed" href="AdminChangeRequestStatus?id=<%=rs.getString("id")%>&Status=Completed" onclick="return confirmationCompleted()">Complete Request</a> 
						
					</div>
				</div>
				
				 <%
					}	
				}
				%>
			</div>
		</div>
		
		 <%
				rs.close();
		    	st.close();
		    	conn.close();
		  	} catch(Exception e) {
		    	e.printStackTrace();
			}
		}
		%>
	</body>
</html>