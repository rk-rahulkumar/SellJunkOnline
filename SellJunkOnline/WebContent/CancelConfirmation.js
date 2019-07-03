function confirmation() {
  var r = confirm("Are you sure you want to cancel request");
  if (r == true) {
    return true;
  } else {
	  return false;
  }
}
function confirmationInProgress() {
	  var r = confirm("Are you sure you want to change the status to In-Progress of this request");
	  if (r == true) {
	    return true;
	  } else {
		  return false;
	  }
	}
function confirmationCompleted() {
	  var r = confirm("Are you sure you want to change the status to Completed of this request");
	  if (r == true) {
	    return true;
	  } else {
		  return false;
	  }
	}
function confirmationAppproved() {
	  var r = confirm("Are you sure you want to change the status to Approved of this request");
	  if (r == true) {
	    return true;
	  } else {
		  return false;
	  }
	}
