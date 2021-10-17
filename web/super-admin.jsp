<%@include file="admin-header.jsp" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();

    if ((session.getAttribute("currentSessionForSuperAdmin") != null)
            || (session.getAttribute("currentSessionForSubAdmin") != null)) {
%>


<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
    <li class="breadcrumb-item active">Overview</li>
</ol>


<!-- Icon Cards-->
<div class="row">
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">Total Students 30</div>
            </div>
            <a class="card-footer text-white clearfix small z-1"
               href="adminShowStudentsController?page=1"> <span class="float-left">View
					Details</span> <span class="float-right"> <i
                    class="fas fa-angle-right"></i>
			</span>
            </a>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">Total Development Fees 20</div>
            </div>
            <a class="card-footer text-white clearfix small z-1"
               href="admin_show_development_fees_table.jsp"> <span
                    class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
            </a>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">Total Semester Fees 15</div>
            </div>
            <a class="card-footer text-white clearfix small z-1"
               href="admin_show_semester_fees_table.jsp"> <span
                    class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
            </a>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5">Total Form fillup Fees 30</div>
            </div>
            <a class="card-footer text-white clearfix small z-1"
               href="admin_show_formfillup_fees_table.jsp"> <span
                    class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
            </a>
        </div>
    </div>
</div>


<%@include file="admin-footer.jsp" %>


<%
} else {
%>

<%@include file="admin-login.jsp" %>

<%
    }
%>






