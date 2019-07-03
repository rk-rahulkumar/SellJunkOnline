<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Price List</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/addPriceList.css" rel="stylesheet"></link>
	</head>
	<body>
		
		 <% 
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");
			if(session.getAttribute("Email")==null)
			{
				response.sendRedirect("AdminLogin.jsp");
			}
			else
			{
		%> 
		
		<div class="sell-junk-header-wrapper dflex-align-item-center">
			<div class="sell-junk-logo dflex-align-item-center dflex-justify-content-left">
				<img src="images/logo.png" alt="Sell Junk Online logo"/>
			</div>
			
			<ul class="top-nav-bar dflex-align-item-center dflex-justify-content-right P0">
				<li >
					<a href="AdminViewRequest.jsp">View-All-Requests</a>
				</li>
				<li>
					<a href="Price-List.jsp">Price-List</a>
				</li>
				<li class="active">
					<a href="AddPriceList.jsp">Add-Price-List</a>
				</li>
				<li>
					<a href="AdminLogout">Log-Out</a>
				</li>
			</ul>
		</div>
		
		<div class="sell-junk-add-pricelist-form-wrapper">
			<h1 class="M0">Add Price List</h1>
			
			<form class="sell-junk-admin-price-list-form" action="AddPriceList" method="post">
				<div class="form-label-input-container">
					<div class="dflex-align-item-center">
						<label class="form-label">Junk Name</label>
						<input id="JunkName" type="text" name="JunkName" placeholder="Enter Junk Name" autofocus class="form-control" required>
					</div>
					
					<div class="dflex-align-item-center price">
						<label class="form-label">Price</label>
						<input id="Price" type="text" name="Price" placeholder="Enter Price" autofocus class="form-control" required>
						<select  id="Unit" name="Unit">
							<option value="KG">/KG</option>
							<option value="PCs">/PCs</option>
						</select>
					</div>
				</div>
				
				<div class="sell-junk-add-pricelist-form-action-wrapper dflex-justify-content-center">
					<input type="submit" value="Add Price" class="btn btn-normal btn-ok">
			   	</div>
			</form>
		</div>
		<%
		}
			%>
		
		
	</body>
</html>