<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    new java.util.Date();
    if (session.getAttribute("currentSessionForSuperAdmin") != null
            || session.getAttribute("currentSessionForSubAdmin") != null) {
%>


<%@include file="admin-header.jsp" %>

<style>
    h3.inline {
        margin-left: 40%;
        margin-right: 50%;
        width: 100%;
    }
</style>


<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="super-admin.jsp">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Preview</li>
</ol>


<a href="#" onclick="HTMLtoPDF()" style="float: right" class="mr-5">Download
    PDF</a>

<div class="col-md-8 m-auto" id="HTMLtoPDF">
    <div class="card p-5 m-5">

        <p>
            To</br> The Chairman</br> Department of ${stuItem.s_department}</br> University of
            Barishal
        </p>

        <p>
            <strong>Subject:</strong> Application for ${newItem.subject} of
            ${newItem.feeType}.

        </p>
        <p>
            Sir,</br> I am ${stuItem.s_name} bearing roll no:${stuItem.s_roll}
            studying in ${newItem.semester} semester in the department of
            ${stuItem.s_department} at University of Barishal.</br> ${newItem.reason}.</br>
        <p>In the circumstance, I hope that you would be kind enough to
            consider my problems and grant my application.</p>

        <p>
            Your Obediently,</br> ${stuItem.s_name}</br> Class Roll: ${stuItem.s_roll}</br>
            Department of ${stuItem.s_department} </br> University of Barisal
        </p>
    </div>


</div>


</body>

<script>
    function HTMLtoPDF() {
        var pdf = new jsPDF('p', 'pt', 'letter');
        source = $('#HTMLtoPDF')[0];
        specialElementHandlers = {
            '#bypassme': function (element, renderer) {
                return true
            }
        };
        margins = {
            top: 50,
            left: 60,
            width: 545
        };
        pdf.fromHTML(source // HTML string or DOM elem ref.
            , margins.left // x coord
            , margins.top // y coord
            , {
                'width': margins.width // max width of content on PDF
                ,
                'elementHandlers': specialElementHandlers
            }, function (dispose) {
                // dispose: object with X, Y of the last line add to the PDF
                //          this allow the insertion of new lines after html
                pdf.save('html2pdf.pdf');
            })
    }
</script>

<script type="text/javascript" src="../WebContent/assets/js/jspdf.js"></script>
<script type="text/javascript" src="../WebContent/assets/js/pdfFromHTML.js"></script>
<script type="text/javascript" src="../WebContent/assets/js/jquery-2.1.3.js"></script>

<%@include file="admin-footer.jsp" %>

<%
} else {
%>

<%@include file="admin-login.jsp" %>
<%
    }
%>