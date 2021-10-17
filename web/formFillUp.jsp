<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.Dao.studentsDao"
%>
<%@ page import="com.budev.model.Student" %>

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
            <h6 class="text-responsive font-weight-bold text-center"><%=stu.getS_department()%>
            </h6>
            </br>
            <h3 class="text-responsive font-weight-bold text-center ">Form
                Fill up Fees Payment Form</h3>


            <div class="col-md-12 mb-md-0 mb-5 ">


                <form action="devFeesController?feetype=formfillupfee" method="post">
                    <input type="hidden" id="" name="s_id" class="form-control"
                           value="<%=stu.getId()%>">

                    <div class="row">

                        <div class="col-md-6">
                            <div class="md-form mb-1">
                                <label for="classRoll" class="">Class Roll</label> <input
                                    type="text" id="classRoll" name="s_roll" readonly
                                    class="form-control" value="<%=stu.getS_roll()%>">

                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <label for="regNumber" class="">Registration No.</label> <input
                                    type="text" id="regNumber" name="s_reg" readonly
                                    class="form-control" value="<%=stu.getS_reg()%>">

                            </div>
                        </div>


                    </div>
                    <%
                        String semester = request.getParameter("semester");
                    %>


                    <div class="md-form">
                        <label for="regNumber" class="">Semester </label> <input
                            type="text" id="s_semester" name="s_semester" readonly
                            class="form-control" value="<%out.print(semester);%>">

                    </div>


                    <div class="md-form">
                        <label for="orangeForm-name" class="">Student's Name</label> <input
                            type="text" id="sname" name="s_name" class="form-control"
                            readonly value="<%=stu.getS_name()%>">

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
                                <td>Main Fee</td>
                                <td><input id="mainfee" type="text"
                                           value="<%out.println(request.getAttribute("mainfee"));%>"
                                           readonly></td>
                            </tr>
                            <tr>
                                <td>Miscellaneous Fee</td>
                                <td><input id="miscefee" type="text"
                                           value="<%out.println(request.getAttribute("miscefee"));%>"
                                           readonly></td>
                            </tr>

                            <tr>
                                <td>Total</td>
                                <td><input type="text" name="total_amount" id="total" readonly></td>
                            </tr>

                            </tbody>
                        </table>


                    </div>

                    <div class="text-center text-md-right">
                        <input type="submit" class="btn btn-primary submitBtn"
                               value="pay now">
                    </div>

                </form>

                <div class="status"></div>
            </div>


        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var mainAmount = $("#mainfee").val();
        var misceAmount = $("#miscefee").val();

        function total(a1, a2) {
            var sum = parseInt(a1) + parseInt(a2);
            return sum;
        }


        var sum = total(mainAmount, misceAmount);
        $("#total").val(sum);
        console.log(sum);

        //$("#total").append(sum);// for showing in the div element

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
