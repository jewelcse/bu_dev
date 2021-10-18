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
    if (session.getAttribute("currentSessionForSuperAdmin") != null
            || session.getAttribute("adminSemesterFeesTableController") != null) {
%>
<%@include file="admin-header.jsp" %>


<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
    <li class="breadcrumb-item active">Update Semester Fee</li>
</ol>

<%
    //int pageNo = 10 ;

    String url = request.getHeader("referer"); /// get the full url

    String pageNo = (String) session.getAttribute("currentPage");

%>

<button onclick="goBack()" class="btn btn-primary">Go Back</button>

<div class="col-md-5 pt-1 pb-2 m-auto">


    <form method="post"
          action="adminFeesTableController?edit_fee_type=semesterfee&&page=<%out.println(pageNo);%>">

        <input type="hidden" name="page" value=<%//out.println(pageNo);%>>

        <div class="card">
            <div class="card-body mb-5">
                <div class="form-header  text-center " style="border-radius: 25px;">
                    <h3><c:out value="${semester_fee.getDepartment()}"/> Department :</h3>
                </div>
                <div class="md-form">
                    <input type="hidden" id="semester" name="id" class="form-control"
                           value="<c:out value="${semester_fee.getId()}" />" required>
                </div>
                <div class="md-form">
                    <label for="semester" class="">Semester</label> <input type="text"
                                                                           id="semester" name="semester"
                                                                           class="form-control"
                                                                           value="<c:out value="${semester_fee.getSemester()}" />"
                                                                           readonly>
                </div>
                <div class="md-form">
                    <label for="main_fee" class="">Admission Fee</label> <input type="text"
                                                                                id="semester_admission_fee"
                                                                                name="semester_admission_fee"
                                                                                class="form-control"
                                                                                value="<c:out value="${semester_fee.getSemester_admission_fee()}" />"
                                                                                required>
                </div>
                <div class="md-form">
                    <label for="main_fee" class="">Tution Fee</label> <input type="text"
                                                                             id="tution_fee" name="tution_fee"
                                                                             class="form-control"
                                                                             value="<c:out value="${semester_fee.getTution_fee()}" />"
                                                                             required>
                </div>
                <div class="md-form">
                    <label for="main_fee" class="">Lab/Seminar Fee</label> <input type="text"
                                                                                  id="lab_or_seminar_fee"
                                                                                  name="lab_or_seminar_fee"
                                                                                  class="form-control"
                                                                                  value="<c:out value="${semester_fee.getLab_or_seminar_fee()}" />"
                                                                                  required>
                </div>
                <div class="md-form">
                    <label for="main_fee" class="">Transport Fee</label> <input type="text"
                                                                                id="transport_fee" name="transport_fee"
                                                                                class="form-control"
                                                                                value="<c:out value="${semester_fee.getTransport_fee()}" />"
                                                                                required>
                </div>
                <div class="md-form">
                    <label for="main_fee" class="">Miscellaneous Fee</label> <input type="text"
                                                                                    id="misce_fee" name="misce_fee"
                                                                                    class="form-control"
                                                                                    value="<c:out value="${semester_fee.getMisce_fee()}" />"
                                                                                    required>
                </div>

                <div class="md-form mb-2">
                    <label for="date" class="">Start date</label> <input type="date"
                                                                         name="start_date"
                                                                         value="<c:out value="${semester_fee.getStart_date()}" />"
                                                                         required>
                </div>
                <div class="md-form mb-2">
                    <label for="date" class="">End date</label> <input type="date"
                                                                       name="end_date"
                                                                       value="<c:out value="${semester_fee.getEnd_date()}" />"
                                                                       required>
                </div>
                <input type="submit" class="btn btn-primary" value="Update">
            </div>
        </div>
    </form>
</div>

<script>
    function goBack() {
        window.history.back();
    }
</script>


<%@include file="admin-footer.jsp" %>


<%
} else {
%>


<%@include file="admin-login.jsp" %>

<%
    }
%>
