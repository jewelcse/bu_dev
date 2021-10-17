<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.budev.model.Department"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionForSuperAdmin") != null
            || session.getAttribute("admin_update_fees") != null) {
%>

<%@include file="admin-header.jsp" %>

<!-- onlu=y work for bootstrtap 3.0 -->
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="super-admin.jsp">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Update Dev Fee</li>
</ol>


<div class="container">


    <div class="row mb-2">
        <!-- Button to trigger modal -->
        <button class="btn btn-primary btn-lg" data-toggle="modal"
                data-target="#modalForm">Reduce TK
        </button>

        <!-- Modal -->
        <div class="modal fade" id="modalForm" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">

                        <h4 class="modal-title" id="myModalLabel">Reduced Development
                            Fee</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
                        </button>
                    </div>

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <p class="statusMsg"></p>
                        <form role="form" id="reducedForm">
                            <div class="form-group">
                                <label for="roll">Roll</label> <input type="text" id="roll"
                                                                      name="roll" class="form-control"
                                                                      placeholder="Roll No."
                                                                      required>
                            </div>
                            <div class="form-group">
                                <label for="department">Department</label>
                                <div class="md-form">
                                    <div class="md-form mb-0">
                                        <select id="department"
                                                class="browser-default custom-select custom-select-lg mb-3"
                                                name="department" required>
                                            <option value="null">.....</option>
                                            <%
                                                ArrayList<Department> item = new ArrayList<Department>();

                                                item = adminDao.getAllDepartment();

                                                for (int i = 0; i < item.size(); i++) {
                                            %>
                                            <option value="<%out.println(item.get(i).getDeptId());%>">
                                                <%
                                                    out.println(item.get(i).getDeptName());
                                                %>
                                            </option>

                                            <%
                                                }
                                            %>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="semester">Semester</label>
                                <div class="md-form">
                                    <div class="md-form mb-0">
                                        <select id="semester"
                                                class="browser-default custom-select custom-select-lg mb-3"
                                                name="semester" required>
                                            <option value="null">.....</option>
                                            <option value="1st">1<sup>st</sup></option>
                                            <option value="2nd">2<sup>nd</sup></option>
                                            <option value="3rd">3<sup>rd</sup></option>
                                            <option value="4th">4<sup>th</sup></option>
                                            <option value="5th">5<sup>th</sup></option>
                                            <option value="6th">6<sup>th</sup></option>
                                            <option value="7th">7<sup>th</sup></option>
                                            <option value="8th">8<sup>th</sup></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="changed_amount">Reduced Amount</label> <input
                                    type="number" id="changed_amount" name="changed_amount"
                                    class="form-control" placeholder="Amount..." required>
                            </div>
                        </form>
                    </div>

                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary submitBtn"
                                onclick="submitDevFeeChangedForm()">Update
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <table class="table table-bordered table-hover  " id="myTable"
                   border="2px solid black">
                <tr>
                    <th>Roll No</th>
                    <th>Department</th>
                    <th>Semester</th>
                    <th>Changed Amount</th>
                </tr>


                <c:forEach items="${changed_fees_list}" var="list">
                    <tr>
                        <td><c:out value=" ${list.getRoll()}"/></td>
                        <td><c:out value=" ${list.getDepartment()}"/></td>
                        <td><c:out value=" ${list.getSemester()}"/></td>
                        <td><c:out value=" ${list.getChanged_amount()}"/></td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>
</div>


<script>


    $('#modalForm').on('hidden.bs.modal', function (e) {
        $(this).find('#reducedForm')[0].reset();
        $('.statusMsg').html('');

    });

    //$(window).on('load', function() { ... });

    function submitDevFeeChangedForm() {
        var roll = $('#roll').val();
        var semester = $('#semester').val();
        var amount = $('#changed_amount').val();
        var department = $('#department').val();

        if (roll.trim() == '') {
            alert('Please enter Roll.');
            $('#roll').focus();
            return false;
        } else if (semester.trim() == '') {
            alert('Please enter Semester.');
            $('#semester').focus();
            return false;
        } else if (amount.trim() == '') {
            alert('Please enter Reduced Amount.');
            $('#changed_amount').focus();
            return false;
        } else {
            $.ajax({
                type: 'POST',
                url: 'adminFeesManageController?type=update_development_fee',
                data: {
                    roll: roll,
                    semester: semester,
                    department: department,
                    changed_amount: amount
                },
                beforeSend: function () {
                    $('.submitBtn').attr("disabled", "disabled");
                    $('.modal-body').css('opacity', '.5');
                },
                success: function (msg) {
                    console.log(msg);
                    if (msg == 'ok') {
                        document.getElementById("reducedForm").reset();
                        $('.statusMsg').html('<span style="color:green;">Successfuly Reduced!.</span>');
                        $('#modalForm').modal('hide');

                    } else {
                        $('.statusMsg').html('<span style="color:red;">Duplicate Entity found OR maybe Changed amount is more Than Total Fee!.</span>');
                    }
                    $('.submitBtn').removeAttr("disabled");
                    $('.modal-body').css('opacity', '');

                }
            });
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