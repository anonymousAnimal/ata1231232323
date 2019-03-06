
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/Bootstrap4.jsp" %>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/HeaderUser.jsp"/>

<div class="container col-md-6 my-5 p-4" style="border:1px solid grey;">
	<h1>Step 2:</h1> 
	
	<div class="form-group">
	<form action="CompletePayment" method="POST">
		<label for="uid">User ID</label>
		<input class="form-control" type="text" class="form-control" id="uid" value="${credentialsBean.userID}" disabled="disabled"> <br>
		
		<label for="source">Source</label>
		<input class="form-control" type="text" class="form-control" id="source" value="${routeBean.source}" disabled="disabled"> <br>
		
		<label for="destination">Destination</label>
		<input class="form-control" type="text" class="form-control" id="destination" value="${routeBean.destination}" disabled="disabled"> <br>
		
		<label for="tdistance">Total Distance</label>
		<input class="form-control" type="text" class="form-control" id="tdistance" value="${routeBean.distance}" disabled="disabled"> <br>
		
		<label for="boardingpoint">Boarding Point</label>
		<input class="form-control" type="text" class="form-control" id="boardingpoint" value="${reservationBean.boardingPoint}" disabled="disabled"> <br>
		
		<label for="droppoint">Drop Point</label>
		<input class="form-control" type="text" class="form-control" id="droppoint" value="${reservationBean.dropPoint}" disabled="disabled"> <br>
		
		<label for="vehicle">vehicle</label>
		<input class="form-control" type="text" class="form-control" id="vehicle" value="${vehicleBean.name}(${vehicleBean.type}): Rs. ${vehicleBean.farePerKM}/perkm" disabled="disabled"> <br>
		
		<label for="total">Total Fare</label>
		<input class="form-control" type="text" class="form-control" id="total" value="Rs. ${vehicleBean.farePerKM * routeBean.distance}" disabled="disabled"> <br>
		
		<label for="creditcard">Enter your CreditCard Number</label>
		<input class="form-control" type="text" class="form-control" id="creditcard" name="creditCardNumber"> <br>
		
		<label for="validFrom">Valid From</label>
		<input class="form-control" type="text" class="form-control" id="validFrom" name="validFrom" > <br>
		
		<label for="validTo">Valid To</label>
		<input class="form-control" type="text" class="form-control" id="ValidTo" name="validTo" > <br>
		
		<button type="submit" class="btn btn-primary">Make Payment</button>
		</form>
	</div>
</div>	
	
	
	<%-- 
	UserID : ${credentialsBean.userID}<br>
	Source : ${routeBean.getSource() }<br>
	Destination : ${routeBean.getDestination() }<br>
	Total Distance : ${routeBean.getDistance()}<br>
	boardingPoint : ${reservationBean.getBoardingPoint() }<br>
	dropingPoint : ${reservationBean.getDropPoint()}<br>
	vehicle : ${vehicleBean.getName() } (${vehicleBean.getType()}): Rs. ${vehicleBean.getFarePerKM()}/perkm<br>
	Total Fare : ${vehicleBean.getFarePerKM() * routeBean.getDistance()}<br>
	
	<f:form modelAttribute="paymentBean" action="CompletePayment" method="POST">
	creditcardnumber : <f:input  name="creditcardnumber" path="creditCardNumber"/>
	valid from : <f:input name="validfrom" path="validFrom"/>
	valid to : <f:input name="validto" path="validTo"/>
	
	<div id = "divbalinfo" hidden="true" > hello this is inside div</div>
	
	<button type="submit" >make payment</button>
	</f:form> --%>


</body>
</html>