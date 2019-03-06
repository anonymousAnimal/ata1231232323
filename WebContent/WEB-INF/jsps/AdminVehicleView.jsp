<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<script type="text/javascript" >

function  savechanges(id)
{
	document.getElementById("edit"+id).style="display:none";
	document.getElementById("save"+id).style="display:inline";
	
	
	document.getElementById("name"+id).removeAttribute("disabled"); 
	document.getElementById("type"+id).removeAttribute("disabled"); 
	document.getElementById("registrationNumber"+id).removeAttribute("disabled"); 
	document.getElementById("seatingCapacity"+id).removeAttribute("disabled"); 
	document.getElementById("farePerKM"+id).removeAttribute("disabled"); 
	
}
function modifyvehicle(i)
{    var id=document.getElementById("vehicleID"+i).value;
	var name=document.getElementById("name"+i).value;
	var type=document.getElementById("type"+i).value;
	var registrationNumber=document.getElementById("registrationNumber"+i).value;
	var seatingCapacity=document.getElementById("seatingCapacity"+i).value;
	var farePerKM=document.getElementById("farePerKM"+i).value;

 var url="modifyVehicle1/?vehicleID="+id+"&name="+name+"&type="+type+"&registrationNumber="+registrationNumber+"&seatingCapacity="+seatingCapacity+"&farePerKM="+farePerKM;
	
	window.location.href=url;
	/*  req.onreadystatechange = function(){
		if(req.readyState == 4 && req.status == 200){
			var res=req.responseText;
			if(res==true)
		document.getElementById("msg").innerHTML="<h4>Vehicle edited</h4>";
		}
	
	} 
	
	req.open("GET", url, true);
	req.send();
 */
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>
<div class="container-fluid my-5">
<table cellspacing="10px" align="center" class="table">
<thead class="thead-dark">
<tr><th>S.NO</th><th>VehicleID</th><th>Name</th><th>Type</th><th>RegistrationNo</th><th>SeatingCapacity</th><th>FarePerKm</th><th>Edit</th><th>Delete</th></tr>
</thead>
	
	<tbody>
	<c:forEach var="r"  items="${list}">
		<tr>
		<td>${list.indexOf(r)}</td>
		<td><input type="text" value="${r.vehicleID}" id="vehicleID${list.indexOf(r)}" name="vehicleID" disabled="disabled"></td>
		<td><input type="text" value="${r.name}" id="name${list.indexOf(r)}" name="name" disabled="disabled"></td>
		<td><input type="text" value="${r.type}" id="type${list.indexOf(r)}" name="type" disabled="disabled"></td>
		<td><input type="text" value="${r.registrationNumber}" id="registrationNumber${list.indexOf(r)}" name="registrationNumber" disabled="disabled"></td>
		<td><input type="text" value="${r.seatingCapacity}" id="seatingCapacity${list.indexOf(r)}" name="seatingCapacity" disabled="disabled"></td>
		<td><input type="text" value="${r.farePerKM}" id="farePerKM${list.indexOf(r)}" name="farePerKM" disabled="disabled"></td>
		<td>
	<button id="edit${list.indexOf(r)}" onclick="savechanges('${list.indexOf(r)}')" class="btn btn-outline-warning">Edit</button>
	<button  id="save${list.indexOf(r)}" style="display: none;" onclick="modifyvehicle('${list.indexOf(r)}')" class="btn btn-outline-warning">Save</button>
		
		</td>
		
		<td><button id="delete" name="Delete" onclick="window.location.href='dodelVehicle/${r.vehicleID}'" class="btn btn-outline-danger">Delete</button></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<button  id="AddVehicle" class="btn btn-outline-success"  ></button>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>