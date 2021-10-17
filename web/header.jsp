<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.model.Student" %>
<%@ page import="com.budev.model.Student" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionStudent") != null) {

        Student currentUser = (Student) (session.getAttribute("currentSessionStudent"));
%>

<html>

<head>
    <title>devFees</title>
    <meta name="viewport" content="width=device-width"
          http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <style>
    </style>

</head>


<body>
<header>
    <nav class="navbar navbar-expand-lg mb-2 ">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"> <span class="licolor">Bupayments</span>
            </a>
            <button class="navbar-toggler text-white" type="button"
                    data-toggle="collapse" data-target="#basicExampleNav"
                    aria-controls="basicExampleNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                <i class="fas fa-bars" style="color: white"></i>
            </button>


            <div class="collapse navbar-collapse" id="basicExampleNav">

                <ul class="navbar-nav">

                    <li class="nav-item"><a class="nav-link"
                                            href="application_form.jsp"> <span class="licolor">Application</span>
                    </a></li>

                    <li class="nav-item"><a class="nav-link" href="payment.jsp">
                        <span class="licolor">Payment</span>
                    </a></li>

                    <li class="nav-item"><a class="nav-link" href="#">
                        <span class="licolor">Faculty</span>
                    </a></li>
                </ul>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a
                            class="nav-link waves-effect waves-light" href="stu_profile.jsp">
								<span class="licolor"> <%=currentUser.getS_name()%>
							</span>
                    </a></li>

                    <li class="nav-item"><a
                            class="nav-link waves-effect waves-light" href="logoutController">
                        <span class="licolor">Logout</span>
                    </a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>


<script type="text/javascript" src="assets/js/jspdf.js"></script>
<script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="assets/js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

</body>

</html>

<%
} else {
%>

<html>

<head>
    <meta name="viewport" content="width=device-width"
          http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>devFees</title>

    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="images/s_icon.png"/>
    <link href="style.css" rel="stylesheet">


</head>


<body>
<header>
    <nav class="navbar navbar-expand-lg mb-2 ">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"> <span class="licolor">Bupayments</span>
            </a>


            <button class="navbar-toggler text-white" type="button"
                    data-toggle="collapse" data-target="#basicExampleNav"
                    aria-controls="basicExampleNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="basicExampleNav">
                <ul class="navbar-nav">

                    <li class="nav-item"><a class="nav-link" href="payment.jsp">
                        <span class="licolor">Payment</span>
                    </a></li>

                    <li class="nav-item"><a class="nav-link" href="#">
                        <span class="licolor">Faculty</span>
                    </a></li>


                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a
                            class="nav-link waves-effect waves-light" href="login.jsp"> <span
                            class="licolor">Login</span>
                    </a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>


<script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="assets/js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

</body>

</html>

<%
    }
%>