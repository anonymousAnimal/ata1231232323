<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/HeaderAdmin.jsp"></jsp:include>
<h2>Modify Vehicle</h2>

<div class="container col-md-6 my-5 p-4" >
<f:form action="/ATA/Admin/modifyVehicle1" modelAttribute="vehicleBean" >
<table align="center">
<tr><td>VehicleID:<f:input type="text"  path="vehicleID" value="${vehicleBean.vehicleID}" readonly="true" /></td></tr>
<tr><td>VehicleName:<f:input type="text"  path="name" value="${vehicleBean.name}" /></td></tr>
<tr><td>VehicleType:<f:input type="text"  path="type" value="${vehicleBean.type}" /></td></tr>
<tr><td>VehicleRegistrationNumber:<f:input type="text"  path="registrationNumber" value="${vehicleBean.registrationNumber}" /></td></tr>
<tr><td>SeatingCapacity:<f:input type="text"  path="seatingCapacity" value="${vehicleBean.seatingCapacity}" /></td></tr>
<tr><td>FarePerKm:<f:input type="text"  path="farePerKM" value="${vehicleBean.farePerKM}" /></td></tr>

<tr><td><input type="submit" value="Modify Vehicle"></td></tr>
</table>
</f:form>

</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>
