<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="page-content">

	
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
</div>
<!-- new file starts here -->


<h1>All Users</h1>

 <div class="container">
 <div class="table-responsive"> 
		<table  class="table">
			<thead>
				<tr>
					 <th>Id</th> 
					<th>Full Name</th>
					<th>Email</th>
					<th>UserName</th>
					<th>Action</th>
				</tr>
			</thead>		


       <c:forEach var="admin" items="${admins }">

 				<tr>
				 <td >${admin.adminId }</td>
				<td >${admin.fullName }</td>
				<td >${admin.email }</td>
				<td >${admin.adminCredential.username}</td>
				
					<td>
				
				<spring:url value="/editAdmin?id=${admin.adminId}" var="editAdmin" />
	           <a href="${editAdmin}"><button class="btn btn-primary">Edit</button></a>
	           
	           <spring:url value="/deleteAdminList?id=${admin.adminId}" var="deleteAdminList" />
	           <a href="${deleteAdminList}"><button class="btn btn-primary">Delete</button ></a></td>
				
				</tr>
</c:forEach>
</table>
</div> 
</div>
      