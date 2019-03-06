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
<jsp:include page="/HeaderAdmin.jsp"/>
<table cellspacing="10px" align="center">
<tr><th>ReservationID</th><th>UserID</th><th>RouteID</th><th>BookingDate</th><th>JourneyDate</th><th>VehicleID</th><th>DriverID</th><th>BookingStatus</th><th>TotalFare</th><th>BoardingPoint</th><th>DropPoint</th><th>Allot Driver</th></tr>
	
	
	<c:forEach var="r"  items="${UnallotedDrivers}">
		<tr id="${r.reservationID}">
		<td>${r.reservationID}</td><td>${r.userID}</td><td>${r.routeID}</td><td>${r.bookingDate}</td><td>${r.journeyDate}</td><td>${r.vehicleID}</td><td>${r.driverID}</td><td>${r.bookingStatus}</td><td>${r.totalFare}</td><td>${r.boardingPoint}</td><td>${r.dropPoint}</td>
		<td>
		<select name="drivername" id="driverid">
		<option value="NONE" label="Select Driver"></option>
		<c:forEach var="d" items="${driverList}">
		<option value="${d.driverID}" >${d.name}</option>
		</c:forEach>
		</select> </td>
		<td>
    	<button onclick="unallotedDrivers('${r.reservationID}','driverid')">Allot</button>
 	
    	</td>
		</tr>
	</c:forEach>

</table>

<div id="msg" >


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</div>
</body>
</html>