<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Bootstrap-->
 <%@include file="components/common_css_js.jsp"%>

<link rel="stylesheet" href="css/login.css"
	type="text/css">



<title>Login Page</title>

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

    <%@include file="components/navbar.jsp" %>

	<div id="BG">

		<div class="Box">
			<%@include file="components/Message.jsp"%>
			<div class="header">
				<h2>Login Here</h2>
			</div>


			<form action="/coffeeShop/loginServlet" id="form" class="form"
				method="post">

				<div class="form-control">
					<label>Email Address:</label> <input type="email" name="email"
						id="email" class="form-email" placeholder="Your Email Id">
					<small class="error_form" id="email_error_msg"></small>
				</div>

				<div class="form-control">
					<label>Password:</label> <input type="password" name="password"
						id="password" class="form-password" placeholder="Password">
					<small class="error_form" id="password_error_msg"></small>
				</div>

				<a href="register.jsp" style="padding:0px 0px 0px 10px;">Sign up!!</a> <input type="submit"
					value="Sign in" id="btn">

			</form>
		</div>
	</div>

	<!-- <script type="text/javascript">
            $(function() {
                $("#email_error_msg").hide();
                $("#password_error_msg").hide();
    
                var error_email = true;
                var error_password = true;
                    
                
                $("#email").focusout(function() {
                    validate_email();
                });
                $("#password").focusout(function() {
                    validate_password();
                });

        
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

    
         
                    function submit_form() {
    
                            if (error_email === false
                                    && error_password === false) {
                                $("#btn").attr('disabled', false);
                                return true;
                            }
                        }
            });
              
        </script> -->
        
        	<%@include file="components/commonModals.jsp" %>

</body>

</html>
    