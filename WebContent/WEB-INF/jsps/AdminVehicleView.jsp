<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" >

$.noConflict();

jQuery(document).ready(function($){
	
	$('Button[id^=editbtn]').click(function()
	{
		$(this).parents('tr').eq(0).find("input:not(:first)").removeAttr("disabled");
		$(this).css({display:'none'});
		$(this).siblings('Button[id^=savebtn]').css({display:'inline'});
		$(this).siblings('img[id^=cancelbtn]').css({display:'inline'});
		
	});
	
	$('Button[id^=savebtn]').click(function()
	{
		$(this).css("display",'none');
		var tr = $(this).parents('tr').eq(0);
		
		tr.find("input:not(:first)").attr("disabled","disabled");
		tr.find('img[id^=cancelbtn]').css("display","none");
		tr.find('button[id^=editbtn]').css("display","inline");
		
		  swal({
			  title: "please wait....",
			  icon : '/ATA/static/images/runningrabbit.gif',
			  buttons: false
			});  
		
	    var url = "/ATA/Admin/modifyVehicle1/?"
		var tr = $(this).parents('tr').eq(0);
		tr.find("input[name]").each(function(){
			url += $(this).attr('name')+"="+$(this).prop('value')+"&";
		});
		url = url.slice(0,-1);
		console.log("url is "+url);
		
		$.get(url,function(data, status)
		{
			if(status=="success")
			 	swal({
				  	 title: status,
				 	 text: data,
				  	 icon : 'success'
					});
			else
				swal({
					  title: status,
					  text: data,
					  icon : 'info'
					});
		});					 
	});
	
	$('img[id^=cancelbtn]').click(function()
	{
		$(this).css("display",'none');
		var tr = $(this).parents('tr').eq(0);
		tr.find("input:not(:first)").attr("disabled","disabled");
		tr.find('button[id^=savebtn]').css("display","none");
		tr.find('button[id^=editbtn]').css("display","inline");
	});
	
	$('button[id^=deletebtn]').click(function()
	{
		var tr = $(this).parents('tr').eq(0);
		var id = tr.find("input[id^=vehicleID]").prop("value");
		console.log("id is "+id);
		//return;
		
		var url = "/ATA/Admin/dodelVehicle/"+id;
		
			
		 swal({
			  title: "Are you sure?",
			  text: "Once deleted, you will not be able to recover this !",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete)=>{
				
				if(willDelete)
				{
					$.get(url,function(data,status)
							{
								console.log(status+", "+data);
								 var icontxt = "info";
								    
								    
								    if(data=="success"){
								    	tr.remove();  //if success is returned then removing the current row from table;
								    	icontxt="success";
								    }
								    	
								    swal(data, {
									      icon: icontxt,
									     });
								});
				}
				else
					swal("operation cancelled !!",{icon : "info"})
			});
	});
	
	
	
	$('#search').keyup(function()
	{
		console.log("keyup");
		var keyword = $(this).prop('value').toLowerCase();
		    $("#myTable tr").filter(function() {
		    	var txt= $(this).find("td:first").text()+" ";
		    	$(this).find('input[name]').each(function(){
		    		txt += this.value+" ";
		    	});
		    	console.log(txt);
		    	
		      $(this).toggle(txt.toLowerCase().indexOf(keyword) > -1);
		    });

	});
});

/* function  modifyvehicle(id)
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
	window.location.href='/ATA/Admin/dodelVehicle/'+x;
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
} */


</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>
<div class="container my-5">

<div align="right">
<input class="form-control col-lg-2" id="search" title="search box" placeholder="search any thing !!!" value=""><br>
<button  id="AddVehicle" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#addVehicleModal">Add Vehicle</button><br>
</div>

<table  class="table table-hover">
<thead class="thead-dark">
<tr><th>S.NO</th><th>VehicleID</th><th>Name</th><th>Type</th><th style="width:150px">RegistrationNo</th><th style="width:150px">SeatingCapacity</th><th style="width:150px">FarePerKm</th><th style="width:150px">Edit</th><th>Delete</th></tr>
</thead>
</table >
<div style="height:500px; overflow-y:auto;">
<table class="table table-hover" id="myTable">
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
		<td style="width:10%;">
	<button id="editbtn${list.indexOf(r)}" onclick="modifyvehicle('${list.indexOf(r)}')" class="btn btn-outline-warning">Edit</button>
	<button  id="savebtn${list.indexOf(r)}" style="display: none;" onclick="savechanges('${list.indexOf(r)}')" class="btn btn-outline-primary">Save</button>
	<img  alt="x" style="display:none;" title="cancel" id="cancelbtn${list.indexOf(r)}" src="/ATA/static/images/close.png" onclick="cancel('${list.indexOf(r)}')" width="20%">
		</td>
		
		<td><button id="deletebtn" name="Delete" onclick="verifyAction('${r.vehicleID}')" class="btn btn-outline-danger">Delete</button></td>
		</tr>
	</c:forEach>
	
	</tbody>
	
</table>
</div>

<%-- <!-- displaying alert msg  CODE START-->
<c:choose>
<c:when test="${status==true}">
<div class="alert alert-success"> ${msg }<a href="#" class="close" data-dismiss="alert">×</a></div>
</c:when>

<c:when test="${status==false}">
<div class="alert alert-danger"> ${msg }<a href="#" class="close" data-dismiss="alert">×</a></div>
</c:when>
</c:choose>

<!-- CODE END -->

</div>
 --%>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

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
</html>
