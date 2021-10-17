<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="java.sql.Connection"
         import="java.sql.PreparedStatement"
         import="java.sql.ResultSet"
%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if ((session.getAttribute("currentSessionForSuperAdmin") != null)
            || (session.getAttribute("show_student_table") != null)) {
%>


<%@include file="admin-header.jsp" %>

<style>
    h3.inline {
        margin-left: 40%;
        margin-right: 50%;
        width: 100%;
    }

    .thorizental { /* this is for horizontal scroll bar class */

        width: 100%;
        overflow-x: auto;
        white-space: nowrap;
    }
</style>

<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="super-admin.jsp">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Students Table</li>
</ol>

<div class="">
    <div class="">
        <input type="text" id="myInput1" class=" form-control mb-4"
               onkeyup="searchByFunction()" placeholder="Search by Semester">
    </div>

    <div class="col-md-3 border p-2">
        <a href="#" class="btn btn-primary" id="test"
           onClick="fnExcelReport();">Export Data</a> <a href="#"
                                                                    class="btn btn-primary" id="test"
                                                                    onclick="printData()">Print
        Data</a> <a href="admin_add_student.jsp"><img src="../WebContent/images/plus.png"
                                                      style="width: 35px"> Add new Record</a>
    </div>
    <div class="">
        <div id="printData" class="">
            <h3 class="inline">
                <u>Students Table</u>
            </h3>
            <table class="table table-bordered table-hover  "
                   id="myTable" border="2px solid black">
                <tr>
                    <th>Roll No</th>
                    <th>Password</th>
                    <th>Registration</th>
                    <th>Name</th>
                    <th>Father Name</th>
                    <th>Mother Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Semester</th>
                    <th>Department</th>
                    <th>Faculty</th>
                </tr>


                <c:forEach items="${list_student}" var="list">
                    <tr>
                        <td><c:out value=" ${list.getS_roll()}"/></td>
                        <td><c:out value=" ${list.getS_password()}"/></td>
                        <td><c:out value=" ${list.getS_reg()}"/></td>
                        <td><c:out value=" ${list.getS_name()}"/></td>
                        <td><c:out value=" ${list.getS_father_name()}"/></td>
                        <td><c:out value=" ${list.getS_mother_name()}"/></td>
                        <td><c:out value=" ${list.getS_email()}"/></td>
                        <td><c:out value=" ${list.getS_phone()}"/></td>
                        <td><c:out value=" ${list.getS_semester()}"/></td>
                        <td><c:out value=" ${list.getS_department()}"/></td>
                        <td><c:out value=" ${list.getS_faculty()}"/></td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination">


            <!-- -//${fn:length(list)}//////////// important -->

            <%

                dbConnection db = new dbConnection();

                Connection myConn = db.getCon();
                PreparedStatement pstmt = myConn.prepareStatement("SELECT * FROM student");
                ResultSet myRs = pstmt.executeQuery();

                int studentCount = 0;
                while (myRs.next()) {
                    studentCount++;
                    //System.out.println("from while loop "+ studentCount);
                }
                double num = (double) studentCount / 6;
                System.out.println(num);

                double num1 = Math.ceil(num);
                System.out.println(num1);
                int i;

            %>


            <!--  <li class="page-item"><a class="page-link" href="#">Previous</a></li>-->
            <% for (i = 1; i <= num1; i++) {%>

            <li class="page-item"><a class="page-link" id="prev"
                                     href="adminShowStudentsController?page=<% out.println(i); %>"><%
                out.println(i); %></a></li>

            <%} %>


            <!-- <li class="page-item"><a class="page-link" href="adminShowStudentsController?page=<% //out.println(i); %>">Next</a></li> -->

        </ul>
    </nav>
</div>


<script>


    function fnExcelReport() {
        var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
        tab_text = tab_text
            + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';

        tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';

        tab_text = tab_text
            + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
        tab_text = tab_text
            + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';

        tab_text = tab_text + "<table border='1px'>";
        tab_text = tab_text + $('#myTable').html();
        tab_text = tab_text + '</table></body></html>';

        var data_type = 'data:application/vnd.ms-excel';

        var ua = window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");

        if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
            if (window.navigator.msSaveBlob) {
                var blob = new Blob([tab_text], {
                    type: "application/csv;charset=utf-8;"
                });
                navigator.msSaveBlob(blob, 'Test file.xls');
            }
        } else {
            $('#test').attr('href',
                data_type + ', ' + encodeURIComponent(tab_text));
            $('#test').attr('download', 'Student-table.xls');
        }

    }

    function printData() {
        var print_div = document.getElementById("printData");
        var print_area = window.open();
        print_area.document.write(print_div.innerHTML);
        print_area.document.close();
        print_area.focus();
        print_area.print();
        print_area.close();

    }

    function searchByFunction() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput1");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[8];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if ((txtValue.toUpperCase().indexOf(filter) > -1)) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
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