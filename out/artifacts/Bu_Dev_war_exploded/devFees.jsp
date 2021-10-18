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

        System.out.println(stu.getId());
%>

<body>
<div class="container">

    <div class="row">
        <div class="box">
            <h2 class="text-responsive font-weight-bold text-center ">University
                of Barishal</h2>
            <h6 class="text-responsive font-weight-bold text-center ">Barishal-8200</h6>
            <h6 class="text-responsive font-weight-bold text-center">Dept. of <%=stu.getS_department()%>
            </h6>
            </br> <h3 class="text-responsive font-weight-bold text-center ">Development
            Fees Payment Form</h3>


            <div class="col-md-12 mb-md-0 mb-5  ">
                <form action="devFeesController?feetype=devfees" method="post">
                    <div class="row">
                        <input type="hidden" name="s_id" class="form-control"
                               value="<%=stu.getId()%>">
                        <div class="col-md-6 mb-1">
                            <div class="md-form mb-0">
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
                        <label for="orangeForm-name" class="">Semester</label> <input
                            type="text" id="SSemester" name="s_semester" readonly
                            class="form-control" value="<%out.print(semester);%>">

                    </div>


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
                                <td>Development Fees</td>
                                <!-- বিভাগ উন্নয়ন ফি ,বিবিধ,মোট-->
                                <td><input type="text" id="id1"
                                           value="<%out.println(request.getAttribute("mainfee"));%>"
                                           readonly></td>
                            </tr>
                            <tr>
                                <td>Miscellaneous</td>
                                <td><input type="text" id="id2"
                                           value="<%out.println(request.getAttribute("miscefee"));%>"
                                           readonly></td>
                            </tr>

                            <%
                                if (request.getAttribute("changedfee") != null) {
                            %>
                            <tr>
                                <td>Reduced Amount (-)</td>
                                <td><input type="text" id="id3"
                                           value="<%out.println(request.getAttribute("changedfee"));%>"
                                           readonly></td>
                            </tr>

                            <%
                                }
                            %>
                            <tr>
                                <td>Total</td>
                                <td><input type="text" id="total" name="total_amount"
                                           readonly></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center text-md-right">
                        <input type="submit" class="btn btn-primary submitBtn"
                               onclick="check_semester()" value="pay now">
                    </div>
                </form>
                <div class="status"></div>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    $(document).ready(function () {
        var mainAmount = $("#id1").val();
        var misceAmount = $("#id2").val();
        var reducedAmount = $("#id3").val();

        function total1(a1, a2) {
            var sum = parseInt(a1) + parseInt(a2);
            return sum;
        }


        function total2(a1, a2, a3) {
            var sum = parseInt(a1) + parseInt(a2) - parseInt(a3);
            return sum;
        }


        if (reducedAmount != null) {
            console.log(mainAmount + " " + misceAmount + " " + reducedAmount);
            var sum = total2(mainAmount, misceAmount, reducedAmount);
            $("#total").val(sum);
            console.log(sum);
        } else {
            console.log(mainAmount + " " + misceAmount);
            var sum = total1(mainAmount, misceAmount);
            $("#total").val(sum);
            console.log(sum);
        }

        //$("#total").append(sum);// for showing in the div element

    });

    function clearForms() {
        var i;
        for (i = 0; (i < document.forms.length); i++) {
            document.forms[i].reset();
        }
    }
</script>


</html>
<br>
<br>
<%@include file="footer.jsp" %>
<%
    } else {
        response.sendRedirect("login.jsp");

    }
%>