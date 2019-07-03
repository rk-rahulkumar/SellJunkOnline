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
		<meta charset="ISO-8859-1">
		<title>User-Home</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/userHome.css" rel="stylesheet"></link>
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
				
		
		<div class='sell-junk-user-home-wrapper dflex'>
			<aside class="user-actions-container">
				<div class="user-profile-picture">
		            <img src="images/profilex.png" class="img-circle" alt="logo">
		
			        <div class="user-name">
			            <span class="text-uppercase"><%=rs.getString("UserName") %></span>
			        </div> 
			    </div>
			    
			    <ul class="user-actions-menu M0" id="side-menu">
			        <li class="active">
			            <a href="UserHome.jsp">Home</a>
			        </li>
			        <li>
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
			
			<%
				}
			%>
			
			<section>
				<div class="user-home-detail-wrapper">
					<h1 class="M0 text-center">Requests</h1>
					
					<%			
						String sql="select count(*) totalCount,count(Case when status='Completed' then 0 end) completedCount from userpickuprequest where u_id="+u_id+"" ;;
						Statement stmt1=conn.createStatement();
						ResultSet rs1=stmt1.executeQuery(sql);
					
						while(rs1.next()) {
					%>
					<div class="user-home-info-container">
						<div class="dflex-align-item-center">
							<label class="form-label">All Requests :</label>
							<span class="info-val"><%=rs1.getInt("totalCount") %></span>
						</div>
						
						<div class="dflex-align-item-center">
							<label class="form-label">Sell Requests :</label>
							<span class="info-val"><%=rs1.getInt("completedCount") %></span>   
						</div>
					</div>
					
					<%
						}
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
	    		}	catch(Exception e)	{
	    			e.printStackTrace();
				}
			}
		%>
	</body>
</html>