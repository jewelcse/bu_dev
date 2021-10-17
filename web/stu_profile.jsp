<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.Dao.studentsDao"
         import="com.budev.controller.mainController" import="com.budev.model.Department"
         import="com.budev.model.PaymentHistory" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

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

        Department dept;

        dept = mainController.getDepartmentIdByDepartmentName(did);

        String departmentId = dept.getDeptId();

        System.out.println(sid + " deptid-> " + departmentId);

        //System.out.println("id "+currentUser.getId());

		/*ArrayList<Devfees> devfee = new ArrayList<Devfees>();
		ArrayList<FormfillupFees> formfillupfee = new ArrayList<FormfillupFees>();
		ArrayList<SemesterFees> semfee = new ArrayList<SemesterFees>();
		
		devfee = studentsDao.getPaidDevelopmentFeeByUserId(id);
		formfillupfee = studentsDao.getPaidFormfillupFeeByUserId(id);
		semfee = studentsDao.getPaidSemesterpFeeByUserId(id);*/

        ArrayList<PaymentHistory> history = new ArrayList<PaymentHistory>();

        history = studentsDao.getAllPaidFeesByUserId(sid, departmentId);

		/*for (int i = 0; i < history.size(); i++) {

			System.out.println(history.get(i).getFeeType() + " " + history.get(i).getAmount());
		}*/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><%=stu.getS_name()%>
    </title>
    <style>
        .pcolor {
            color: black
        }
    </style>
</head>
<body>


<div class="container emp-profile pt-4">
    <form method="post">
        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">
                    <img src="../images/default-profile-picture-gmail-2.png"
                         style="width: 250px" alt="default image"/>

                </div>
            </div>
            <div class="col-md-8">
                <div class="profile-head">
                    <h5>
                        <%=stu.getS_name()%>
                    </h5>
                    <h6>
                        <%=stu.getS_department()%>
                    </h6>
                    <p class="proile-rating">University of Barishal</p>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link active"
                                                id="home-tab" data-toggle="tab" href="#home" role="tab"
                                                aria-controls="home" aria-selected="true"><span
                                class="pcolor">About</span></a></li>
                        <li class="nav-item"><a class="nav-link" id="profile-tab"
                                                data-toggle="tab" href="#profile" role="tab"
                                                aria-controls="profile" aria-selected="false"><span
                                class="pcolor">Payments History</span></a></li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-work">
                    <p>
                        <u>Contact Info:</u>
                    </p>
                    <p><%=stu.getS_email()%>
                    </p>
                    <p><%=stu.getS_phone()%>
                    </p>
                    <br/>

                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel"
                         aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mother's Name:</label>
                            </div>
                            <div class="col-md-6">
                                <p><%=stu.getS_mother_name()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Father's Name:</label>
                            </div>
                            <div class="col-md-6">
                                <p><%=stu.getS_father_name()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Roll No:</label>
                            </div>
                            <div class="col-md-6">
                                <p><%=stu.getS_roll()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Registration No:</label>
                            </div>
                            <div class="col-md-6">
                                <p><%=stu.getS_reg()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Semester:</label>
                            </div>
                            <div class="col-md-6">
                                <p><%=stu.getS_semester()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Faculty</label>
                            </div>
                            <div class="col-md-6">
                                <p><%=stu.getS_faculty()%>
                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel"
                         aria-labelledby="profile-tab" style="max-height: 400px;overflow-y: auto;">
                        <table border=1px style="padding: 2px">


                            <thead>
                            <tr>
                                <th>Sector</th>
                                <th>Semester</th>
                                <th>Amount</th>
                                <th>Time</th>
                                <th>Payment-Satus</th>

                            </tr>


                            </thead>
                            <tbody>

                            <%
                                for (int i = 0; i < history.size(); i++) {
                            %>

                            <tr>

                                <td>
                                    <%
                                        out.print(history.get(i).getFeeType());
                                    %>
                                </td>

                                <td>
                                    <%
                                        out.print(history.get(i).getSemester());
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.print(history.get(i).getAmount());
                                    %><span> Tk</span>
                                </td>
                                <td>
                                    <%

                                        //DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                                        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd, MMMM uuuu HH:mm");

                                        //String formattedDate = history.get(i).getcDate().format(String.valueOf(myFormatObj));
                                        String formattedDate = history.get(i).getcDate().format((myFormatObj));
                                        out.print(formattedDate);
                                    %>
                                </td>

                                <%
                                    if (history.get(i).isPaymentStatus()) {
                                %>
                                <td style="color:green"><span
                                        class="badge badge-success">Payment success and Verified  </span></td>

                                <%
                                } else {
                                %>
                                <td style="color:red"><span
                                        class="badge badge-danger">Payment success but Not-Verified  </span></td>
                                <%
                                    }
                                %>
                            </tr>
                            <%
                                }
                            %>

                            </tbody>


                        </table>

                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>

<br>
<br>
<%@include file="footer.jsp" %>

<%
    } else
        response.sendRedirect("login.jsp");
%>
