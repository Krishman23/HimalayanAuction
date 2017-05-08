<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!-- PACE LOAD BAR PLUGIN - This creates the subtle load bar effect at the top of the page. -->
    <link href="${pageContext.request.contextPath}/resource/css/plugins/pace/pace.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resource/js/plugins/pace/pace.js"></script>

    <!-- GLOBAL STYLES - Include these on every page. -->
    <link href="${pageContext.request.contextPath}/resource/css/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic' rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resource/icons/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- PAGE LEVEL PLUGIN STYLES -->
    <link href="${pageContext.request.contextPath}/resource/css/plugins/messenger/messenger.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins/messenger/messenger-theme-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins/morris/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins/datatables/datatables.css" rel="stylesheet">

    <!-- THEME STYLES - Include these on every page. -->
    <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/plugins.css" rel="stylesheet">

    <!-- THEME DEMO STYLES - Use these styles for reference if needed. Otherwise they can be deleted. -->
    <link href="${pageContext.request.contextPath}/resource/css/demo.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->