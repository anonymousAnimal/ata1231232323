<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/ATA/static/css/cards.css" /> -->
<%@include file="/Bootstrap4.jsp" %>

<meta charset="ISO-8859-1">
<title>User Dashboard</title>
</head>
<body>
<jsp:include page="/HeaderUser.jsp"/>

<div class="container mt-5">
<h2 >  Welcome! ${profileBean.getFirstName()} ${profileBean.getLastName()}</h2> 

<div class="card-deck mt-5">
<div class="card"   >
<a href = "Profile">
  <img src="/ATA/static/images/male_avatar.png" alt="Avatar" style="width:100%" ></a>
  <div class="container-fluid" >
  <h4 class="card-title">
  <a href = "Profile">
  Profile
  </a>
  </h4>
  </div>
</div>

<div class="card"  >
<a href = "ViewVehiclesAndRoutes">
  <img src="/ATA/static/images/route.png" alt="route" style="width:100%" ></a>
  <div class="container-fluid" >
  <h4 class="card-title">
  <a href = "ViewVehiclesAndRoutes">
  Vehicles/Routes details 
  </a>
  </h4>
  </div>
</div>


<div class="card"   >
<a href = "/ATA/Booking/BookVehicle">
  <img src="/ATA/static/images/car.png" alt="car" style="width:100%" ></a>
  <div class="container-fluid" >
  <h4 class="card-title">
  <a href = "/ATA/Booking/BookVehicle">
  Book vehicle
  </a>
  </h4>
  </div>
</div>

<div class="card"   >
<a href = "/ATA/Booking/CancelBooking">
  <img src="/ATA/static/images/cancel.png" alt="cancel" style="width:100%" ></a>
  <div class="container-fluid" >
  <h4 class="card-title">
  <a href = "/ATA/Booking/CancelBooking">
  Cancel booking
  </a>
  </h4>
  </div>
</div>

<div class="card"   >
<a href = "/ATA/Booking/ViewBooking">
  <img src="/ATA/static/images/print.png" alt="print" style="width:100%" ></a>
  <div class="container-fluid" >
  <h4 class="card-title">
  <a href = "/ATA/Booking/ViewBooking">
  Print Booking Details
  </a>
  </h4>
  </div>
</div>

</div>
</div>

</body>
</html>