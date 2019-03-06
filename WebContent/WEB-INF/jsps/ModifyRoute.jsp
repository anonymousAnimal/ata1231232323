<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>

<div class="container my-5 p-5 col-lg-6" style="border:1px solid grey; border-radius:20px" >
<h1>Modify Route</h1><br>
<form action="/ATA/Admin/modifyRoute"  >
<div class="form-group">
<label for="routeid">RouteID</label>
<input class="form-control" type="text" id="routeid" name="routeID" value="${routeBean.routeID}" disabled="disabled"/><br>

<label for="source">Source</label>
<input class="form-control" type="text" id="source" name="source" value="${routeBean.source}"/><br>

<label for="destination">Destination</label>
<input class="form-control" type="text" id="destination" name="destination" value="${routeBean.destination}" /><br>

<label for="distance">Distance</label>
<input class="form-control" type="text" id="distance" name="distance" value="${routeBean.distance}" /><br>

<label for="travelduration">Travel Duration</label>
<input class="form-control" type="text" id="travelduration" name="travelduration" value="${routeBean.travelduration}" /><br>

<button type="submit" class="btn btn-primary"> Modify Route</button>

</div>
</form>
<h2>${msg}</h2>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>