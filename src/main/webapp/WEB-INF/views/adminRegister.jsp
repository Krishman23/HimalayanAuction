


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- begin PAGE TITLE AREA -->
<!-- Use this section for each page's title and breadcrumb layout. In this example a date range picker is included within the breadcrumb. -->

<div class="row">
	<div class="col-lg-12">
		<div class="page-title">
			<h1>
				Dashboard <small>Himalayan Auction Pvt. Ltd</small>
			</h1>
			<ol class="breadcrumb">
				<li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
				<li class="pull-right">
					<div id="reportrange" class="btn btn-green btn-square date-picker">
						<i class="fa fa-calendar"></i> <span class="date-range"></span> <i
							class="fa fa-caret-down"></i>
					</div>
				</li>
			</ol>
		</div>
	</div>
	</div>
	
	<!-- /.col-lg-12 -->



<div class="row">

<a href="?language=en" >English</a>  |  <a href="?language=ne_NP" >Nepali</a><br>

	<fieldset>
		<legend><spring:message code="admin.form.title"/></legend>

		<form:form modelAttribute="admin" action="adminRegister" class="form-horizontal" >



			<div class="form-group">
				
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input   id="adminId" path="adminId"  type="hidden"
							class="form:input-large" />
						 <form:errors path="adminId" cssClass="text-danger"/> 
					</div>
				</div>
			</div>
			
			<div class="form-group">
				
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input   id="adminCredential.id" path="adminCredential.id"  type="hidden"
							class="form:input-large" />
						 <form:errors path="adminCredential.id" cssClass="text-danger"/> 
					</div>
				</div>
			</div>
			


			<div class="form-group">
				<label class="control-label col-lg-2" for="fullName"><spring:message code="admin.form.fullName"/></label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input   id="fullName" path="fullName"  type="text"
							class="form:input-large" />
						 <form:errors path="fullName" cssClass="text-danger"/> 
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="email"><spring:message code="admin.form.email"/></label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input  id="email" path="email"  type="text"
							class="form:input-large" />
						 <form:errors path="email" cssClass="text-danger"/> 
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="userName"><spring:message code="admin.form.username"/></label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input  id="userName" path="adminCredential.username"  type="text"
							class="form:input-large" />
						 <form:errors path="adminCredential.username" cssClass="text-danger"/>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="password"><spring:message code="admin.form.password"/></label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input id="password" path="adminCredential.password" type="password"
							class="form:input-large" />
						<form:errors path="adminCredential.password" cssClass="text-danger"/> 
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary"
						value="<spring:message code="admin.form.button"/>" />
				</div>
			</div>
		</form:form>
		
	</fieldset>

</div>
