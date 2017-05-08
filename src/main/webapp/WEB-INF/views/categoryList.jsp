<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- /.col-lg-12 -->
</div>


<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>

			</tr>
		</thead>

		<c:forEach var="category" items="${categories }">
			<tr>
				<td>${category.categoryId}</td>
				<td>${category.name }</td>
				<td>${category.description }</td>
				<td><spring:url value="/editList?id=${category.categoryId}"
						var="editList" /> <a href="${editList}"><button class="btn btn-primary">Edit</button></a>

					<spring:url value="/deleteCategoryList?id=${category.categoryId}"
						var="deleteCategoryList" /> <a href="${deleteCategoryList}"><button class="btn btn-primary">Delete</button></a>
				</td>
			</tr>

		</c:forEach>
	</table>
</div>

</html>