<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if ((session.getAttribute("currentSessionForSuperAdmin") != null)
            || (session.getAttribute("currentSessionForSubAdmin") != null)) {
%>


<%@include file="admin-header.jsp" %>


<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="super-admin.jsp">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Add Record</li>
</ol>


<!--Grid column-->
<div class="col-md-10  m-auto pt-3  ">

    <div class="d-inline-block">
        <a class="nav-link inline" href="adminShowStudentsController?page=1"><span>Back</span></a>
    </div>
    <div class="d-inline-block">
        <div class="mb-4">

            <form enctype="multipart/form-data" action="TestCSVServlet"
                  method="post">
                <table align="center" border="1px solid black">
                    <tr>
                        <td><input type="file" name="chooser"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>


    <form method="post" action="addStudentController">

        <div class="card mb-5">

            <div class="card-body m-4">

                <div class="form-header text-center" style="border-radius: 25px;">
                    <h3>Add New Student</h3>
                </div>

                <div class="md-form mb-1">

                    <input type="text" id="sroll" name="s_roll" class="form-control"
                           placeholder="Roll No." required>
                </div>

                <div class="md-form mb-1">
                    <input type="text" id="sreg" name="s_reg" class="form-control"
                           placeholder="Reg. No." required>
                </div>

                <div class="md-form mb-1">
                    <input type="text" id="sname" name="s_name" class="form-control"
                           placeholder="Name..." required>
                </div>

                <div class="md-form mb-1">
                    <input type="text" id="moname" name="s_mother_name"
                           class="form-control" placeholder="Mother Name..." required>
                </div>

                <div class="md-form mb-1">
                    <input type="text" id="faname" name="s_father_name"
                           class="form-control" placeholder="Father Name..." required>
                </div>


                <div class="md-form mb-1">
                    <input type="email" id="semail" name="s_email" class="form-control"
                           placeholder="Gmail..." required>
                </div>

                <div class="md-form">
                    <div class="md-form mb-0">
                        <select id="sfaculty"
                                class="browser-default custom-select custom-select-lg mb-3"
                                name="s_faculty" required>
                            <option selected>Faculty Name</option>
                            <option value="Science & Engineering">Science &
                                Engineering
                            </option>
                            <option value="Bio-Sciences">Bio-Sciences</option>
                            <option value="Business Studies">Business Studies</option>
                            <option value="Arts and Humanities">Arts and Humanities</option>
                            <option value="Social Sciences">Social Sciences</option>
                            <option value="Law">Law</option>
                        </select>
                    </div>
                </div>

                <div class="md-form">
                    <div class="md-form mb-0">
                        <select id="sdepartment"
                                class="browser-default custom-select custom-select-lg mb-3"
                                name="s_department" required>
                            <option selected>Department Name</option>
                            <option value="Computer Science & Engineering">Computer
                                Science & Engineering
                            </option>
                            <option value="Mathematics">Mathematics</option>
                            <option value="Chemistry">Chemistry</option>
                            <option value="Physics">Physics</option>
                            <option value="Geology and Mining">Geology and Mining</option>
                            <option value="Soil & Environmental Science">Soil &
                                Environmental Science
                            </option>
                            <option value="Botany">Botany</option>
                            <option value="Coastal Studies & Disaster Management">Coastal
                                Studies & Disaster Management
                            </option>
                            <option value="Biochemistry & Biotechnology">Biochemistry
                                & Biotechnology
                            </option>
                            <option value="Management Studies">Management Studies</option>
                            <option value="Accounting & Information System">Accounting
                                & Information System
                            </option>
                            <option value="Marketing">Marketing</option>
                            <option value="Finance & Banking">Finance & Banking</option>
                            <option value="Economics">Economics</option>
                            <option value="Political Science">Political Science</option>
                            <option value="Sociology">Sociology</option>
                            <option value="Public Administration">Public
                                Administration
                            </option>
                            <option value="Bangla">Bangla</option>
                            <option value="English">English</option>
                            <option value="Philosophy">Philosophy</option>
                            <option value="Mass Communication & Journalism">Mass
                                Communication & Journalism
                            </option>
                            <option value="History & Civilization">History &
                                Civilization
                            </option>
                            <option value="Law">Law</option>

                        </select>
                    </div>
                </div>

                <div class="md-form">
                    <div class="md-form mb-0">
                        <select id="ssemester"
                                class="browser-default custom-select custom-select-lg mb-3"
                                name="s_semester" required>
                            <option selected>Semester</option>
                            <option value="1st">1<sup>st</sup></option>
                            <option value="2nd">2<sup>nd</sup></option>
                            <option value="3th">3<sup>rd</sup></option>
                            <option value="4th">4<sup>th</sup></option>
                            <option value="5th">5<sup>th</sup></option>
                            <option value="6th">6<sup>th</sup></option>
                            <option value="7th">7<sup>th</sup></option>
                            <option value="8th">8<sup>th</sup></option>
                        </select>

                        <div class="md-form mb-2">

                            <input type="number" id="sphone" name="s_phone"
                                   class="form-control" placeholder="Phone No..." required>
                        </div>


                        <div class="text-center">
                            <input type="submit" value="Add record" class="btn btn-primary">
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<%@include file="admin-footer.jsp" %>

<%
} else {
%>

<%@include file="admin-login.jsp" %>
<%
    }
%>
