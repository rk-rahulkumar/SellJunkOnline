var check = function() {
  if (document.getElementById('Password').value ==
    document.getElementById('ConfirmPassword').value ) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password match';
    document.getElementById("Submit").disabled=false;
    
  } else {
	  
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password not match';
    document.getElementById("Submit").disabled = true;
	  }
  
}