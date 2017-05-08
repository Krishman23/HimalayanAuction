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

<h1>User Details </h1>

<div class="container">
<div class="table-responsive">

<table  class="table">
			<thead>
				<tr>
					 <th>Id</th>
					<th>Full Name</th>
					<th>Email</th>
					<th>UserName</th>
					<th>Phone</th>
					<th>street</th>
					 <th>city</th>
					<th>state</th>
					<th>zip</th>
					<th>country</th>
				</tr>
			</thead>
			
			
			
			<c:forEach var="user" items="${users }" >
			<tr>
				<td>${user.userId }</td>
				<td>${user.fullName }</td>
				<td>${user.email }</td>
				<td>${user.userCredential.userName }</td>
				<td>${user.phone }</td>
				<td>${user.street }</td>
				 <td>${user.city }</td>
				<td>${user.state }</td>
				<td>${user.zip }</td>
				<td>${user.country }</td> 
				<td><spring:url value="/deleteUserList?id=${user.userId}" var="deleteUserList" />
	           <a href="${deleteUserList}"><button class="btn btn-primary">Delete</button ></a>
				
				</td>
			</tr>
			</c:forEach>
			</table>
</div>

</div>