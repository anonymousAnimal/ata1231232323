<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>
<h2>Add Vehicle</h2>
<div class="container col-md-6 my-5 p-4" style="border:1px solid grey;">
<form action="addVehicle1" method="post">
		<div class="form-group"> 
			<label for="vehicleName">VehicleName</label>
			<input type="text" class="form-control" id="vehicleName" name="name" placeholder="VehicleName"><br>
			 
			<label for="VehicleType">VehicleType</label>
			<input type="text" class="form-control" id="VehicleType" name="type" placeholder="VehicleType"><br>
			
			<label for="RegistrationNo">RegistrationNo</label>
			<input type="text" class="form-control" id="RegistrationNo" name="registrationNumber" placeholder="RegistrationNo"><br>
			
			<label for="SeatingCapacity">SeatingCapacity</label>
			<input type="text" class="form-control" id="SeatingCapacity" name="seatingCapacity" placeholder="SeatingCapacity"><br>
			
			<label for="FarePerKM">FarePerKM</label>
			<input type="text" class="form-control" id="FarePerKM" name="farePerKM" placeholder="FarePerKM"><br>
			
		
		
		
		</div>
		
				<button type="submit" class="btn btn-primary mt-4">Add Vehicle</button>
</form>
</div>

 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



</body>
</html>
