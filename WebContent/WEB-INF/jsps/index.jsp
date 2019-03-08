<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="/ATA/static/css/index.css" />
<%@include file="/Bootstrap4.jsp" %>
<meta charset="ISO-8859-1">
<!-- <meta http-equiv="refresh" content="3;url=login" /> -->
<title>ATA</title>
</head>
<body>
	<div class="bg-image"></div>

	<div class="bg-text">
		<h2>Welcome To ATA</h2>
		<h1 style="font-size: 50px">Have A Nice Journey</h1>
		<!--   <p>And I'm a Photographer</p> -->
		<button type="button" class="btn btn-outline-success"
			data-toggle="modal" data-target="#registerModal">Sign-up</button>
		<button type="button" class="btn btn-outline-primary"
			data-toggle="modal" data-target="#loginModal">Login</button>
		<h4 style="color:red; font-size:20px">${msg }</h4>
	</div>



<!-- Login Modal -->

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Please Enter
					your Credentials!!</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
			<!-- form begin -->
				<form action="dologin" method="POST">
					<div class="form-group">
						<label for="UserId">UserID</label> <input type="text"
							class="form-control" id="UserId" aria-describedby="emailHelp"
							name="userID"
							placeholder="UserID" required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							name="password"
							placeholder="Password" required>
					</div>

					<button type="submit" class="btn btn-primary">Login</button>
					<button type="reset" class="btn btn-secondary">reset</button>
				</form>
				<!-- form end -->
				
			</div>

		</div>
	</div>
</div>



<!-- registration Modal  -->

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Enter your
					Details :</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
				
				<!-- Form begin -->
					<form action="doregister" method="POST">
						<div class="row">
							<div class="form-group">
								<label for="firstName">First Name</label> <input type="text" 
									class="form-control" id="firstName" name="firstName"
									aria-describedby="emailHelp" placeholder="Firstname" required>
							</div>
							<div class="form-group">
								<label for="lastName">Last Name</label> <input type="text"
									class="form-control" id="lastName" name="lastName" aria-describedby="emailHelp"
									placeholder="Lastname" required>
							</div>
						</div>

						<div class="form-group">
							<label for="dateOfBirth">Date Of Birth</label> <input type="date"
								class="form-control" id="dateOfBirth" name="dateOfBirth"
								aria-describedby="emailHelp" placeholder="UserID" required>
						</div>
						<div class="form-group">
							<label for="gender">Gender</label>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="male" value="M" > <label
									class="form-check-label" for="male"> Male </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="female" value="F"> <label
									class="form-check-label" for="female"> Female </label>
							</div>
						</div>

						<div class="form-group">
							<label for="street">Street</label> <input type="text"
								class="form-control" id="street" name="street" aria-describedby="emailHelp"
								placeholder="street" required>
						</div>

						<div class="form-group">
							<label for="location">Location</label> <input type="text"
								class="form-control" id="location" name="location" aria-describedby="emailHelp"
								placeholder="Location" required>
						</div>

						<div class="form-group">
							<label for="city">City</label> <input type="text"
								class="form-control" id="city" name="city" aria-describedby="emailHelp"
								placeholder="City" required>
						</div>

						<div class="form-group">
							<label for="state">State</label> <input type="text"
								class="form-control" id="state" name="state" aria-describedby="emailHelp"
								placeholder="State" required>
						</div>

						<div class="form-group">
							<label for="pincode">Pincode</label> <input type="number"
								class="form-control" id="pincode" name="pincode" aria-describedby="emailHelp"
								placeholder="Pincode" required>
						</div>

						<div class="form-group">
							<label for="mobileNo">Mobile</label> <input type="number"
								class="form-control" id="mobileNo" name="mobileNo" aria-describedby="emailHelp"
								placeholder="Mobile" required>
						</div>

						<div class="form-group">
							<label for="emailID">Email Id</label> <input type="email"
								class="form-control" id="emailID" name="emailID" aria-describedby="emailHelp"
								placeholder="Email ID" required>
						</div>

						<div class="form-group">
							<label for="password">Password</label> <input
								type="password" class="form-control" id="password" name="password"
								placeholder="Password">
						</div>

						<button type="submit" class="btn btn-primary">Register</button>
						<button type="reset" class="btn btn-secondary">reset</button>
					</form>
					
					<!-- Form end -->
					
				</div>
			</div>

		</div>
	</div>
</div>
</body>
</html>