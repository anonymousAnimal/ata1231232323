<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->

<script>
	function verifyAction(x){
		var res = confirm('Are you sure ?');
		if(res==false)
			return;
		
		window.location.href='/ATA/Admin/dodelRoute/?id='+x;
	}
	
	function modifyRoute(i){
		
		//hiding editbtn
		document.getElementById('editbtn'+i).style="display:none;";
		//showing savechangesbtn and cancelbtn
		document.getElementById('savebtn'+i).style="display:inline";
		document.getElementById('cancelbtn'+i).style="display:inline;";
		
		//enabling the fields
		document.getElementById("source"+i).removeAttribute("disabled");
		document.getElementById("destination"+i).removeAttribute("disabled");
		document.getElementById("distance"+i).removeAttribute("disabled");
		document.getElementById("travelduration"+i).removeAttribute("disabled");
		
		
	}
	
	
	function saveChanges(i)
	{
		var id = document.getElementById("routeID"+i).value;
		var source = document.getElementById("source"+i).value;
		var destination = document.getElementById('destination'+i).value;
		var distance = document.getElementById('distance'+i).value;
		var travelduration = document.getElementById('travelduration'+i).value;
		
		
		var url = "/ATA/Admin/modifyRoute/?routeID="+id+"&source="+source+"&destination="+destination+"&distance="+distance+"&travelduration="+travelduration;
		window.location.href=url;
	}
	
	function cancelEdit(i){
			
			//disabling the fields
			document.getElementById("routeID"+i).setAttribute("disabled","disabled");
			document.getElementById("source"+i).setAttribute("disabled","disabled");
			document.getElementById("destination"+i).setAttribute("disabled","disabled");
			document.getElementById("distance"+i).setAttribute("disabled","disabled");
			document.getElementById("travelduration"+i).setAttribute("disabled","disabled");
			
			
			//showing editbtn
			document.getElementById('editbtn'+i).style="display:inline;";
			//hiding savechangesbtn
			document.getElementById('savebtn'+i).style="display:none;";
			//hiding cancelbtn
			document.getElementById('cancelbtn'+i).style="display:none;";
			
		}
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit/Delete</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"/>

<div class="container my-5">

<div align="right">
<br><button  type="button" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#addRouteModal" >Add Driver</button>
</div>

<table class="table table-hover">
<thead class="thead-dark">
<tr><th>Sno.</th><th>RouteID</th><th>Source</th><th>Destination</th><th>Distance</th><th>TravelDuration</th><th style="width:10%;">Edit</th><th>Delete</th></tr>
</thead>
<tbody>
	<c:forEach var="r"  items="${list}">
		<tr>
		<td>
		${list.indexOf(r)}
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.routeID}" id="routeID${list.indexOf(r)}" name="routeID" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.source}" id="source${list.indexOf(r)}" name="source" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.destination}" id="destination${list.indexOf(r)}" name="destination" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.distance}" id="distance${list.indexOf(r)}" name="distance" disabled="disabled">
		</td>
		<td>
		<input style="width:100%" type="text" value="${r.travelduration}" id="travelduration${list.indexOf(r)}" name="travelduration" disabled="disabled">
		</td>
		<td>
		<button id="editbtn${list.indexOf(r)}" type="button" onclick="modifyRoute('${list.indexOf(r)}')" class="btn btn-outline-warning">Edit</button>
		
		<button style="display:none;" id="savebtn${list.indexOf(r)}"  type="button" onclick="saveChanges('${list.indexOf(r)}')" class="btn btn-primary">Save</button>
		<img style="display:none; " id="cancelbtn${list.indexOf(r)}" width="20%"  onclick="cancelEdit('${list.indexOf(r)}')" alt="x" title="cancel" src="/ATA/static/images/close.png">
		</td>
		<td>
		<button type="button" class="btn btn-outline-danger" onclick="verifyAction('${r.routeID}');">Delete</button>
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


<!-- addRoute Modal -->

<div class="modal fade" id="addRouteModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Enter Route Details </h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
			<!-- form begin -->
				<form action="/ATA/Admin/doRoute" method="POST">
					<div class="form-group">
						
						<label for="source">Source</label>
						<input class="form-control"  id="source" type="text"  name="source" required><br>
						
						<label for="destination">Destination</label>
						<input class="form-control"  id="destination" type="text"  name="destination" required><br>
						
						<label for="distance">Distance</label>
						<input class="form-control"  id="distance" type="text"  name="distance" required><br>
						
						<label for="travelduration">Travel Duration</label>
						<input class="form-control"  id="travelduration" type="text"  name="travelduration" required><br>
						
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-secondary">Reset</button>
					</div>
				</form>
				<!-- form end -->
				
			</div>

		</div>
	</div>
</div>

<!-- modal end -->

</html>