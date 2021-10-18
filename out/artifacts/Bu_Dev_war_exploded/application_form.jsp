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
    session.getAttribute("currentSessionStudent");
    Student currentUser = (Student) (session.getAttribute("currentSessionStudent"));

    Student stu;
    stu = studentsDao.getStudentProfileById(currentUser.getId());

%>


<body>
<div class="container">
    <div class="row">
        <div class="box" id="application">
            <h2 class="h6-responsive font-weight-bold text-center">Application
                Form</h2>
            <form action="devFeesController?feetype=application_form"
                  method="post" class="form-controll">
                <div class="p-4" style="font-size: 20px">
                    <p>
                        I am <input type="text" name="s_name" class="form-control m-1"
                                    value="<%=stu.getS_name()%>" readonly> bearing
                        roll no: <input type="text" name="s_roll"
                                        class="form-control m-1" value="<%=stu.getS_roll()%>"
                                        readonly> studying in <input type="hidden" name="id"
                                                                     class="form-control m-1" value="<%=stu.getId()%>">
                        <input type="text" name="semester" class="form-control m-1"
                               placeholder="Enter your semester" required> at the
                        department of <input type="text" name="s_dept"
                                             class="form-control m-1"
                                             value="<%=stu.getS_department()%>" readonly>
                        University of Barishal.
                    </p>

                    Application for


                    <div class="custom-control form-control-lg custom-checkbox">
                        <input type="checkbox" name="subject"
                               class="custom-control-input" value="reducing amount"
                               id="customCheck1"> <label class="custom-control-label"
                                                         for="customCheck1">reducing amount / </label>

                    </div>
                    <div class="custom-control form-control-lg custom-checkbox">
                        <input type="checkbox" name="subject2"
                               class="custom-control-input" value="extending time"
                               id="customCheck2"> <label class="custom-control-label"
                                                         for="customCheck2">extending time for the/ </label>
                    </div>


                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-outline-secondary active"> <input
                                type="radio" name="feetype" value="Development fee "
                                id="option1" autocomplete="off" checked> Development fee
                        </label> <label class="btn btn-outline-secondary"> <input type="radio"
                                                                                  name="feetype" value="Semester fee "
                                                                                  id="option2"
                                                                                  autocomplete="off"> Semester fee
                    </label> <label class="btn btn-outline-secondary"> <input type="radio"
                                                                              name="feetype" value="Form Fill up fee "
                                                                              id="option3"
                                                                              autocomplete="off"> Form Fill up fee .
                    </label>
                    </div>


                    <p>My problem is</p>
                    <div class="md-form mb-4 pink-textarea active-pink-textarea">
							<textarea id="reason" name="reason"
                                      class="md-textarea form-control" rows="3"></textarea>
                    </div>

                    <div class="text-center text-md-right">
                        <input type="submit" class="btn btn-primary submitBtn"
                               value="Submit Form">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<br>
<br>
<%@include file="footer.jsp" %>