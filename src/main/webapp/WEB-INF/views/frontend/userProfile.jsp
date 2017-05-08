<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!----content---->

<style type="text/css">
.main-center {
	margin-top: 30px;
	margin: 0 auto;
	max-width: 700px;
	padding: 10px 40px;
	background: #FFFFFF;
	color: #444444;
	text-shadow: none;
	-webkit-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
	-moz-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
	box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
	text-shadow: none;
}

.main-login {
	background-color: #fff;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.form-error-new {
	background-color: #asd;
	color: #FF0000;
}

.profileImg {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 5px;
	width: 150px;
	height: 150px;
}

.profileImg:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

.profile-text {
	font-size: 18px;
	color: #286090;
}
</style>
<!-- user Profile code -->

<div class="content">
	<div class="container">
		<div class="main-center">
			<div class="row">
				<div class="col-sm-4">
				<img  class="img-responsive profileImg"  src="<c:url value="/resource/img/users_${user.userId}.jpg"></c:url>" alt="${user.fullName}" /> 
				</div>
				<div class="col-sm-8 profile-text">
					<div class="col-sm-4">Full Name:</div>
					<div class="col-sm-8">${user.fullName}</div>
					<div class="col-sm-4">Email:</div>
					<div class="col-sm-8">${user.email}</div>
					<div class="col-sm-4">Address:</div>
					<div class="col-sm-8">${user.street}<br />${user.city}
						${user.state }${user.zip}<br>${user.country}</div>

					<p>
						<a href="<spring:url value="/users/${user.userId}/edit" />"
							class="btn btn-primary  btn-mini  ">Update User</a>
					</p>
				</div>
			</div>

		</div>
	</div>
</div>