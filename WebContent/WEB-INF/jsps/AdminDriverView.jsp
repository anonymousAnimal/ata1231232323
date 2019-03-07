<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	
	

	function modifyDriver(i){
		//hiding editbtn
		document.getElementById('editbtn'+i).style="display:none;";
		//showing savechangesbtn and cancelbtn
		document.getElementById('savebtn'+i).style="display:inline;";
		document.getElementById('cancelbtn'+i).style="display:inline;";
		
		//enabling the fields
		document.getElementById("name"+i).removeAttribute("disabled");
		document.getElementById("street"+i).removeAttribute("disabled");
		document.getElementById("location"+i).removeAttribute("disabled");
		document.getElementById("city"+i).removeAttribute("disabled");
		document.getElementById("state"+i).removeAttribute("disabled");
		document.getElementById("pincode"+i).removeAttribute("disabled");
		document.getElementById("mobileNo"+i).removeAttribute("disabled");
		document.getElementById("licenseNumber"+i).removeAttribute("disabled");
		
	}
	
	function saveChanges(i)
	{
		var id = document.getElementById("driverID"+i).value;
		var name = document.getElementById("name"+i).value;
		var street = document.getElementById('street'+i).value;
		var location = document.getElementById('location'+i).value;
		var city = document.getElementById('city'+i).value;
		var state = document.getElementById('state'+i).value;
		var pincode = document.getElementById('pincode'+i).value;
		var mobile = document.getElementById('mobileNo'+i).value;
		var license = document.getElementById('licenseNumber'+i).value;
		
		var url = "/ATA/Admin/modifyDriver1/?driverID="+id+"&name="+name+"&street="+street+"&location="+location+"&city="+city+"&state="+state+"&pincode="+pincode+"&mobileNo="+mobile+"&licenseNumber="+license;
		window.location.href=url;
	}
	
	function deleteDriver(id){
		var res = confirm("Attention!! this will delete the driver permanently");
		if(!res)
			return;
		window.location.href='/ATA/Admin/dodelDriver/'+id;
		
	}
	
	function cancelEdit(i){
		
		//disabling the fields
		document.getElementById("name"+i).setAttribute("disabled","disabled");
		document.getElementById("street"+i).setAttribute("disabled","disabled");
		document.getElementById("location"+i).setAttribute("disabled","disabled");
		document.getElementById("city"+i).setAttribute("disabled","disabled");
		document.getElementById("state"+i).setAttribute("disabled","disabled");
		document.getElementById("pincode"+i).setAttribute("disabled","disabled");
		document.getElementById("mobileNo"+i).setAttribute("disabled","disabled");
		document.getElementById("licenseNumber"+i).setAttribute("disabled","disabled");
		
		//showing editbtn
		document.getElementById('editbtn'+i).style="display:inline;";
		//hiding savechangesbtn
		document.getElementById('savebtn'+i).style="display:none;";
		//hiding cancelbtn
		document.getElementById('cancelbtn'+i).style="display:none;";
		
	}
</script>


</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"/>

<div class="container-fluid my-5 ">
<div align="right">
<br><button  type="button" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#addDriverModal" >Add Driver</button>
</div>
<table  class="table " >
<thead class="thead-dark">
<tr><th>sno</th><th>DriverID</th><th>Name</th><th>Street</th><th>Location</th><th>City</th><th>State</th><th>Pincode</th><th>MobileNo.</th><th>LicenseNo.</th><th>Edit</th><th>Delete</th></tr>
</thead>
<tbody>

	<c:forEach var="r"  items="${list}" >
		<tr>
		<td>
		${list.indexOf(r)}
		</td>
		<td>
		 <input style="width:100%" type="text" value="${r.driverID}" id="driverID${list.indexOf(r)}" name="driverID" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.name}" id="name${list.indexOf(r)}" name="name" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.street}" id="street${list.indexOf(r)}" name="street" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.location}" id="location${list.indexOf(r)}" name="location" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.city}" id="city${list.indexOf(r)}" name="city" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.state}" id="state${list.indexOf(r)}" name="state" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.pincode}" id="pincode${list.indexOf(r)}" name="pincode" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.mobileNo}" id="mobileNo${list.indexOf(r)}" name="mobileNo" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.licenseNumber}" id="licenseNumber${list.indexOf(r)}" name="licenseNumber" disabled="disabled"/>
		</td>
		<td>
		<button id="editbtn${list.indexOf(r)}" type="button" onclick="modifyDriver('${list.indexOf(r)}')" class="btn btn-outline-warning">Edit</button>
		
		<button style="display:none;" id="savebtn${list.indexOf(r)}"  type="button" onclick="saveChanges('${list.indexOf(r)}')" class="btn btn-primary">Save</button>
		<img style="display:none; img:hover;" id="cancelbtn${list.indexOf(r)}" width="15%"  onclick="cancelEdit('${list.indexOf(r)}')" alt="x" title="cancel" src="/ATA/static/images/close.png">
		</td>
		<td>
		<button  type="button" onclick="deleteDriver('${r.driverID}')" class="btn btn-outline-danger">Delete</button>
		</td>
		</tr>
	</c:forEach>
</tbody>
</table>


<br>
<h3>${msg }</h3>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>


<!-- addDriver Modal -->

<div class="modal fade" id="addDriverModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Enter Details </h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
			<!-- form begin -->
				<form action="/ATA/Admin/addDriver1" method="post">
						<div class="form-group">
						
						<label for="name">Driver Name</label>
						<input class="form-control" id="name" type="text" name="name" required><br>
						
						<label for="street">Street</label>
						<input class="form-control" id="street" type="text" name="street" required><br>
						
						<label for="location">Location</label>
						<input class="form-control" id="location" type="text" name="location" required><br>
						
						<label for="city">City</label>
						<input class="form-control" id="city" type="text" name="city" required><br>
						
						<label for="state">State</label>
						<input class="form-control" id="state" type="text" name="state" required><br>
						
						<label for="pincode">Pincode</label>
						<input class="form-control" id="pincode" type="text" name="pincode" required><br>
						
						<label for="MobileNo">mobile No</label>
						<input class="form-control" id="mobileNo" type="text" name="mobileNo" required><br>
						
						<label for="license">License No</label>
						<input class="form-control" id="license" type="text" name="licenseNumber" required><br>
						
						<button class="btn btn-primary">Add Driver</button>
						
						</div>
					</form>
				<!-- form end -->
				
			</div>

		</div>
	</div>
</div>

<!-- modal end -->


</html>