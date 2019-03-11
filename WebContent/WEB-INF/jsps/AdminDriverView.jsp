<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	
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
			
		    var url = "/ATA/Admin/modifyDriver1/?"
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
			var id = tr.find("input[id^=driverID]").prop("value");
			console.log("id is "+id);
			//return;
			
			var url = "/ATA/Admin/dodelDriver/"+id;
			
				
			 swal({
				  title: "Are you sure?",
				  text: "Once deleted, you will not be able to recover this !",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) =>{
					
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
			    	
			      $(this).toggle(txt.toLowerCase().indexOf(keyword) > -1,"slow");
			    });

		});
	});

	
</script>


</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"/>

<div class="container-fluid my-5 ">
<div align="right">
<input class="form-control col-lg-2" id="search" title="search box" placeholder="search any thing !!!" value="">
<br><button  type="button" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#addDriverModal" >Add Driver</button>
</div>
<table  class="table table-hover" >
<thead class="thead-dark">
<tr><th>sno</th><th>DriverID</th><th>Name</th><th>Street</th><th>Location</th><th>City</th><th>State</th><th>Pincode</th><th>MobileNo.</th><th>LicenseNo.</th><th>Edit</th><th>Delete</th></tr>
</thead>
</table >
<div style="height:500px; overflow-y:auto;">
<table class="table table-hover" id="myTable" >
<tbody class="form-group" >

	<c:forEach var="r"  items="${list}" >
		<tr>
		<td>
		${list.indexOf(r)}
		</td>
		<td>
		 <input  class="form-control" style="width:100%" type="text" value="${r.driverID}" id="driverID${list.indexOf(r)}" name="driverID" disabled="disabled">
		</td>
		<td>
		<input class="form-control" style="width:100%" type="text" value="${r.name}" id="name${list.indexOf(r)}" name="name" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.street}" id="street${list.indexOf(r)}" name="street" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.location}" id="location${list.indexOf(r)}" name="location" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.city}" id="city${list.indexOf(r)}" name="city" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.state}" id="state${list.indexOf(r)}" name="state" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.pincode}" id="pincode${list.indexOf(r)}" name="pincode" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.mobileNo}" id="mobileNo${list.indexOf(r)}" name="mobileNo" disabled="disabled">
		</td>
		<td>
		<input  class="form-control" style="width:100%" type="text" value="${r.licenseNumber}" id="licenseNumber${list.indexOf(r)}" name="licenseNumber" disabled="disabled"/>
		</td>
		<td>
		<button id="editbtn${list.indexOf(r)}" type="button" onclick="modifyDriver('${list.indexOf(r)}')" class="btn btn-outline-warning">Edit</button>
		
		<button style="display:none;" id="savebtn${list.indexOf(r)}"  type="button" onclick="saveChanges('${list.indexOf(r)}')" class="btn btn-primary">Save</button>
		<img style="display:none; img:hover;" id="cancelbtn${list.indexOf(r)}" width="15%"  onclick="cancelEdit('${list.indexOf(r)}')" alt="x" title="cancel" src="/ATA/static/images/close.png">
		</td>
		<td>
		<button id='deletebtn${list.indexOf(r)}' type="button" onclick="deleteDriver('${r.driverID}')" class="btn btn-outline-danger">Delete</button>
		</td>
		</tr>

	</c:forEach>
	
</tbody>
</table>
</div>

<br>
<%-- <h3>${msg }</h3> --%>
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