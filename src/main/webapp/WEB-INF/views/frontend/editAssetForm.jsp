
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- Date Range Picker -->
<script
	src="${pageContext.request.contextPath}/resource/js/plugins/daterangepicker/moment.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<link
	href="${pageContext.request.contextPath}/resource/css/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet">
<!----content---->
<div class="content">
	<div class="container">
		<style type="text/css">
.main-center {
	margin-top: 30px;
	margin: 0 auto;
	max-width: 400px;
	padding: 10px 40px; //
	background: #009edf;
	color: #444444;
	text-shadow: none;
	-webkit-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
	-moz-box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
	box-shadow: 0px 3px 5px 0px rgba(0, 0, 0, 0.31);
	text-shadow: none;
}

.main-login {
	max-width: 100%;
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
		<div class="main-login">
			<div class="main-center">
				<h4><spring:message code="asset.form.header"/></h4>
				<%-- <c:forEach items="${categories}" var="category">
				${category.key} ${category.value} 
				</c:forEach> --%>
				<form:form modelAttribute="editAsset" method="post" enctype="multipart/form-data">
					<form:input path="assetId" class="form-control" id="assetId"
						type="hidden" value="${asset.assetId}" />
					<div class="form-group">
						<%-- <form:errors path="*" class="form-error-new" />  --%>
					</div>
					<div class="form-group">
						<label for="category" class="cols-sm-2 control-label"><spring:message code="asset.form.Category"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:select path="category.categoryId" class="form-control">


									<c:forEach items="${categories}" var="category">
										<c:choose>
											<c:when test="${category.key == assetCategoryId}">
												<form:option value="${category.key}" selected="true">${category.value}</form:option>
											</c:when>
											<c:otherwise>
												<form:option value="${category.key}">${category.value}</form:option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</form:select>
								<%-- <form:errors path="category" class="form-error-new" /> --%>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label"><spring:message code="asset.form.assetName"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span>
								<form:input path="name" class="form-control" id="name"
									placeholder="Enter Asset Name" type="text"
									value="${asset.name}" />
								 <form:errors path="name" class="form-error-new" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="model" class="cols-sm-2 control-label"><spring:message code="asset.form.assetModel"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<form:input path="model" class="form-control" id="model"
									placeholder="Enter Asset Model" type="text"
									value="${asset.model}" />
								<form:errors path="model" class="form-error-new" /> 
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="brand" class="cols-sm-2 control-label"><spring:message code="asset.form.assetBrand"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-user-circle" aria-hidden="true"></i></span>
								<form:input path="brand" class="form-control" id="brand"
									placeholder="Enter Brand" type="text" value="${asset.brand}" />
								 <form:errors path="brand" class="form-error-new" /> 
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="description" class="cols-sm-2 control-label"><spring:message code="asset.form.description"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:input path="description" class="form-control"
									id="description" placeholder="Enter Description" type="text"
									value="${asset.description}" />
								 <form:errors path="description" class="form-error-new" /> 
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="minimumBidAmount" class="cols-sm-2 control-label"><spring:message code="asset.form.minBidAmount"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:input path="minimumBidAmount" class="form-control"
									id="minimumBidAmount" placeholder="Enter Minimum Bid Amount"
									type="text" value="${asset.minimumBidAmount}" />
								 <form:errors path="minimumBidAmount" class="form-error-new" />
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="maximumBidAmount" class="cols-sm-2 control-label"><spring:message code="asset.form.maxBidAmount"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:input path="maximumBidAmount" class="form-control"
									id="maximumBidAmount" placeholder="Enter Maximum Bid Amount"
									type="text" value="${asset.maximumBidAmount}" />
								 <form:errors path="maximumBidAmount" class="form-error-new" /> 
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="bidStartDate" class="cols-sm-2 control-label">
						<spring:message code="asset.form.bidStartDate"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:input path="bidStartDate"
									class="form-control datetimepicker" id="bidStartDate"
									placeholder="Enter Bid Start Date" type="text"
									value="${bidStartDate}" />
								 <form:errors path="bidStartDate" class="form-error-new" /> 
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="bidEndDate" class="cols-sm-2 control-label">
<spring:message code="asset.form.bidEndDate"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:input path="bidEndDate"
									class="form-control datetimepicker" id="bidEndDate"
									placeholder="Enter Bid End Date" type="text"
									value="${bidEndDate}" />
								 <form:errors path="bidEndDate" class="form-error-new" /> 
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="status" class="cols-sm-2 control-label">
<spring:message code="asset.form.status"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<form:select path="status" class="form-control">
									<form:options items="${statusArray}" />
								</form:select>
								 <form:errors path="status" class="form-error-new" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="status" class="cols-sm-2 control-label">
						<spring:message code="asset.form.images"/></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg " aria-hidden="true"></i></span>
								<input id="picture1" name="pictures"  type="file" class="  form-control" accept="image/*"/>
								<input id="picture2" name="pictures"  type="file" class="  form-control" accept="image/*"/>
								<input id="picture3" name="pictures"  type="file" class="  form-control" accept="image/*"/>
							
							</div>
						</div>
					</div>
						
							 <img
								src="<c:url value="/resource/img/assets/${savedPictures}_0.jpg"></c:url>"
								alt="" style="width: 100px" /> <img
								src="<c:url value="/resource/img/assets/${savedPictures}_1.jpg"></c:url>"
								alt="" style="width: 100px" /> <img
								src="<c:url value="/resource/img/assets/${savedPictures}_2.jpg"></c:url>"
								alt="" style="width: 100px" /> 
						
					<div class="form-group">
						<form:input path="user.userId" class="form-control" id="user"
							type="hidden" value="${assetUserId}" />
					</div>

					<div class="form-group ">
						<input type="submit" name="addAsset" value="Add Asset"
							class="btn btn-primary btn-lg btn-block login-button">
						<!-- <a href="http://deepak646.blogspot.in" target="_blank" type="button"
						id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a> -->
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!---//speical-products---->
</div>
<!----content---->
