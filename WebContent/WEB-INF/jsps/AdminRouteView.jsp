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
		
		window.location.href='dodelRoute/${r.routeID}'+x;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit/Delete</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"/>

<div class="container my-5 p-5">
<table class="table table-hover">
<thead class="thead-dark">
<tr><th>RouteID</th><th>Source</th><th>Destination</th><th>Distance</th><th>TravelDuration</th><th>Edit</th><th>Delete</th></tr>
</thead>
<tbody>
	<c:forEach var="r"  items="${list}">
		<tr><td>${r.routeID}</td><td>${r.source}</td><td>${r.destination}</td><td>${r.distance}</td><td>${r.travelduration}</td><td><button type="button" class="btn btn-outline-warning" onclick="window.location.href='domodify/${r.routeID}';">Edit</button></td><td><button type="button" class="btn btn-outline-danger" onclick="verifyAction('${r.routeID}');">Delete</button></td></tr>
	</c:forEach>
</tbody>
</table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>