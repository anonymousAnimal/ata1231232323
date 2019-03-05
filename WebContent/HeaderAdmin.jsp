<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Administrator</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/Bootstrap4.jsp" %>

<meta charset="ISO-8859-1">
<title></title>
</head>
<body>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/ATA/">ATA</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/ATA/Admin/Dashboard">Home <span class="sr-only">(current)</span></a>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Route
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/ATA/Admin/addroute">Add</a>
          <a class="dropdown-item" href="/ATA/Admin/goToEditDelete">Modify/Delete</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Driver
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/ATA/Admin/addDriver">Add</a>
          <a class="dropdown-item" href="/ATA/Admin/driverEditDelete">Modify/Delete</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Vehicle
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/ATA/Admin/addVehicle">Add</a>
          <a class="dropdown-item" href="/ATA/Admin/vehicleEditDelete">Modify/Delete</a>
        </div>
      </li>
      
    </ul>
    <ul class="navbar-nav ml-auto">
    	<li>
    		<a class="nav-link" href="/ATA/logout">Logout <span class="sr-only">(current)</span></a>
    	</li>
    </ul>
    
  </div>
</nav>
	

	
	<!-- navigation bar  -->
	<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/ATA/">ATA</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/ATA/Admin/Dashboard">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Route <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/ATA/Admin/addroute">Add</a></li>
          <li><a href="/ATA/Admin/goToEditDelete">Modify/Delete</a></li>
        </ul>
      </li>
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Driver<span class="caret"></span></a>
        <ul class="dropdown-menu">
         <li><a href="/ATA/Admin/addDriver">Add</a></li>
          <li><a href="/ATA/Admin/driverEditDelete">Modify/Delete</a></li>
        </ul>
      </li>
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Vehicle <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="/ATA/Admin/addVehicle">Add</a></li>
          <li><a href="/ATA/Admin/vehicleEditDelete">Modify/Delete</a></li>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/ATA/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
 -->

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>