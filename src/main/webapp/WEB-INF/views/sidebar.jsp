<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<nav class="navbar-side" role="navigation">
	<div class="navbar-collapse sidebar-collapse collapse">
		<ul id="side" class="nav navbar-nav side-nav">
			<!-- begin SIDE NAV USER PANEL -->
			<li class="side-user hidden-xs"><%-- <img class="img-circle"
				src="${pageContext.request.co ntextPath}/resource/img/profile-pic.jpg"
				alt=""> --%>
				<p class="welcome">
					<i class="fa fa-key"></i> Logged in as
				</p>
				<p class="name tooltip-sidebar-logout">
					Krishman <span class="last-name">Pradhan</span> <a
						style="color: inherit" class="logout_open" href="#logout"
						data-toggle="tooltip" data-placement="top" title="Logout"><i
						class="fa fa-sign-out"></i></a>
				</p>
				<div class="clearfix"></div></li>
			<!-- end SIDE NAV USER PANEL -->
			<!-- begin SIDE NAV SEARCH -->
			<li class="nav-search">
				<form role="form">
					<input type="search" class="form-control" placeholder="Search...">
					<button class="btn">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</li>
			<!-- end SIDE NAV SEARCH -->
			<!-- begin DASHBOARD LINK -->
			
			<li><spring:url value="/adminDashboard" var="adminDashboard" />
				<a href="${adminDashboard }"><i class="fa fa-dashboard"></i>
					Home </a></li>
			<!-- end DASHBOARD LINK -->


			<!--  -->
			
			<li class="panel"><a href="javascript:void(0);" data-parent="#side"
				data-toggle="collapse" class="accordion-toggle" data-target="#forms1">
					<i class="fa fa-edit"></i> Admin <i class="fa fa-caret-down"></i>
			</a>
				<ul class="collapse nav" id="forms1">
					<li><spring:url value="/adminRegister" var="createAdmin" /> <a
						href="${createAdmin }"> <i class="fa fa-angle-double-right"></i>
							Create Admin
					</a></li>

					<li><spring:url value="/adminList" var="adminList" /> <a
						href="${adminList }"> <i class="fa fa-angle-double-right"></i>
							Admin List
					</a></li>

				</ul></li>
				
			<li class="panel"><a href="javascript:void(0);" data-parent="#side"
				data-toggle="collapse" class="accordion-toggle" data-target="#forms">
					<i class="fa fa-edit"></i> Category <i class="fa fa-caret-down"></i>
			</a>
				<ul class="collapse nav" id="forms">


					<li><spring:url value="/displayCategory" var="createCategory" />
						<a href="${createCategory}"> <i
							class="fa fa-angle-double-right"></i> Create Category
					</a></li>
					<li><spring:url value="/categoryList" var="categoryList" /> <a
						href="${categoryList}"> <i class="fa fa-angle-double-right"></i>
							Category List
					</a></li>
				</ul></li>
				
				
				
				
				<li class="panel"><a href="javascript:void(0);" data-parent="#side"
				data-toggle="collapse" class="accordion-toggle" data-target="#forms2">
					<i class="fa fa-edit"></i> User <i class="fa fa-caret-down"></i>
			</a>
				<ul class="collapse nav" id="forms2">

					<li><spring:url value="/userList" var="userList" /> <a
						href="${userList}"> <i class="fa fa-angle-double-right"></i>
							User List
					</a></li>
				</ul></li>
				
				
				
				
				
				</ul>
				
			<!-- /.side-nav -->
	</div>
	<!-- /.navbar-collapse -->
</nav>