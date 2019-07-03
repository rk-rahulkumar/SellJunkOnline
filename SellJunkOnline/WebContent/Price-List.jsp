<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Price List</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/priceList.css" rel="stylesheet"></link>
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
				<li>
					<a href="Contact.jsp">Contact</a>
				</li>
				<li class="active">
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
					<li >
					<a href="AdminViewRequest.jsp">View-All-Requests</a>
					</li>
					<li class="active">
					<a href="Price-List.jsp">Price-List</a>
					</li>
					<li>
					<a href="AddPriceList.jsp">Add-Price-List</a>
					</li>
					<li>
					<a href="AdminLogout">Log-Out</a>
					</li>
				<%
				}
				%>
			</ul>
		</div>
		
		<div class="sell-junk-online-pricelist-table-wrapper overflow-table-container">
			<table class="sell-junk-online-pricelist-table">
				<caption><span>Price List</span></caption>
				<colgroup>
			        <col style="width:40%">
			        <col style="width:30%">
			        <col style="width:30%">
			    </colgroup>
				<thead>
					<tr>
						<th class="text-center">JUNK NAME</th>
						<th class="text-center">PRICE</th>
						<th class="text-center">UNIT</th>
					</tr>
				</thead>
				
				<tbody>
					
				 
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/SellJunkOnlinedb";
			String username="root";
			String password="root";
			String query="select * from PriceList order by JunkName";
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			if(!rs.next()){
				%>
				 <tr class="no-result-tr">
				 	<td colspan="3" class="text-center">No Results Found</td>
				 </tr>
			<% 	
			}
			else
			{
				rs.beforeFirst();
				while(rs.next()) {
		%>	
				<tr> 
				    <td class="text-center"><%=rs.getString("JunkName") %></td>
				    <td class="text-center"><%=rs.getString("Price") %></td>
				    <td class="text-center"><%=rs.getString("Unit") %></td>
				 </tr>
				 
				 
		<%
				}
			}
		%>
			</tbody>
		</table>
	</div>
		<%
		    rs.close();
		    stmt.close();
		    conn.close();
		} catch(Exception e) {
		    e.printStackTrace();
		}
		%>
	</body>
</html>