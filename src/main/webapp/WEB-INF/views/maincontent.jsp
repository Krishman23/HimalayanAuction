<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="page-content">

    <!-- begin PAGE TITLE AREA -->
    <!-- Use this section for each page's title and breadcrumb layout. In this example a date range picker is included within the breadcrumb. -->
    <div class="row">
        <div class="col-lg-12">
            <div class="page-title">
                <h1>Dashboard
                    <small>Himalayan Auction Pvt. Ltd</small>
                </h1>
                <ol class="breadcrumb">
                    <li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
                    <li class="pull-right">
                        <div id="reportrange" class="btn btn-green btn-square date-picker">
                            <i class="fa fa-calendar"></i>
                            <span class="date-range"></span> <i class="fa fa-caret-down"></i>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!-- end PAGE TITLE AREA -->

    <!-- begin DASHBOARD CIRCLE TILES -->
    <div class="row">
        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile">
                <a href="#">
                    <div class="circle-tile-heading dark-blue">
                        <i class="fa fa-users fa-fw fa-3x"></i>
                    </div>
                </a>
                <div class="circle-tile-content dark-blue">
                    <div class="circle-tile-description text-faded">
                        Admin
                    </div>
                    <div class="circle-tile-number text-faded">
                        
                        <span id="sparklineA"></span>
                    </div>
                    <spring:url value="/adminList" var="adminList" /> <a
						href="${adminList }" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile">
                <a href="#">
                    <div class="circle-tile-heading green">
                        <i class="fa fa-money fa-fw fa-3x"></i>
                    </div>
                </a>
                <div class="circle-tile-content green">
                    <div class="circle-tile-description text-faded">
                        Category
                    </div>
                     <div class="circle-tile-number text-faded">
                        
                    </div> 
                    <spring:url value="/categoryList" var="categoryList" /> <a
						href="${categoryList}" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
        </div>
       <div class="col-lg-2 col-sm-6">
            <div class="circle-tile">
                <a href="#">
                    <div class="circle-tile-heading orange">
                        <i class="fa fa-bell fa-fw fa-3x"></i>
                    </div>
                </a>
                <div class="circle-tile-content orange">
                    <div class="circle-tile-description text-faded">
                        User
                    </div>
                    <div class="circle-tile-number text-faded">
                       
                    </div>
                    <spring:url value="/userList" var="userList"/>
                    
                    <a href="${userList }" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
        </div> 
       <!--   <div class="col-lg-2 col-sm-6">
            <div class="circle-tile">
                <a href="#">
                    <div class="circle-tile-heading blue">
                        <i class="fa fa-tasks fa-fw fa-3x"></i>
                    </div>
                </a>
                <div class="circle-tile-content blue">
                    <div class="circle-tile-description text-faded">
                        Tasks
                    </div>
                    <div class="circle-tile-number text-faded">
                        10
                        <span id="sparklineB"></span>
                    </div>
                    <a href="#" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile">
                <a href="#">
                    <div class="circle-tile-heading red">
                        <i class="fa fa-shopping-cart fa-fw fa-3x"></i>
                    </div>
                </a>
                <div class="circle-tile-content red">
                    <div class="circle-tile-description text-faded">
                        Orders
                    </div>
                    <div class="circle-tile-number text-faded">
                        24
                        <span id="sparklineC"></span>
                    </div>
                    <a href="#" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile">
                <a href="#">
                    <div class="circle-tile-heading purple">
                        <i class="fa fa-comments fa-fw fa-3x"></i>
                    </div>
                </a>
                <div class="circle-tile-content purple">
                    <div class="circle-tile-description text-faded">
                        Mentions
                    </div>
                    <div class="circle-tile-number text-faded">
                        96
                        <span id="sparklineD"></span>
                    </div>
                    <a href="#" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
        </div>-->
    </div>
    <!-- end DASHBOARD CIRCLE TILES -->

</div>
<!-- /.page-content -->