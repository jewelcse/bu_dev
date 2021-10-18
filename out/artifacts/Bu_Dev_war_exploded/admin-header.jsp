<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.Dao.adminDao"
         import="com.budev.controller.dbConnection" import="com.budev.model.Admin"
         import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionForSuperAdmin") != null) {
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>buPayments</title>

    <!-- Custom fonts for this template-->
    <link href="assets/vendor/fontawesome-free/css/all.min.css"
          rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="assets/vendor/datatables/dataTables.bootstrap4.css"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="assets/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="super-admin.jsp">buPayments</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0"
            id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form
            class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..."
                   aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1"><a
                class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> <span class="badge badge-danger">9+</span>
        </a></li>
        <li class="nav-item dropdown no-arrow mx-1"><a
                class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
        </a>
            <div class="dropdown-menu dropdown-menu-right"
                 aria-labelledby="messagesDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow"><a
                class="nav-link dropdown-toggle" href="#" id="userDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> <span> <%
            out.print(session.getAttribute("currentSuperAdminName"));
        %>


				</span>
        </a>
            <div class="dropdown-menu dropdown-menu-right"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item"
                   href="adminController?target=show_all_admin">All Sub Admin</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="adminLogout" data-toggle="modal"
                   data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active"><a class="nav-link"
                                       href="super-admin.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a></li>

        <li class="nav-item"><a class="nav-link"
                                href="adminController?target=show_all_admin"> <i
                class="fas fa-fw fa-chart-area"></i> <span>Sub-admins</span></a></li>

        <li class="nav-item"><a class="nav-link"
                                href="adminController?target=update_development_fee"> <i
                class="fas fa-fw fa-chart-area"></i> <span>Update Dev Fee</span></a></li>

        <li class="nav-item"><a class="nav-link"
                                href="adminShowStudentsController?page=1"> <i
                class="fas fa-fw fa-table"></i> <span>Students Information</span></a></li>
        <li class="nav-item"><a class="nav-link"
                                href="adminController?target=all_application"> <i
                class="fas fa-fw fa-table"></i> <span>Application Letters</span></a></li>

        <li class="nav-item dropdown"><a
                class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>All
						Payment</span>
        </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                <a class="dropdown-item"
                   href="adminShowAllFeesController?target=all_developmentfee">Development Fees</a>
                <a class="dropdown-item" href="adminShowAllFeesController?target=all_semesterfee">Semester
                    Fees</a> <a class="dropdown-item"
                                href="adminShowAllFeesController?target=all_formfillupfee">Form Fillup Fee</a>

            </div>
        </li>


        <li class="nav-item dropdown"><a
                class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Update
						Information</span>
        </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                <a class="dropdown-item"
                   href="adminFeesManageController?type=developmentfee&&page=1">Development
                    Fees</a> <a class="dropdown-item"
                                href="adminFeesManageController?type=semesterfee&&page=1">Semester
                Fees</a> <a class="dropdown-item"
                            href="adminFeesManageController?type=formfillupfee&&page=1">Form
                Fillup Fee</a>

            </div>
        </li>


    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">


                <%
					}

					else if (session.getAttribute("currentSessionForSubAdmin") != null) {
						
						
						
						Admin currentsubAdmin = (Admin) (session.getAttribute("currentSessionForSubAdmin"));
						
						
						Admin subadmin = adminDao.getSubAdminById(currentsubAdmin.getId());
						
						System.out.println(subadmin.getItem1() + " "+ subadmin.getItem2()+ " "+ subadmin.getItem3()+ " "+ subadmin.getItem4()+ " "+ subadmin.getItem5()+ " "+ subadmin.getItem6());
						
				%>
            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport"
                      content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="">
                <meta name="author" content="">

                <title>buPayments</title>

                <!-- Custom fonts for this template-->
                <link href="assets/vendor/fontawesome-free/css/all.min.css"
                      rel="stylesheet" type="text/css">

                <!-- Page level plugin CSS-->
                <link href="assets/vendor/datatables/dataTables.bootstrap4.css"
                      rel="stylesheet">

                <!-- Custom styles for this template-->
                <link href="assets/css/sb-admin.css" rel="stylesheet">

            </head>

            <body id="page-top">

            <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

                <a class="navbar-brand mr-1" href="super-admin.jsp">buPayments</a>

                <button class="btn btn-link btn-sm text-white order-1 order-sm-0"
                        id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Navbar Search -->
                <form
                        class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Navbar -->
                <ul class="navbar-nav ml-auto ml-md-0">
                    <li class="nav-item dropdown no-arrow mx-1"><a
                            class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <span class="badge badge-danger">9+</span>
                    </a></li>
                    <li class="nav-item dropdown no-arrow mx-1"><a
                            class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
                    </a>
                        <div class="dropdown-menu dropdown-menu-right"
                             aria-labelledby="messagesDropdown">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><%=currentsubAdmin.getName()%>
                            </a>
                        </div>
                    </li>
                    <li class="nav-item dropdown no-arrow"><a
                            class="nav-link dropdown-toggle" href="#" id="userDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <span> <%
                        out.print(session.getAttribute("currentSubAdminName"));
                    %>


				</span>
                    </a>
                        <div class="dropdown-menu dropdown-menu-right"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="adminLogout" data-toggle="modal"
                               data-target="#logoutModal">Logout</a>
                        </div>
                    </li>
                </ul>

            </nav>

            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="sidebar navbar-nav">
                    <li class="nav-item active"><a class="nav-link"
                                                   href="super-admin.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a></li>


                    <%
                        if (subadmin.getItem2().equals("1")) {

                            session.setAttribute("show_student_table", "show_student_table");
                    %>

                    <li class="nav-item"><a class="nav-link"
                                            href="adminShowStudentsController?page=1"> <i
                            class="fas fa-fw fa-table"></i> <span>Students Information</span></a></li>

                    <%
                        } else {
                            ;
                        }
                    %>


                    <%
                        if (subadmin.getItem1().equals("1")) {

                            session.setAttribute("admin_update_fees", "admin_update_fees");
                    %>

                    <li class="nav-item"><a class="nav-link"
                                            href="adminController?target=update_development_fee"> <i
                            class="fas fa-fw fa-chart-area"></i>
                        <span>Update Dev Fee</span></a></li>

                    <%
                        } else {
                            ;
                        }
                    %>


                    <%
                        if (subadmin.getItem3().equals("1")) {

                            session.setAttribute("admin_all_application", "admin_all_application");
                    %>

                    <li class="nav-item"><a class="nav-link"
                                            href="adminController?target=all_application"> <i
                            class="fas fa-fw fa-table"></i>
                        <span>Application Letters</span></a></li>

                    <%
                        } else {
                            ;
                        }
                    %>


                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Update
						Information</span>
                    </a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">

                            <%
                                if (subadmin.getItem4().equals("1")) {

                                    session.setAttribute("adminDevelopmentFeesTableController", "adminDevelopmentFeesTableController");
                            %>

                            <a class="dropdown-item" href="adminFeesManageController?type=developmentfee&&page=1">Development
                                Fees</a>

                            <%
                                } else {
                                    ;
                                }
                            %>

                            <%
                                if (subadmin.getItem5().equals("1")) {

                                    session.setAttribute("adminSemesterFeesTableController", "adminSemesterFeesTableController");
                            %>

                            <a class="dropdown-item" href="adminFeesManageController?type=semesterfee&&page=1">Semester
                                Fees</a>

                            <%
                                } else {
                                    ;
                                }
                            %>


                            <%
                                if (subadmin.getItem6().equals("1")) {

                                    session.setAttribute("adminFormFillUpFeesTableController", "adminFormFillUpFeesTableController");
                            %>

                            <a class="dropdown-item" href="adminFeesManageController?type=formfillupfee&&page=1">Form
                                Fillup Fee</a>

                            <%
                                } else {
                                    ;
                                }
                            %>


                        </div>
                    </li>


                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>All
						Payment</span>
                    </a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">


                            <a class="dropdown-item"
                               href="admin_show_development_fees_table.jsp">Development Fees</a>
                            <a class="dropdown-item" href="admin_show_semester_fees_table.jsp">Semester
                                Fees</a> <a class="dropdown-item"
                                            href="admin_show_formfillup_fees_table.jsp">Form Fillup Fee</a>

                        </div>
                    </li>


                </ul>

                <div id="content-wrapper">

                    <div class="container-fluid">

                            <%
					} else {
				%>

                        <h1>Opps! have a greate problem.</h1>

<%
    }
%>