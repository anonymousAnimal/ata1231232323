<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/Basic1.css" />
 -->
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta content="UTF-8">
<title>Profile</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#editbtn').on("click",function(){ 
		$("input:not('#userID')").removeAttr("disabled");
		$(this).css("display","none");
		$('#savebtn').css("display","inline");
		$("#cancelbtn").css("display","inline");
	})
	
	/* $('#savebtn').on("click",function(){
		var url="/ATA/User/editProfile/?";
		$("input[name]").each(function(i, obj){
			url += $(this).attr("name") +"="+ $(this).prop("value")+"&";
		});
		url.slice(0,-1); // for removing the last &
		console.log(url);
		window.location.href=url;
	}) */
	
	$('#cancelbtn').on("click",function(){
		$("input:not('#userID')").attr("disabled","disabled");
		
		$(this).css("display","none");
		$('#savebtn').css("display","none");
		$("#editbtn").css("display","inline");
	})
	
});



/* function editChanges()
{
	//hiding edit btn
	document.getElementById("editbtn").style="display:none";
	//showing save and cancel btn
	document.getElementById("savebtn").style="display:inline";
	document.getElementById("cancelbtn").style="display:inline";
	
	
	document.getElementById("firstName").removeAttribute("disabled");
	document.getElementById("lastName").removeAttribute("disabled");
	document.getElementById("dateOfBirth").removeAttribute("disabled");
	document.getElementById("gender").removeAttribute("disabled");
	document.getElementById("street").removeAttribute("disabled");
	document.getElementById("location").removeAttribute("disabled");
	document.getElementById("city").removeAttribute("disabled");
	document.getElementById("state").removeAttribute("disabled");
	document.getElementById("pincode").removeAttribute("disabled");
	document.getElementById("mobileNo").removeAttribute("disabled");
	document.getElementById("emailID").removeAttribute("disabled");
}
function saveChanges()
{
	var userID=document.getElementById("userID").value;
	console.log(userID);
	var firstName=document.getElementById("firstName").value;
	var lastName=document.getElementById("lastName").value;
	var dateOfBirth=document.getElementById("dateOfBirth").value;
	var gender=document.getElementById("gender").value;
	var street=document.getElementById("street").value;
	var location=document.getElementById("location").value;
	var city=document.getElementById("city").value;
	var state=document.getElementById("state").value;
	var pincode=document.getElementById("pincode").value;
	var mobileNo=document.getElementById("mobileNo").value;
	var emailID=document.getElementById("emailID").value;
	var url="/ATA/User/editProfile/?userID="+userID+"&firstName="+firstName+"&lastName="+lastName+"&dateOfBirth="+dateOfBirth+"&gender="+gender+"&street="+street+"&location="+location+"&city="+city+"&state="+state+"&pincode="+pincode+"&mobileNo="+mobileNo+"&emailID="+emailID;
	window.location.href=url;
}
function cancelChanges()
{
	document.getElementById("cancelbtn").style="display:none";
	document.getElementById("savebtn").style="display:none";
	document.getElementById("editbtn").style="display:inline";
	
	
	document.getElementById("firstName").removeAttribute("disabled","disabled");
	document.getElementById("lastName").removeAttribute("disabled","disabled");
	document.getElementById("dateOfBirth").removeAttribute("disabled","disabled");
	document.getElementById("gender").removeAttribute("disabled","disabled");
	document.getElementById("street").removeAttribute("disabled","disabled");
	document.getElementById("location").removeAttribute("disabled","disabled");
	document.getElementById("city").removeAttribute("disabled","disabled");
	document.getElementById("state").removeAttribute("disabled","disabled");
	document.getElementById("pincode").removeAttribute("disabled","disabled");
	document.getElementById("mobileNo").removeAttribute("disabled","disabled");
	document.getElementById("emailID").removeAttribute("disabled","disabled");
	
} */

</script>

</head>
<body>


<jsp:include page="/HeaderUser.jsp"></jsp:include>



<div class="container">
<h2>Your Profile : </h2>

<form action="/ATA/User/editProfile"  method="POST">

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">User ID</label>
<div class="col-lg-6">
<input type="text" name="userID" id="userID" class="form-control" value="${profileBean.userID}" style="width: 100%" readonly="readonly">
</div>
</div>


<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">FirstName</label>
<div class="col-lg-6">
<input type="text" name="firstName"id="firstName" class="form-control" value="${profileBean.firstName}" style="width: 100%" disabled="disabled" >
</div>
</div>


<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">LastName</label>
<div class="col-lg-6">
<input type="text" name="lastName"id="lastName" class="form-control" value="${profileBean.lastName}" style="width: 100%" disabled="disabled">
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">Dateofbirth</label>
<div class="col-lg-6">
<input type="date" name="dateOfBirth"  id="dateOfBirth" class="form-control" value="${profileBean.dateOfBirth}" style="width: 100%" disabled="disabled">
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">Gender</label>
<div class="col-lg-6">
<input type="text" name="gender"id="gender" class="form-control" value="${profileBean.gender}" style="width: 100%" disabled="disabled">
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">Street</label>
<div class="col-lg-6">
<input type="text" name="street" id="street" class="form-control" value="${profileBean.street}" style="width: 100%" disabled="disabled">
</div>
</div>


<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">Location</label>
<div class="col-lg-6">
<input type="text" name="location"id="location" class="form-control" value="${profileBean.location}" style="width: 100%" disabled="disabled">
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">City</label>
<div class="col-lg-6">
<input type="text" name="city" id="city" class="form-control" value="${profileBean.city}" style="width: 100%" disabled="disabled" >
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">State</label>
<div class="col-lg-6">
<input type="text" name="state" id="state" class="form-control" value="${profileBean.state}" style="width: 100%" disabled="disabled">
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">Pincode</label>
<div class="col-lg-6">
<input type="text" name="pincode" id="pincode" class="form-control" value="${profileBean.pincode}" style="width: 100%" disabled="disabled" >
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">Mobile No</label>
<div class="col-lg-6">
<input type="text" name="mobileNo" id="mobileNo" class="form-control" value="${profileBean.mobileNo}" style="width: 100%" disabled="disabled">
</div>
</div>

<div class="form-group row pt-3">
<label  class="col-lg-1 col-form-label form-control-label">EmailID</label>
<div class="col-lg-6">
<input type="text" name="emailID" id="emailID" class="form-control" value="${profileBean.emailID}" style="width: 100%" disabled="disabled">
</div>
</div>



<button type="submit" style="display:none;" id="savebtn"  class="btn btn-primary">Save</button>

		
</form>

<button  id="editbtn" class="btn btn-warning">Edit</button>
<button style="display:none;" id="cancelbtn"  class="btn btn-danger">Cancel</button>

</div>
</body>
</html>