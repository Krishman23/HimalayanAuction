<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!----content---->
<div class="content">
	<div class="container">
		<style type="text/css">
.main-center {
	margin-top: 30px;
	margin: 0 auto;
	max-width: 400px;
	padding: 10px 40px;
	background: #009edf;
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
</style>
		<!---top-row--->
		<div class="main-login main-center">
			<h4>
				<spring:message code="register.form.title" />
			</h4>
			<form:form modelAttribute="editUser" method="POST">

				<div class="form-group">
					<form:errors path="*" class="form-error-new" />
				</div>
				<div class="form-group">
					<label for="name" class="cols-sm-2 control-label"><spring:message
							code="register.form.fullName" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span>
							<form:input path="fullName" class="form-control" id="fullname"
								placeholder="Enter your Full Name" type="text"
								value="${user.fullName}" />
						</div>
						<form:errors path="fullName" class="form-error-new" />
					</div>
				</div>

				<div class="form-group">
					<label for="email" class="cols-sm-2 control-label"><spring:message
							code="register.form.email" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-envelope fa" aria-hidden="true"></i></span>
							<form:input path="email" class="form-control" id="email"
								placeholder="Enter your Email" type="text" value="${user.email}" />
						</div>
						<form:errors path="email" class="form-error-new" />
					</div>
				</div>


				<div class="form-group">
					<label for="phone" class="cols-sm-2 control-label"><spring:message
							code="register.form.phone" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input path="phone" class="form-control" id="phone"
								placeholder="Enter your Phone" type="text" value="${user.phone}" />
							<%-- <form:errors path="phone" class="form-error-new"> --%>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="street" class="cols-sm-2 control-label"><spring:message
							code="register.form.street" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input path="street" class="form-control" id="street"
								placeholder="Enter your Street" type="text"
								value="${user.street}" />

						</div>
						<form:errors path="street" class="form-error-new" />
					</div>
				</div>

				<div class="form-group">
					<label for="city" class="cols-sm-2 control-label"><spring:message
							code="register.form.city" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input path="city" class="form-control" id="city"
								placeholder="Enter your City" type="text" value="${user.city}" />
							<%-- <form:errors path="state" class="form-error-new"> --%>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="state" class="cols-sm-2 control-label"><spring:message
							code="register.form.state" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input path="state" class="form-control" id="state"
								placeholder="Enter your State" type="text" value="${user.state}" />
							<%-- <form:errors path="state" class="form-error-new"> --%>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="zip" class="cols-sm-2 control-label"><spring:message
							code="register.form.zip" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input path="zip" class="form-control" id="zip"
								placeholder="Enter your Zip" type="text" value="${user.zip}" />
						</div>
						<form:errors path="zip" class="form-error-new" />
					</div>
				</div>

				<div class="form-group">
					<label for="country" class="cols-sm-2 control-label"><spring:message
							code="register.form.country" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input path="country" class="form-control" id="country"
								placeholder="Enter your Country" type="text"
								value="${user.country}" />
							<%-- <form:errors path="country" class="form-error-new"> --%>
						</div>
					</div>
				</div>
				<form:input path="userId" class="form-control" id="userId"
					placeholder="Enter your Full Name" type="hidden"
					value="${user.userId}" />
				<form:input path="userCredential.userName" class="form-control"
					id="userCredential.userName" placeholder="Enter your Full Name"
					type="hidden" value="${user.userCredential.userName}" />
				<div class="form-group ">
					<input type="submit" name="update"
						value="<spring:message code="register.form.register"/>"
						class="btn btn-primary btn-lg btn-block login-button">
				</div>
			</form:form>
		</div>

	</div>
	<!---//speical-products---->
</div>
<!----content---->
