<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view details</title>
</head>
<body>
<jsp:include page="/HeaderUser.jsp"></jsp:include>
<div align="center" class="container my-5 p-5">

<c:if  test="${reservationList.size()!=0 }">
<h1>------------------- Print Booking Details ----------------</h1>
	<form action="doViewBooking" target="_blank">
	<div class="form-group">
	<label for="reservationId">
	Select Your Option Below : 
	</label>
	<select class="form-control" id="reservationId" name="reservationId">
		<c:forEach var="r" items="${reservationList}">
			<option id='${r.reservationID}' label="${r.reservationID} ${r.journeyDate} ${r.boardingPoint}-${r.dropPoint }" value="${r.reservationID}">  ${r.reservationID} ${r.journeyDate} ${r.boardingPoint}-${r.dropPoint }</option>
		</c:forEach>
	</select>
	<br>
	<input type="submit"  class="btn btn-primary" value="view/print details">
	</div>
	</form>
	
</c:if>

<c:if test="${reservationList.size()==0 }">
	<h1>You don't have any Bookings!!!</h1>
</c:if>
</div>
</body>
</html>