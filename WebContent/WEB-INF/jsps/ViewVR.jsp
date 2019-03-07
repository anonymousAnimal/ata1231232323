<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/ATA/static/css/table.css" />
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse:collapse;
		
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available vehicles and routes</title>
</head>
<body>
<jsp:include page="/HeaderUser.jsp"></jsp:include>
	

	<div class="container mt-5">
	<table class="table table-hover">
	<caption>List of Vehicles</caption>
  <thead class="thead-dark">
    <tr>
      <th scope="col">VehicleID</th>
      <th scope="col">Name</th>
      <th scope="col">Type</th>
      <th scope="col">SeatingCapacity</th>
      <th scope="col">FarePerKM</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="r" items="${vehicleList}">
		<tr>
		<td>${r.getVehicleID() }</td>
		<td>${r.getName() }</td>
		<td>${r.getType() }</td>
		<td>${r.getSeatingCapacity() }</td>
		<td>${r.getFarePerKM() }</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>


	<div class="container mt-5">
	<table class="table table-hover">
	<caption>List of Routes</caption>
  <thead class="thead-dark">
    <tr>
      <th scope="col">RouteID</th>
      <th scope="col">Source</th>
      <th scope="col">Destination</th>
      <th scope="col">Distance</th>
      <th scope="col">Travel Duration</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="r" items="${routeList}">
		<tr>
		<td>${r.getRouteID() }</td>
		<td>${r.getSource() }</td>
		<td>${r.getDestination() }</td>
		<td>${r.getDistance() }</td>
		<td>${r.getTravelduration() }</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
	
	<center><button class="btn btn-secondary" onclick="history.go(-1)">Goto Dashboard</button></center>
</body>
</html>