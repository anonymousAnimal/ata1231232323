<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->
<script type="text/javascript" src="/ATA/js/bookvehicle.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel Booking</title>
</head>
<body onload="checkajax()">
	<jsp:include page="/HeaderUser.jsp"></jsp:include>
	<div class="container my-5 p-4">
	
	<c:if test="${reservationList.size()!=0 }">
	<h2>Your Reservations are:</h2>
	<table class="table table-hover">
	<thead class="thead-dark">
	<tr>
		<th>ReservationID</th><th>User ID</th>
		<th>BookingDate</th><th>JourneyDate</th>
		<th>Booking Status</th><th>Total Fare</th>
		<th>Boarding point</th><th>Drop point</th><th>Cancel</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="rb" items="${reservationList }">
			
			<tr id="${rb.getReservationID() }">
				<td>${rb.getReservationID() }</td><td>${rb.getUserID() }</td>
				<td>${rb.getBookingDate() }</td><td>${rb.getJourneyDate() }</td>
				<td>${rb.getBookingStatus() }</td><td>${rb.getTotalFare() }</td>
				<td>${rb.getBoardingPoint() }</td><td>${rb.getDropPoint() }</td> 
			<td><Button class="btn btn-outline-danger" onclick="cancelBooking('${rb.getReservationID()}');">Cancel </Button></td>
			</tr>
		
	</c:forEach>
	</tbody>
	</table>
	</c:if>
	<c:if test="${reservationList.size() ==0 }"> <h1 align="center"> No bookings available !!!! </h1></c:if>
	
	<br><br><!-- <button onclick="history.go(-1)">&lt;&lt;&lt;</button>&nbsp;&nbsp;&nbsp; -->
	</div>
	
	<br><br><div id = "msg" align="center"></div>
</body>
</html>