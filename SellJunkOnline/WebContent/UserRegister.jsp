<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User Register</title>
		<link href="css/global.css" rel="stylesheet"></link>
		<link href="css/common.css" rel="stylesheet"></link>
		<link href="css/userRegister.css" rel="stylesheet"></link>
		
		<script type="text/javascript" src="password_validation.js"></script>
		<script type="text/javascript" src="checkValidation.js"></script>
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="state.js"></script>
		
		
	</head>
	<body>
		<div class="sell-junk-header-wrapper dflex-align-item-center">
			<div class="sell-junk-logo dflex-align-item-center dflex-justify-content-left">
				<img src="images/logo.png" alt="Sell Junk Online logo"/>
			</div>
			
			<ul class="top-nav-bar dflex-align-item-center dflex-justify-content-right P0">
				<li>
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
				<li class="active">
					 <a href="UserRegister.jsp">Sign-Up</a>
				</li>
				
			</ul>
		</div>
	
	
		<div class="sell-junk-registration-form-wrapper">
			<h1 class="M0">Create Your Account</h1>
			
			<form action="UserReg" class="sell-junk-registration-form" name="UserRegForm" onsubmit="return checkValidation()" method="post">
				<div class="form-label-input-container">
					<div class="dflex-align-item-center">
						<label class="form-label">Full Name</label>
						<input id="UserName" type="text" name="UserName" placeholder="Enter Full Name" autofocus class="form-control" required>
					</div>
					
					<div class="dflex-align-item-center">
						<label class="form-label">Gender</label>
						<input id="Gender" type="radio" name="Gender" value="Male" autofocus class="form-control radio-btn M0" required >&nbsp; Male
						<input id="Gender" type="radio" name="Gender" value="Female" autofocus class="form-control radio-btn M0" required >&nbsp; Female
						<input id="Gender" type="radio" name="Gender" value="Other" autofocus class="form-control radio-btn M0" required >&nbsp; Other
					</div>
					
					<div class="dflex-align-item-center mobile-number">
						<label class="form-label">Mobile Number</label>
						<span>+91</span>
						<input id="MobileNo" type="text" name="MobileNo" placeholder="Enter Mobile Number"  autofocus class="form-control" required >
					</div>
					
					<div class="dflex-align-item-center">
						<label class="form-label">Email</label>
						<input id="Email" type="text" name="Email" placeholder="Enter Email" autofocus class="form-control"  required>
					</div>
					
					<div class="dflex-align-item-center">
						<label class="form-label">Password</label>
						<input id="Password" type="password" name="Password" placeholder="Enter Password"  class="form-control" onkeyup='check();' required >
					</div>
					
					<div class="dflex-align-item-center confirm-password">
						<label class="form-label">Confirm Password</label>
						<input id="ConfirmPassword" type="password" name="ConfirmPassword" placeholder="Confirm Password"  class="form-control" onkeyup="check();">
                    </div>
                    <p id='message'></p>
					
					<h3 class="form-label address M0">Address</h3>
					
					<div class="dflex-align-item-center M0">
						<label class="form-label">State</label>
						<select id="State" name="State" class="form-control dflex" onchange="selct_district(this.value)" required></select>
						
					</div>
					
					
					<div class="dflex-align-item-center">
						<label class="form-label">City</label>
						<select id="City" name="City" class="form-control"  required >
						<option>SELECT CITY</option>
						</select>
					</div>
					
					
					<div class="dflex-align-item-center">
						<label class="form-label">Street</label>
						<textarea id="Address" name="Address" placeholder="Eg. House no./Flat no. , Society/Apartment name" class="form-control" rows="4" cols="40" required ></textarea>
					</div>
				</div>
				
				<div class="sell-junk-registration-form-action-wrapper dflex-justify-content-center">
			   		<input type="reset" class="btn btn-normal btn-ok submit-btn">
					<input id="Submit" type="submit" value="Sign-Up" class="btn btn-normal btn-ok submit-btn">
			   	</div>
			   	
			   	<div class="sell-junk-registration-form-additional-action dflex-justify-content-center">
			   		<span> Already Register? &nbsp;
					 	<a href="welcome.jsp">Login</a>
					</span>
			   	</div>
			</form>
		</div>
	</body>
</html>