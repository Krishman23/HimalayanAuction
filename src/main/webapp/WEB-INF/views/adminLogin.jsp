
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- begin PAGE TITLE AREA -->
<!-- Use this section for each page's title and breadcrumb layout. In this example a date range picker is included within the breadcrumb. -->

<div class="row">
	<div class="col-lg-12">
		<div class="page-title">
			<h1>
				Dashboard <small>Himalayan Auction Pvt. Ltd.</small>
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

<div class="row">


	<form:form modelAttribute="adminForm" action="adminLogin"
		class="form-horizontal">
		<div class="form-group" >
				<p>${message }</p>
					<form:errors path="*" class="form-error-new" cssClass="text-danger"/>
				</div>
		<fieldset>
		

			<div class="form-group">
				<label class="control-label col-lg-2" for="username">UserName</label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input id="username" path="username" type="text"
							class="form:input-large" />
							<form:errors path="username" cssClass="text-danger"/>

					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="password">Password
				</label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input id="password" path="password" type="password"
							class="form:input-large" />
						 <form:errors path="password" cssClass="text-danger"/> 
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary"
						value="Login" />
				</div>
			</div>
	</fieldset>
</form:form>

</div>