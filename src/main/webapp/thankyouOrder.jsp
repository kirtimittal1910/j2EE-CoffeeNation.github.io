<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" href="css/order.css" type="text/css">
<title>Thank You Page</title>
</head>
<body onload="OrderPage()">
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="card">
				<div class="card-header">
					<h1>Thank You For Ordering!!</h1>
				</div>
				<div class="card-body">
					<h5>Your order will be delivered Soon.</h5>
				</div>

			</div>

		</div>

	</div>
<%@include file="components/commonModals.jsp" %>
</body>
</html>