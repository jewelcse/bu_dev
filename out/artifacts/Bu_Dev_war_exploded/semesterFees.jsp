<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.Dao.studentsDao"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="header.jsp" %>
<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionStudent") != null) {
        Student currentUser = (Student) (session.getAttribute("currentSessionStudent"));

        Student stu = studentsDao.getStudentProfileById(currentUser.getId());
%>


<div class="container">

    <div class="row">
        <div class="box">
            <h2 class="text-responsive font-weight-bold text-center ">University
                of Barishal</h2>
            <h6 class="text-responsive font-weight-bold text-center ">Barishal-8200</h6>
            <h6 class="text-responsive font-weight-bold text-center">
                Dept. of
                <%=stu.getS_department()%>
            </h6>
            </br>
            <h3 class="text-responsive font-weight-bold text-center ">Semester
                Fees Payment Form</h3>

            <!--Grid column-->
            <div class="col-md-12 mb-md-0 mb-5 ">


                <form action="devFeesController?feetype=semesterfee" method="post">
                    <input type="hidden" id="" name="s_id" class="form-control"
                           value="<%=stu.getId()%>">

                    <!--Grid row-->
                    <div class="row">
                        <!--Grid column-->
                        <div class="col-md-6 mb-1">
                            <div class="md-form mb-0">
                                <label for="classRoll" class="">Class Roll</label> <input
                                    type="text" id="classRoll" name="s_roll" readonly
                                    class="form-control" value="<%=stu.getS_roll()%>">

                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <label for="regNumber" class="">Registration No.</label> <input
                                    type="text" id="regNumber" name="s_reg" readonly
                                    class="form-control" value="<%=stu.getS_reg()%>">

                            </div>
                        </div>
                        <!--Grid column-->

                    </div>
                    <%
                        String semester = request.getParameter("semester");
                    %>


                    <div class="md-form">
                        <label for="regNumber" class="">Semester </label> <input
                            type="text" id="s_semester" name="s_semester" readonly
                            class="form-control" value="<%out.print(semester);%>">

                    </div>

                    <!--Grid row -->

                    <div class="md-form">
                        <label for="orangeForm-name" class="">Student's Name</label> <input
                            type="text" id="sname" name="s_name" readonly
                            class="form-control" value="<%=stu.getS_name()%>">

                    </div>

                    <div class="md-form">
                        <label for="orangeForm-moname" class="">Mother's Name</label> <input
                            type="text" id="moname" name="s_mother_name" readonly
                            value="<%=stu.getS_mother_name()%>" class="form-control">

                    </div>

                    <div class="md-form">
                        <label for="orangeForm-faname" class="">Father's Name</label> <input
                            type="text" id="faname" name="s_father_name" readonly
                            value="<%=stu.getS_father_name()%>" class="form-control">

                    </div>

                    <div class="md-form">
                        <label for="orangeForm-faname" class="">Department Name</label> <input
                            type="text" id="daname" name="s_department" readonly
                            value="<%=stu.getS_department()%>" class="form-control">

                    </div>

                    <div class="md-form">
                        <label for="orangeForm-faname" class="">Faculty Name</label> <input
                            type="text" id="facaname" name="s_faculty" readonly
                            value="<%=stu.getS_faculty()%>" class="form-control">

                    </div>


                    <!-- Amount table for users -->
                    <div class="mt-4">
                        <table class="table table-bordered">
                            <thead>
                            <tr>

                                <th scope="col">Sector</th>
                                <th scope="col">Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Semester Admission Fee</td>
                                <!-- বিভাগ উন্নয়ন ফি ,বিবিধ,মোট-->
                                <td><input type="text" id="fee1"
                                           value="<%out.println(request.getAttribute("fee1"));%>"
                                           readonly></td>
                            </tr>
                            <tr>
                                <td>Tution Fee</td>
                                <td><input type="text" id="fee2"
                                           value="<%out.println(request.getAttribute("fee2"));%>"
                                           readonly></td>
                            </tr>
                            <tr>
                                <td>Lab/Seminar Fee</td>
                                <td><input type="text" id="fee3"
                                           value="<%out.println(request.getAttribute("fee3"));%>"
                                           readonly></td>
                            </tr>
                            <tr>
                                <td>Transport Fee</td>
                                <td><input type="text" id="fee4"
                                           value="<%out.println(request.getAttribute("fee4"));%>"
                                           readonly></td>
                            </tr>
                            <tr>
                                <td>Miscellaneous</td>
                                <td><input type="text" id="fee5"
                                           value="<%out.println(request.getAttribute("fee5"));%>"
                                           readonly></td>
                            </tr>

                            <tr>
                                <td>Total</td>
                                <td><input type="text" id="total" name="total_amount"
                                           readonly></td>
                            </tr>

                            </tbody>
                        </table>


                    </div>
                    <!-- Amount table for users -->
                    <div class="text-center text-md-right">
                        <input type="submit" class="btn btn-primary submitBtn"
                               value="pay now">
                    </div>

                </form>

                <div class="status"></div>
            </div>
            <!--Grid column-->


        </div>
    </div>
</div>

<script>
    $(document).ready(
        function () {
            var a1 = $("#fee1").val();
            var a2 = $("#fee2").val();
            var a3 = $("#fee3").val();
            var a4 = $("#fee4").val();
            var a5 = $("#fee5").val();

            function total(a1, a2, a3, a4, a5) {
                var sum = parseInt(a1) + parseInt(a2) + parseInt(a3)
                    + parseInt(a4) + parseInt(a5);
                return sum;
            }


            var sum = total(a1, a2, a3, a4, a5);
            $("#total").val(sum);
            console.log(sum);

        });
</script>
</body>
</html>

<br>
<br>
<%@include file="footer.jsp" %>
<%
    } else
        response.sendRedirect("login.jsp");
%>
