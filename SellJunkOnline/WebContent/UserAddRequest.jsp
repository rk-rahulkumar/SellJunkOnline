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
	<title>Add Request</title>
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="state.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	    <link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/userAddEditRequest.css" rel="stylesheet"></link>
		<script>
			$(function () {
				$("#datepicker").datepicker({
					dateFormat: 'yy/mm/dd',
					minDate:0,
					showOn: "button",
				    buttonImage: "images/calendar-filled.svg",
				    buttonImageOnly: true,
				    buttonText: "Select date"
				});
	        });
			 
			function SetAddressEditMode(isEditMode) {
				if(isEditMode) {
					$("#AddressBlockEditMode").show();
				 	$("#AddressBlockViewMode").hide();
				 	
				 	$("#addressEditModeCancelAction").show();
				 	$("#addressEditAction").hide();
				} else {
					$("#AddressBlockEditMode").hide();
					$("#AddressBlockViewMode").show();
					
					$("#addressEditModeCancelAction").hide();
				 	$("#addressEditAction").show();
				}
			}
			
			function SetDefaultAddress() {
				document.getElementById('Address').value=document.getElementById('Address1').value;
				document.getElementById('State').value=document.getElementById('State1').value;
				selct_district(document.getElementById('State').value);
				setTimeout(function() {
					document.getElementById('City').value=document.getElementById('City1').value;
				},50);
			}
		</script>
	</head>
	<body>
		<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			if(session.getAttribute("Email") == null) {
				response.sendRedirect("welcome.jsp");
			} else {
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
	
		<div class='sell-junk-user-add-request-wrapper dflex'>
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
			        <li class="active">
			        	<a href="UserAddRequest.jsp">Add Request</a>
			        </li>
			        <li>
			        	<a href="UserViewRequest.jsp">View Request</a>
			        </li>
			        <li>
			        	<a href="UserProfile.jsp">Profile</a>
			        </li>
			    </ul>
			</aside>
			
			<section>
				<div class="sell-junk-add-request-form-wrapper">
					<h1 class="M0 text-center">Add Your PickUp Request</h1>
					<form class="sell-junk-add-request-form" action="UserAddRequest" method="post">
						<div class="form-label-input-container">
							<div class="address-block">
								<div class="dflex-align-item-center">
									<h3 class="form-label address M0">Address</h3>
									<div class="address-edit-actions dflex-align-item-center">
										<img id="addressEditAction" class="edit-icon" src="images/edit.svg" alt="editIcon" onclick="isEditMode=true; SetAddressEditMode(isEditMode);">
										<span id="addressEditModeCancelAction" onclick="isEditMode=false; SetAddressEditMode(isEditMode); SetDefaultAddress();" style="display: none;">Cancel</span>
									</div>
								</div>
								
								<div class="dflex-align-item-center" id="AddressBlockViewMode">
									<span class="address-val"><%=rs.getString("Address") %> <%=rs.getString("City") %> <%=rs.getString("State") %></span> 
									
									<input type="hidden" value="<%=rs.getString("Address") %>" name="Address1" id="Address1"> 
									<input type="hidden" value="<%=rs.getString("State") %>" name="State1" id="State1">
									<input type="hidden" value="<%=rs.getString("City") %>" name="City1" id="City1"> 
								</div>
								
								<div id="AddressBlockEditMode" style="display: none;">
									<div class="dflex-align-item-center">
										<label class="form-label">Street</label>
										<input type="text" value="<%=rs.getString("Address") %>" name="Address" id="Address" class="form-control" placeholder="Street"> 
									</div>
									
									<div class="dflex-align-item-center">
										<label class="form-label">State</label>
										<select name="State" id="State"  onchange="selct_district(this.value)" class="form-control"></select>
									</div>
									
									<div class="dflex-align-item-center">
										<label class="form-label">City</label>
										<select name="City" id="City" class="form-control"></select>
									</div>
								</div>
							</div>
						
							<div class="dflex-align-item-center">
								<label class="form-label">Pickup Date</label>
								
								<div class="calendar-input-container">
									<input id=datepicker name="PickUpDate" type="text" autocomplete="off" placeholder="YY/MM/DD" class="form-control" readonly required/>
								</div>
							</div>
						
							<div class="dflex-align-item-center">
								<label class="form-label">Slot</label>
								
								<select class="form-dropdown" name="Slot" id="Slot">
									<option id="Slot1" value="10:00 AM-06:00 PM">10:00 AM-06:00 PM</option>
								</select>
							</div>
							
							<div class="dflex-align-item-center">
								<p>By clicking on submit you agree to our Terms and Conditions.</p>
							</div>
							
						</div>
						<div class="sell-junk-add-request-form-action-wrapper dflex-justify-content-center">
							<input type="submit" value="Submit-Request" class="btn btn-normal btn-ok">
					   	</div>
					</form>
				</div>
			</section>	
		</div>
		
		<%
				}
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