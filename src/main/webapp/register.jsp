<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Bootstrap-->
 <%@include file="components/common_css_js.jsp"%>

<link rel="stylesheet" href="css/register.css"
	type="text/css">



<title>Register Page</title>

<style>
.error {
	border-color: #e74c3c;
}

.Kirti {
	border-color: #2ecc71;
}
</style>

</head>

<body>

	<%@include file="components/navbar.jsp"%>

	<div id="BG">

		<div class="Box">
			<%@include file="components/Message.jsp"%>

			<div class="header">
				<h2>Register Here</h2>
			</div>


			<form action="/coffeeShop/registerServlet" id="form" class="form"
				method="post">
				<div class="form-control">
					<label>User Name:</label> <input type="text" name="name" id="name"
						class="form-name" placeholder="Enter Your Name"> <small
						class="error_form" id="name_error_msg"></small>
				</div>

				<div class="form-control">
					<label>User Email:</label> <input type="email" name="email"
						id="email" class="form-email" placeholder="Your Email Id">
					<small class="error_form" id="email_error_msg"></small>
				</div>

				<div class="form-control">
					<label>User Password:</label> <input type="password"
						name="password" id="password" class="form-password"
						placeholder="Password"> <small class="error_form"
						id="password_error_msg"></small>
				</div>

				<div class="form-control">
					<label>User PhoneNo:</label> <input type="number" name="number"
						id="number" class="form-number" placeholder="Your Phone number">
					<small class="error_form" id="phone_error_msg"></small>
				</div>

				<input type="submit" value="Submit" id="btn" disabled>

			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$("#name_error_msg").hide();
			$("#email_error_msg").hide();
			$("#password_error_msg").hide();
			$("#phone_error_msg").hide();

			var error_name = true;
			var error_email = true;
			var error_password = true;
			var error_phone = true;

			$("#name").focusout(function() {
				validate_name();
			});
			$("#email").focusout(function() {
				validate_email();
			});
			$("#password").focusout(function() {
				validate_password();
			});
			$("#number").focusout(function() {
				validate_phone();
			});

			function validate_name() {
				var pattern = /^[a-zA-Z]*$/;
				var name = $("#name").val();
				if (name !== '') {
					if (pattern.test(name)) {
						$("#name_error_msg").hide();
						$("#name").css("border", "2px solid #2ecc71");
						error_name = false;
						submit_form();
					} else {
						$("#name_error_msg").html(
								"Should contain only characters");
						$("#name_error_msg").show();
						$("#name").css("border", " 2px solid #e74c3c");
					}

					if (name.length <= 2) {
						$("#name_error_msg").html("Min 3 charcater");
						$("#name_error_msg").show();
						$("#name").css("border", " 2px solid #e74c3c");
					}
				} else {
					$("#name_error_msg").html("name cannot blank");
					$("#name_error_msg").show();
					$("#name").css("border", "2px solid #e74c3c");
				}
			}

			function validate_password() {
				var password = $("#password").val();
				if (password === '') {
					$("#password_error_msg").html("password cannot blank");
					$("#password_error_msg").show();
					$("#password").css("border", "2px solid #e74c3c");
				} else if (password.length < 8) {
					$("#password_error_msg").html("Atleast 8 characater");
					$("#password_error_msg").show();
					$("#password").css("border", "2px solid #e74c3c");
				} else if (password.search(/[0-9]/) == -1) {
					$("#password_error_msg").html("Atleast 1 numeric value");
					$("#password_error_msg").show();
					$("#password").css("border", "2px solid #e74c3c");
				} else if (password.search(/[a-z]/) == -1) {
					$("#password_error_msg").html("Atleast 1 lowercase letter");
					$("#password_error_msg").show();
					$("#password").css("border", "2px solid #e74c3c");
				} else if (password.search(/[A-Z]/) == -1) {
					$("#password_error_msg").html("Atleast 1 UpperCase Letter");
					$("#password_error_msg").show();
					$("#password").css("border", "2px solid #e74c3c");
				} else if (password.search(/[!\@\#\$\%\^\&\(\)\-\.\,\;\:]/) == -1) {
					$("#password_error_msg")
							.html("Atleast 1 Special Character");
					$("#password_error_msg").show();
					$("#password").css("border", "2px solid #e74c3c");
				} else {
					$("#password_error_msg").hide();
					$("#password").css("border", "2px solid #2ecc71");
					error_password = false;
					submit_form();
				}
			}

			function validate_email() {
				var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
				var email = $("#email").val();
				if (pattern.test(email) && email !== '') {
					$("#email_error_msg").hide();
					$("#email").css("border", "2px solid #2ecc71");
					error_email = false;
					submit_form();
				} else {
					$("#email_error_msg").html("Invalid Email");
					$("#email_error_msg").show();
					$("#email").css("border", "2px solid #e74c3c");
				}
			}

			function validate_phone() {
				var number = $("#number").val();
				if (number === '') {
					$("#phone_error_msg").html("PhoneNo cannot blank");
					$("#phone_error_msg").show();
					$("#number").css("border", "2px solid #e74c3c");
				} else if (number.length != 10) {
					$("#phone_error_msg").html("Enter correct number");
					$("#phone_error_msg").show();
					$("#number").css("border", "2px solid #e74c3c");
				} else {
					$("#phonr_error_msg").hide();
					$("#number").css("border", "2px solid #2ecc71");
					error_phone = false;
					submit_form();
				}

			}

			function submit_form() {
				if (error_name === false && error_email === false
						&& error_password === false && error_phone === false) {
					$("#btn").attr('disabled', false);
					return true;
				}
			}
		});
	</script>
	<%@include file="components/commonModals.jsp" %>

</body>

</html>
    