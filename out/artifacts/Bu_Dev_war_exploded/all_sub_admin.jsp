<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionForSuperAdmin") != null) {

        ArrayList<Admin> admin_list = new ArrayList<Admin>();

        admin_list = adminDao.showAllSubAdmin();
%>

<%@include file="admin-header.jsp" %>


<style>
    * {
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
    }

    a {
        text-decoration: none !important;
    }

    .adbtnBox {
        border: 2px solid black;
        width: 210px;
        margin-bottom: 3px;
    }

    .adbtn {
        padding: 5px;
    }


    /** switch desing **/


    .switch{
        opacity: 0;
        position: absolute;
        z-index: 1;
        width: 18px;
        height: 18px;
        cursor: pointer;
    }
    .switch + .lable{
        position: relative;
        display: inline-block;
        margin: 0;
        line-height: 20px;
        min-height: 18px;
        min-width: 18px;
        font-weight: normal;
        cursor: pointer;
    }
    .switch + .lable::before{
        cursor: pointer;
        font-family: fontAwesome;
        font-weight: normal;
        font-size: 12px;
        color: #32a3ce;
        content: "\a0";
        background-color: #FAFAFA;
        border: 1px solid #c8c8c8;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        border-radius: 0;
        display: inline-block;
        text-align: center;
        height: 16px;
        line-height: 14px;
        min-width: 16px;
        margin-right: 1px;
        position: relative;
        top: -1px;
    }
    .switch:checked + .lable::before {
        display: inline-block;
        content: '\f00c';
        background-color: #F5F8FC;
        border-color: #adb8c0;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1);
    }
    /* CSS3 on/off switches */
    .switch + .lable {
        margin: 0 4px;
        min-height: 24px;
    }
    .switch + .lable::before {
        font-weight: normal;
        font-size: 11px;
        line-height: 17px;
        height: 20px;
        overflow: hidden;
        border-radius: 12px;
        background-color: #F5F5F5;
        -webkit-box-shadow: inset 0 1px 1px 0 rgba(0, 0, 0, 0.15);
        box-shadow: inset 0 1px 1px 0 rgba(0, 0, 0, 0.15);
        border: 1px solid #CCC;
        text-align: left;
        float: left;
        padding: 0;
        width: 52px;
        text-indent: -21px;
        margin-right: 0;
        -webkit-transition: text-indent .3s ease;
        -o-transition: text-indent .3s ease;
        transition: text-indent .3s ease;
        top: auto;
    }
    .switch.switch-bootstrap + .lable::before {
        font-family: FontAwesome;
        content: "\f00d";
        box-shadow: none;
        border-width: 0;
        font-size: 16px;
        background-color: #a9a9a9;
        color: #F2F2F2;
        width: 52px;
        height: 22px;
        line-height: 21px;
        text-indent: 32px;
        -webkit-transition: background 0.1s ease;
        -o-transition: background 0.1s ease;
        transition: background 0.1s ease;
    }
    .switch.switch-bootstrap + .lable::after {
        content: '';
        position: absolute;
        top: 2px;
        left: 3px;
        border-radius: 12px;
        box-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        width: 18px;
        height: 18px;
        text-align: center;
        background-color: #F2F2F2;
        border: 4px solid #F2F2F2;
        -webkit-transition: left 0.2s ease;
        -o-transition: left 0.2s ease;
        transition: left 0.2s ease;
    }
    .switch.switch-bootstrap:checked + .lable::before {
        content: "\f00c";
        text-indent: 6px;
        color: #FFF;
        border-color: #b7d3e5;

    }
    .switch-primary >.switch.switch-bootstrap:checked + .lable::before {
        background-color: #337ab7;
    }
    .switch-success >.switch.switch-bootstrap:checked + .lable::before {
        background-color: #5cb85c;
    }
    .switch-danger >.switch.switch-bootstrap:checked + .lable::before {
        background-color: #d9534f;
    }
    .switch-info >.switch.switch-bootstrap:checked + .lable::before {
        background-color: #5bc0de;
    }
    .switch-warning >.switch.switch-bootstrap:checked + .lable::before {
        background-color: #f0ad4e;
    }
    .switch.switch-bootstrap:checked + .lable::after {
        left: 32px;
        background-color: #FFF;
        border: 4px solid #FFF;
        text-shadow: 0 -1px 0 rgba(0, 200, 0, 0.25);
    }
    /* square */
    .switch-square{
        opacity: 0;
        position: absolute;
        z-index: 1;
        width: 18px;
        height: 18px;
        cursor: pointer;
    }
    .switch-square + .lable{
        position: relative;
        display: inline-block;
        margin: 0;
        line-height: 20px;
        min-height: 18px;
        min-width: 18px;
        font-weight: normal;
        cursor: pointer;
    }
    .switch-square + .lable::before{
        cursor: pointer;
        font-family: fontAwesome;
        font-weight: normal;
        font-size: 12px;
        color: #32a3ce;
        content: "\a0";
        background-color: #FAFAFA;
        border: 1px solid #c8c8c8;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        border-radius: 0;
        display: inline-block;
        text-align: center;
        height: 16px;
        line-height: 14px;
        min-width: 16px;
        margin-right: 1px;
        position: relative;
        top: -1px;
    }
    .switch-square:checked + .lable::before {
        display: inline-block;
        content: '\f00c';
        background-color: #F5F8FC;
        border-color: #adb8c0;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1);
    }
    /* CSS3 on/off switches */
    .switch-square + .lable {
        margin: 0 4px;
        min-height: 24px;
    }
    .switch-square + .lable::before {
        font-weight: normal;
        font-size: 11px;
        line-height: 17px;
        height: 20px;
        overflow: hidden;
        border-radius: 2px;
        background-color: #F5F5F5;
        -webkit-box-shadow: inset 0 1px 1px 0 rgba(0, 0, 0, 0.15);
        box-shadow: inset 0 1px 1px 0 rgba(0, 0, 0, 0.15);
        border: 1px solid #CCC;
        text-align: left;
        float: left;
        padding: 0;
        width: 52px;
        text-indent: -21px;
        margin-right: 0;
        -webkit-transition: text-indent .3s ease;
        -o-transition: text-indent .3s ease;
        transition: text-indent .3s ease;
        top: auto;
    }
    .switch-square.switch-bootstrap + .lable::before {
        font-family: FontAwesome;
        content: "\f00d";
        box-shadow: none;
        border-width: 0;
        font-size: 16px;
        background-color: #a9a9a9;
        color: #F2F2F2;
        width: 52px;
        height: 22px;
        line-height: 21px;
        text-indent: 32px;
        -webkit-transition: background 0.1s ease;
        -o-transition: background 0.1s ease;
        transition: background 0.1s ease;
    }
    .switch-square.switch-bootstrap + .lable::after {
        content: '';
        position: absolute;
        top: 2px;
        left: 3px;
        border-radius: 12px;
        box-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        width: 18px;
        height: 18px;
        text-align: center;
        background-color: #F2F2F2;
        border: 4px solid #F2F2F2;
        -webkit-transition: left 0.2s ease;
        -o-transition: left 0.2s ease;
        transition: left 0.2s ease;
    }
    .switch-square.switch-bootstrap:checked + .lable::before {
        content: "\f00c";
        text-indent: 6px;
        color: #FFF;
        border-color: #b7d3e5;

    }
    .switch-primary >.switch-square.switch-bootstrap:checked + .lable::before {
        background-color: #337ab7;
    }
    .switch-success >.switch-square.switch-bootstrap:checked + .lable::before {
        background-color: #5cb85c;
    }
    .switch-danger >.switch-square.switch-bootstrap:checked + .lable::before {
        background-color: #d9534f;
    }
    .switch-info >.switch-square.switch-bootstrap:checked + .lable::before {
        background-color: #5bc0de;
    }
    .switch-warning >.switch-square.switch-bootstrap:checked + .lable::before {
        background-color: #f0ad4e;
    }
    .switch-square.switch-bootstrap:checked + .lable::after {
        left: 32px;
        background-color: #FFF;
        border: 4px solid #FFF;
        text-shadow: 0 -1px 0 rgba(0, 200, 0, 0.25);
    }
    .switch-square.switch-bootstrap + .lable::after {
        border-radius: 2px;
    }

    /** */
</style>

<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="super-admin.jsp">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">All Sub-Admin</li>
</ol>


<div class="row ml-5 mt-5">


    <div class="col-md-12">

        <div class="adbtnBox">
            <div class="adbtn">
                <a href="adminController?target=new_admin_create"><img
                        src="../WebContent/images/plus.png" style="width: 35px"> Add new Sub Admin</a>
            </div>
        </div>
        <%
            //request.setAttribute("error", "Duplicate Entity found!");
        %>

        <table class="table" border="2px solid black">
            <thead>
            <tr>
                <th>Admin name</th>
                <th>Password</th>
                <th>Update Development Fee</th>
                <th>Students Information</th>
                <th>Applications Letters</th>
                <th>Update Development Fees Table</th>
                <th>Update Semester Fees Table</th>
                <th>Update Form fill up Fees Table</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>

            <%
                for (int i = 0; i < admin_list.size(); i++) {
            %>
            <tr>
                <td>
                    <%
                        out.print(admin_list.get(i).getName());
                    %>
                </td>
                <td>
                    <%
                        out.print(admin_list.get(i).getPassword());
                    %>
                </td>

                <td>
                    <a class="table_row" href="#" id="item1"
                       data-id="<% out.print(admin_list.get(i).getId());%>"
                       data-type="update_development_fee"
                       data-value="<% out.print(admin_list.get(i).getItem1());%>"><%
                        out.print(admin_list.get(i).getItem1());%>
                    </a>
                </td>
                <td>
                    <a class="table_row" href="#" id="item2"
                       data-id="<% out.print(admin_list.get(i).getId());%>"
                       data-type="students_info"
                       data-value="<% out.print(admin_list.get(i).getItem2());%>"><%
                        out.print(admin_list.get(i).getItem2());
                    %>
                    </a>

                </td>
                <td>
                    <a class="table_row" href="#" id="item3"
                       data-id="<% out.print(admin_list.get(i).getId());%>"
                       data-type="application_letters"
                       data-value="<% out.print(admin_list.get(i).getItem3());%>"><%
                        out.print(admin_list.get(i).getItem3());
                    %>
                    </a>

                </td>
                <td>
                    <a class="table_row" href="#" id="item4"
                       data-id="<% out.print(admin_list.get(i).getId());%>"
                       data-type="development_fees_table_update"
                       data-value="<% out.print(admin_list.get(i).getItem4());%>"><%
                        out.print(admin_list.get(i).getItem4());
                    %>
                    </a>
                </td>

                <td>
                    <a class="table_row" href="#" id="item5"
                       data-id="<% out.print(admin_list.get(i).getId());%>"
                       data-type="semester_fees_table_update"
                       data-value="<% out.print(admin_list.get(i).getItem5());%>"><%
                        out.print(admin_list.get(i).getItem5());
                    %>
                    </a>
                </td>
                <td>
                    <a class="table_row" href="#" id="item6"
                       data-id="<% out.print(admin_list.get(i).getId());%>"
                       data-type="formfillup_fees_table_update"
                       data-value="<% out.print(admin_list.get(i).getItem6());%>"><%
                        out.print(admin_list.get(i).getItem6());
                    %>
                    </a>

<%--                    <label class="label-switch switch-primary">--%>
<%--                        <input type="checkbox" class="switch switch-bootstrap status" name="status" id="table_row"--%>
<%--                               data-id="<% out.print(admin_list.get(i).getId());%>"--%>
<%--                               data-type="formfillup_fees_table_update"--%>
<%--                               data-value="<% out.print(admin_list.get(i).getItem6());%>" checked="<% admin_list.get(i).getItem6().equals("1")? "checked":"unchecked" %>">--%>
<%--                        <span class="lable"></span></label>--%>

                </td>
                <td class="text-center"><a class="btn btn-primary"
                                           href="adminController?target=delete&&delete_id=<%out.print(admin_list.get(i).getId());%>">Delete</a>
                </td>
            </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>

</div>

<script>
    $(document).ready(function () {
        $('.table_row').on('click', function () {
            var sub_admin_id = $(this).attr("data-id");
            var type = $(this).attr("data-type");
            var value = $(this).attr("data-value");

            //alert(sub_admin_id + " " + type + " " + value);
            console.log(sub_admin_id + " " + type + " " + value);
            $.ajax({
                url: 'SubAdminServletController?update_data_type=' + type,
                dataType: 'text',
                data: {
                    sub_admin_id: sub_admin_id,
                    value: value
                },
                success: function (status) {

                    console.log(status);
                    //alert(status);
                    window.location.reload(true);

                }
            });

        });
    });
</script>


<%@include file="admin-footer.jsp" %>

<%
    } else {

        response.sendRedirect("admin-login.jsp");

    }
%>
