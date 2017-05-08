<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Himalayan Admin - Responsive Admin Theme</title>

    <!-- GLOBAL STYLES -->
    <link href="${pageContext.request.contextPath}/resource/css/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic' rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resource/icons/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- PAGE LEVEL PLUGIN STYLES -->

    <!-- THEME STYLES -->
    <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins.css" rel="stylesheet">

    <!-- THEME DEMO STYLES -->
    <link href="${pageContext.request.contextPath}/resource/css/demo.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/resource/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login">

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-banner text-center">
                    <h1><i class="fa fa-gears"></i> Himalayan Auction</h1>
                </div>
                <div class="portlet portlet-green">
                    <div class="portlet-heading login-heading">
                        <div class="portlet-title">
                            <h4><strong>Login to Himalayan Auction Admin!</strong>
                            </h4>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    
                    <div class="portlet-body">
                        <form:form modelAttribute="adminForm" action="adminLogin" >
                        <p>${message }</p>
                            <fieldset>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="User Name" id="username" path="username" name="username" type="text"/>
                                    <form:errors path="username" cssClass="text-danger"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Password" id="password" path="password" name="password" type="password"/>
                                    <form:errors path="password" cssClass="text-danger"/> 
                                </div>
                              
                                <br>
                                <input class="btn btn-lg btn-green btn-block" type="submit" value="Login">
                            </fieldset>
                            <br>
	                           
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- GLOBAL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resource/js/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!-- HISRC Retina Images -->
    <script src="${pageContext.request.contextPath}/resource/js/plugins/hisrc/hisrc.js"></script>

    <!-- PAGE LEVEL PLUGIN SCRIPTS -->

    <!-- THEME SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resource/js/flex.js"></script>

</body>
</html>
