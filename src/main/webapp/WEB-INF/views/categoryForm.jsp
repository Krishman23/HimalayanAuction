


<div class="page-content">

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<!-- begin PAGE TITLE AREA -->
	<!-- Use this section for each page's title and breadcrumb layout. In this example a date range picker is included within the breadcrumb. -->
	<div class="row">
		<div class="col-lg-12">
			<div class="page-title">
				<h1>
					Dashboard <small>Content Overview</small>
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
		<!-- /.col-lg-12 -->
	</div>
</div>



<div class="row">
	<a href="?language=en">English</a> | <a href="?language=ne_NP">Nepali</a><br>
	<fieldset>
		<legend>
			<spring:message code="category.form.title" />
		</legend>
		<form:form modelAttribute="categoryform" action="displayCategory"
			class="form-horizontal">

			<div class="form-group">

				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input value="${category.categoryId}" id="categoryId"
							path="categoryId" type="hidden" class="form:input-large" />

					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-lg-2" for="name"><spring:message
						code="category.form.name" /></label>
				<div class="col-lg-10">
					<div class="form:input-prepend">
						<form:input value="${category.name}" id="name" path="name"
							type="text" class="form:input-large" />
						<form:errors path="name" cssClass="text-danger" />
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-lg-2" for="description"><spring:message
						code="category.form.description" /></label>
				<div class="col-lg-10">
					<div class="form:input-prepend">

						<form:input id="description" value="${category.description } "
							path="description" type="text" class="form:input-large" />
							<form:errors path="description" cssClass="text-danger" />
					</div>
				</div>
			</div>



			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary"
						value="<spring:message code="category.form.button"/>" />
				</div>
			</div>
		</form:form>
	</fieldset>

</div>




<!-- end PAGE TITLE AREA -->

<!-- begin DASHBOARD CIRCLE TILES -->

<!-- end DASHBOARD CIRCLE TILES -->


<!-- /.page-content -->