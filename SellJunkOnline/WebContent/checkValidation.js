function checkValidation()
{
	var email = document.forms["UserRegForm"]["Email"];  
	 var val = document.forms["UserRegForm"]["MobileNo"];  
	 var val1=/^\d{10}$/;
	  if (email.value == "")                                   
	  { 
	      window.alert("Please enter a valid e-mail address."); 
	      email.focus(); 
	      return false; 
	  } 
	 
	  if (email.value.indexOf("@", 0) < 0)                 
	  { 
	      window.alert("Please enter a valid e-mail address."); 
	      email.focus(); 
	      return false; 
	  } 
	 
	  if (email.value.indexOf(".", 0) < 0)                 
	  { 
	      window.alert("Please enter a valid e-mail address."); 
	      email.focus(); 
	      return false; 
	  } 
	  
		if (val.value.match(val1)) { 
			return true;   
		} 
		else
			{
			window.alert("Invalid mobile number; must be ten digits in Format +91(xxxxxxxxxx)");
			val.focus();
		    return false;
			}
}