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
<h1>ADD VEHICLE</h1>

<form action="addVehicle1" method="post">
<div class="form-group">

<label>VehicleName</label>
<input type="text" id="name" class="form-control" name="name">
<tr><td>VehicleName:</td></tr>
<tr><td>VehicleType:<input type="text" name="type"></td></tr>
<tr><td>RegistrationNo:<input type="text" name="registrationNumber"></td></tr>
<tr><td>SeatingCapacity:<input type="text" name="seatingCapacity"></td></tr>
<tr><td>FarePerKM:<input type="text"  name="farePerKM"></td></tr>
<tr><td><input type="submit" value="Add Vehicle"></td></tr>
</table>

</div>
</form>
${msg}
${vehicleBean.vehicleID}


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>