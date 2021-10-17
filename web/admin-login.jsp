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

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="assets/vendor/fontawesome-free/css/all.min.css"
          rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="assets/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5 ">
        <div class="card-header text-center">Admin Login Panel</div>
        <c:if test="${not empty error}">
            <span class="alert alert-danger"><c:out value="${error}"/></span>
        </c:if>
        <div class="card-body">
            <form action="adminController?action=login" method="post">

                <div class="form-group">
                    <label for="semester">Role</label>
                    <div class="md-form">
                        <div class="md-form mb-0">
                            <select id="role"
                                    class="browser-default custom-select custom-select-lg mb-3"
                                    name="role" required>
                                <option value="null">.....</option>
                                <option value="super_admin">Super Admin</option>
                                <option value="sub_admin">Sub Admin</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" id="admin" name="admin" class="form-control"
                               placeholder="Email address" required="required"
                               autofocus="autofocus"> <label for="admin">admin</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" id="password" name="password"
                               class="form-control" placeholder="password" required="required">
                        <label for="password">Password</label>
                    </div>
                </div>


                <div class="text-center">
                    <input type="submit" class="btn btn-primary" value="Login">
                </div>

            </form>

        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
