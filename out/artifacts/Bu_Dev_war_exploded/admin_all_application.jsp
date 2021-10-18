<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionForSuperAdmin") != null
            || session.getAttribute("admin_all_application") != null) {
%>

<%@include file="admin-header.jsp" %>

<style>
    h3.inline {
        margin-left: 40%;
        margin-right: 50%;
        width: 100%;
    }
</style>


<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="super-admin.jsp">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Applications</li>
</ol>
<section class="p-1">

    <h3 class="inline">
        <u>List of All Application</u>
    </h3>
    <table class="table table-hover" id="myTable" border="2px solid black">
        <tr>
            <th>Semester</th>
            <th>Subject</th>
            <th>Fee Type</th>
            <th>Reason</th>
            <th>Preview</th>
        </tr>

        <c:forEach items="${applicationList}" var="list">
            <tr>
                <td><c:out value=" ${list.getSemester()}"/></td>
                <td><c:out value=" ${list.getSubject()}"/></td>
                <td><c:out value=" ${list.getFeeType()}"/></td>
                <td><c:out value=" ${list.getReason()}"/></td>
                <td><a class="btn btn-primary"
                       href="admin_all_application_controller?application_id=<c:out value=" ${list.getId()}" />&&stu_id=<c:out value=" ${list.getStudent_id()}"/>">Preview</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</section>


<%@include file="admin-footer.jsp" %>

<%
} else {
%>

<%@include file="admin-login.jsp" %>
<%
    }
%>