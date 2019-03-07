<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<script type="text/javascript" src="/ATA/js/AllotDriver.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="checkAjax()">

<jsp:include page="/HeaderAdmin.jsp"></jsp:include>


<div class="container-fluid my-5 p-5">
<div class="row mb-5">

<div class="col-lg-3">
<label  for="source">Source</label>


<select name="sourcename" class="form-control" id="source" onchange="getDestination(this.value)" style="width: 100%" > 
<option value="NONE" label="Select Source"></option>
<c:forEach var="s" items="${sourceSet}">
<option value="${s}">${s}</option>
</c:forEach>
</select>
</div>

<div class="col-lg-3">
<label  for="destination">Destination</label>
<div id="destdiv">
<select name="destinationname" class="form-control" id="destination" disabled="disabled" style="width: 100%">
	<option id= "0" value="NONE">NONE</option>
</select>
</div>
</div>

<div class="col-lg-3">
<label  for="journeyDate">journey Date</label>
<input type="date" name="journeyDate" id="journeyDate" class="form-control" style="width:100%">
</div>

<div class="col-lg-2 mt-2" align="left">
<!-- <label for="btn" >button-lable </label> -->
<button id="btn" onclick="viewBooking('journeyDate','source','destination')" class="btn btn-primary mt-4 ">View Details
</button>
</div>

</div>
<!-- table showing all booking details  it changes when particular source & destination is selected-->

<div id="result" align="center" style="overflow-y:scroll ">
<table class="table table-hover">
<thead class="thead-dark">
<tr><th  class="col-md-2">ReservationID</th><th  class="col-md-2">UserID</th><th  class="col-md-2">RouteID</th><th  class="col-md-2">BookingDate</th><th  class="col-md-2">JourneyDate</th><th  class="col-md-2">VehicleID</th><th  class="col-md-2">DriverID</th><th  class="col-md-2">Status</th><th  class="col-md-2">TotalFare</th><th  class="col-md-2">Boarding</th><th  class="col-md-2">DropPoint</th></tr>
</thead>

<tbody>
<c:forEach var="r" items="${resList}">
<tr>
<td  class="col-md-2">${r.reservationID} </td>
<td  class="col-md-2">${r.userID}</td>
<td  class="col-md-2">${r.routeID}</td>
<td  class="col-md-2">${r.bookingDate}</td>
<td  class="col-md-2">${r.journeyDate}</td>
<td  class="col-md-2">${r.vehicleID}</td>
<td  class="col-md-2">${r.driverID}</td>
<td  class="col-md-2">${r.bookingStatus}</td>
<td  class="col-md-2">${r.totalFare }</td>
<td  class="col-md-2">${r.boardingPoint}</td>
<td  class="col-md-2">${r.dropPoint}</td>
</tr>

</c:forEach>
</tbody>

</table>

</div>


</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>