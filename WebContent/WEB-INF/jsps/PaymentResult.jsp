
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" /> -->
<%@include file="/Bootstrap4.jsp" %>
<meta charset="ISO-8859-1">
<title>${msg }</title>
</head>
<body>
<jsp:include page="/HeaderUser.jsp"/>
<div class="container my-5 p-5">

	
	<c:choose>
		<c:when test="${status==\"true\" }">
		<div class="alert alert-success">
		<h2 align="center">${msg}</h2>
		</div>
		
		<table class="table table-hover mt-4">
			
			<thead class="thead-dark">
			<tr>
				<th>ReservationID</th><th>User ID</th><th>Name</th>
				<th>BookingDate</th><th>JourneyDate</th>
				<th>Booking Status</th><th>Total Fare(Rs.)</th>
				<th>Boarding point</th><th>Drop point</th>
			</tr>
			</thead>
			<tr>
				<td>${rb.getReservationID() }</td><td>${rb.getUserID() }</td><td>${name }</td>
				<td>${rb.getBookingDate() }</td><td>${rb.getJourneyDate() }</td>
				<td>${rb.getBookingStatus() }</td><td>${rb.getTotalFare() }</td>
				<td>${rb.getBoardingPoint() }</td><td>${rb.getDropPoint() }</td>
			</tr>
		</table>
		<br>
		<button  type="button" class="btn btn-secondary" onclick="window.print()">print</button>
		
		
		</c:when>
		<c:otherwise>
			<div class="alert alert-danger">
			<h2 align="center">${msg}</h2>
			</div>
		</c:otherwise>
		
	</c:choose>
	
	
	
	
</div>

</body>
</html>