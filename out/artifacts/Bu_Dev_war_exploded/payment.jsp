<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.Dao.studentsDao"
         import="com.budev.controller.mainController" import="com.budev.model.Department"
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

        String id = currentUser.getId();

        Student stu;

        stu = studentsDao.getStudentProfileById(id);

        String sid = stu.getId();
        String did = stu.getS_department();

        System.out.println(sid + " " + did);


        Department dept;

        dept = mainController.getDepartmentIdByDepartmentName(did);

        String departmentId = dept.getDeptId();

        System.out.println("from payment.jsp page , dept id " + departmentId);


%>

<style>
    .box-check {
        margin: auto;
    }
</style>

<div class="col-md-4 box-check">
    <div class="checkBox m-4 validity">

        <h2 class="h4 text-responsive font-weight-bold text-center ">University
            of Barishal</h2>
        <h6 class="h5 text-responsive font-weight-bold text-center ">Barishal-8200</h6>
        <p class="text-center "></p>


        <form action="checkValidityController" method="get">
            <div class="md-form">
                <div class="md-form mb-0">
                    <select required onchange="selected()"
                            class="browser-default custom-select custom-select-lg mb-3"
                            name="fee_type" id="fee_type">
                        <option value="">Select</option>
                        <option value="devfee">Development Fee</option>
                        <option value="semfee">Semester fee</option>
                        <option value="formfee">FormFill Up fee</option>
                    </select>
                </div>
            </div>

            <div class="md-form">
                <div class="md-form mb-0">
                    <select onchange="selected()" required
                            class="browser-default custom-select custom-select-lg mb-3"
                            name="semester" id="semester">
                        <option value="">Select semester</option>
                        <option value="1st">1 <sup>st</sup>
                        </option>
                        <option value="2nd">2 <sup>nd</sup>
                        </option>
                        <option value="3rd">3 <sup>rd</sup>
                        </option>
                        <option value="4th">4 <sup>th</sup>
                        </option>
                        <option value="5th">5 <sup>th</sup>
                        </option>
                        <option value="6th">6 <sup>th</sup>
                        </option>
                        <option value="7th">7 <sup>th</sup>
                        </option>
                        <option value="8th">8 <sup>th</sup>
                        </option>
                    </select>
                </div>
            </div>

            <input type="hidden" name="departmentId"
                   value="<%out.println(departmentId);%>"> <input type="hidden"
                                                                  name="roll" value="<%=stu.getS_roll()%>">


            <div class="text-center text-md-right">
                <input type="submit" class="btn btn-primary submitBtn" value="Next">
            </div>
        </form>


    </div>
</div>

<br>
<%@include file="footer.jsp" %>

<%
    } else {
        String pagename = "payment.jsp";
        session.setAttribute("current_page", pagename);
        response.sendRedirect("login.jsp");
    }
%>