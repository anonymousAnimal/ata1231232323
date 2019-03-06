<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>

<div class="container my-5 p-5 col-lg-6" style="border:1px solid black">
<h1>CREATE ROUTE</h1>
<form action="doRoute" method="POST">

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

</div>
</form>

<h3 >
${msg}
${routeBean.routeID}
</h3>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>