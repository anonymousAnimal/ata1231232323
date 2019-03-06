<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD Driver</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>

<div class="container my-5 p-5 col-lg-6" style="border:1px solid grey; border-radius:20px">

<h1>Add Driver</h1>
<form action="addDriver1" method="post">
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


${msg}
${driverBean.driverID}

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>