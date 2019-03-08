<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<script type="text/javascript" >

function  modifyvehicle(id)
{
	document.getElementById("edit"+id).style="display:none";
	document.getElementById("save"+id).style="display:inline";
	document.getElementById("cancel"+id).style="display:inline";
	
	document.getElementById("name"+id).removeAttribute("disabled"); 
	document.getElementById("type"+id).removeAttribute("disabled"); 
	document.getElementById("registrationNumber"+id).removeAttribute("disabled"); 
	document.getElementById("seatingCapacity"+id).removeAttribute("disabled"); 
	document.getElementById("farePerKM"+id).removeAttribute("disabled"); 
	
}
function savechanges(i)
{    var id=document.getElementById("vehicleID"+i).value;
	var name=document.getElementById("name"+i).value;
	var type=document.getElementById("type"+i).value;
	var registrationNumber=document.getElementById("registrationNumber"+i).value;
	var seatingCapacity=document.getElementById("seatingCapacity"+i).value;
	var farePerKM=document.getElementById("farePerKM"+i).value;

 var url="/ATA/Admin/modifyVehicle1/?vehicleID="+id+"&name="+name+"&type="+type+"&registrationNumber="+registrationNumber+"&seatingCapacity="+seatingCapacity+"&farePerKM="+farePerKM;
	
	window.location.href=url;
}
function verifyAction(x){
	var res = confirm('Are you sure you want to remove ?');
	if(res==false)
		return;
	window.location.href='dodelVehicle/'+x;
}

function cancel(i)
{
	//disabling all fields 
	
	document.getElementById("name"+i).setAttribute("disabled","disabled");
	document.getElementById("type"+i).setAttribute("disabled","disabled");
	document.getElementById("registrationNumber"+i).setAttribute("disabled","disabled");
	document.getElementById("seatingCapacity"+i).setAttribute("disabled","disabled");
	document.getElementById("farePerKM"+i).setAttribute("disabled","disabled");
	
	//removing save and cancel btn
	document.getElementById("save"+i).style="display:none";
	document.getElementById("cancel"+i).style="display:none";
	document.getElementById("edit"+i).style="display:inline";
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>
<div class="container my-5">

<div align="right">
<button  id="AddVehicle" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#addVehicleModal">Add Vehicle</button><br>
</div>

<table cellspacing="10px" align="center" class="table table-hover">
<thead class="thead-dark">
<tr><th>S.NO</th><th>VehicleID</th><th>Name</th><th>Type</th><th style="width:150px">RegistrationNo</th><th style="width:150px">SeatingCapacity</th><th style="width:150px">FarePerKm</th><th style="width:150px">Edit</th><th>Delete</th></tr>
</thead>
	
	<tbody class="form-group">
	
	<c:forEach var="r"  items="${list}">
		<tr>
		<td>${list.indexOf(r)}</td>
		<td><input  class="form-control" type="text" style="width: 100%" value="${r.vehicleID}" id="vehicleID${list.indexOf(r)}" name="vehicleID" disabled="disabled"></td>
		<td><input class="form-control" type="text" style="width: 100%" value="${r.name}" id="name${list.indexOf(r)}" name="name" disabled="disabled"></td>
		<td><input class="form-control" type="text" style="width: 100%" value="${r.type}" id="type${list.indexOf(r)}" name="type" disabled="disabled"></td>
		<td><input class="form-control" type="text" style="width: 100%" value="${r.registrationNumber}" id="registrationNumber${list.indexOf(r)}" name="registrationNumber" disabled="disabled"></td>
		<td><input class="form-control" type="text" style="width: 100%" value="${r.seatingCapacity}" id="seatingCapacity${list.indexOf(r)}" name="seatingCapacity" disabled="disabled"></td>
		<td><input class="form-control" type="text" style="width: 100%"value="${r.farePerKM}" id="farePerKM${list.indexOf(r)}" name="farePerKM" disabled="disabled"></td>
		<td>
	<button id="edit${list.indexOf(r)}" onclick="modifyvehicle('${list.indexOf(r)}')" class="btn btn-outline-warning">Edit</button>
	<button  id="save${list.indexOf(r)}" style="display: none;" onclick="savechanges('${list.indexOf(r)}')" class="btn btn-outline-primary">Save</button>
	<img  alt="x" style="display:none;" title="cancel" id="cancel${list.indexOf(r)}" src="/ATA/static/images/close.png" onclick="cancel('${list.indexOf(r)}')" width="20%">
		</td>
		
		<td><button id="delete" name="Delete" onclick="verifyAction('${r.vehicleID}')" class="btn btn-outline-danger">Delete</button></td>
		</tr>
	</c:forEach>
	
	</tbody>
	
</table>

</div>

<div class="modal fade" id="addVehicleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Please Enter
					Vehicle Details!!</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
		<form action="/ATA/Admin/addVehicle1" method="post">
		<div class="form-group"> 
			<label for="vehicleName">Vehicle Name</label>
			<input type="text" class="form-control" id="vehicleName" name="name" ><br>
			 
			<label for="VehicleType">Vehicle Type</label>
			<input type="text" class="form-control" id="VehicleType" name="type"><br>
			
			<label for="RegistrationNo">RegistrationNo</label>
			<input type="text" class="form-control" id="RegistrationNo" name="registrationNumber"><br>
			
			<label for="SeatingCapacity">Seating Capacity</label>
			<input type="text" class="form-control" id="SeatingCapacity" name="seatingCapacity"><br>
			
			<label for="FarePerKM">FarePerKM</label>
			<input type="text" class="form-control" id="FarePerKM" name="farePerKM"><br>
			</div>
				
				
				<button type="submit" class="btn btn-primary mt-4">Add Vehicle</button>
				
		</form>
			
			</div>
</div>
</div>
</div>
<h3 align="center" style="color:green;">${msg}</h3>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
