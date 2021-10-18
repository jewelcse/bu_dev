<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.Dao.studentsDao"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

<%@include file="header.jsp" %>
<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionStudent") != null) {

        Student currentUser = (Student) (session.getAttribute("currentSessionStudent"));

        String id = currentUser.getId();

        Student stu;
        stu = studentsDao.getStudentProfileById(id);
%>

<c:out value="${receipt.getStudentId()}"/>

<div class="container">
    <div id="editor"></div>
    <button id="cmd">Download receipt</button>

    <div class="row" id="htmltopdf">
        <div class="box">
            <h1>University of Barishal</h1>
            <h2>Barishal-8200</h2>
            <h3>Dept. of <%=stu.getS_department()%>
            </h3>
            <h3>Receipt</h3>
            <p> Date : <c:out value="${receipt.getPaymentTime()}"/></p>
            <p>
                Transaction Id: <span><c:out value="${receipt.getTransId()}"/></span>
            </p>

            <p id="classRoll">
                Class Roll:
                <%=stu.getS_roll()%>
            </p>
            <p>
                Registration No. :
                <%=stu.getS_reg()%>
            </p>
            <p>
                Semester :
                <c:out value="${receipt.getSemester()}"/>
            </p>
            <p>
                Student's Name :<%=stu.getS_name()%>
            </p>
            <p>
                Mother's Name :<%=stu.getS_mother_name()%>
            </p>
            <p>
                Father's Name :<%=stu.getS_father_name()%>
            </p>
            <p>
                Department Name :<%=stu.getS_department()%>
            </p>
            <p>
                Faculty Name :<%=stu.getS_faculty()%>
            </p>

            <p>
                Amount :
                <c:out value="${receipt.getAmount()}"/>
                tk
            </p>

        </div>
    </div>
</div>

<br>
<br>

<script>

    var roll = $('#classRoll').html();
    var doc = new jsPDF();
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#cmd').click(function () {
        doc.fromHTML($('#htmltopdf').html(), 15, 15, {
            'width': 170,
            'elementHandlers': specialElementHandlers
        });
        doc.save(roll + '.pdf');
    });


</script>
<%@include file="footer.jsp" %>

<%
    } else
        response.sendRedirect("login.jsp");
%>
