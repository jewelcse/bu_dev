<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
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
%>

<%
    String subject = "";
    String subject2 = "";

    String name = request.getParameter("s_name");
    String roll = request.getParameter("s_roll");
    String semester = request.getParameter("semester");
    String dept = request.getParameter("s_dept");
    String feetype = request.getParameter("feetype");
    String reason = request.getParameter("reason");

    session.setAttribute("s_name", name);
    session.setAttribute("s_roll", roll);
    session.setAttribute("s_dept", dept);
    session.setAttribute("feetype", feetype);
    session.setAttribute("reason", reason);

    System.out.print(name);
    if (semester != null) {
        if (request.getParameter("subject") != null) {
            subject = request.getParameter("subject");
            session.setAttribute("subject1", subject);
        }
        if (request.getParameter("subject2") != null) {
            subject2 = request.getParameter("subject2");
            session.setAttribute("subject2", subject2);
        }

        session.setAttribute("semester", semester);
    } else {
        System.out.print("semester nei");
    }
%>

<%
    String session_name = (String) session.getAttribute("s_name");
    String session_roll = (String) session.getAttribute("s_roll");
    String session_dept = (String) session.getAttribute("s_dept");
    String session_semester = (String) session.getAttribute("semester");
    String session_subject1 = (String) session.getAttribute("subject1");
    String session_subject2 = (String) session.getAttribute("subject2");
    String session_feetype = (String) session.getAttribute("feetype");
    String session_reason = (String) session.getAttribute("reason");
    String newsub = "";

    if (session_subject1 != null) {
        newsub = session_subject1;
    }
    if (session_subject2 != null) {
        newsub = newsub + " and " + session_subject2;
    }

    if (session_name != null) {

        System.out.println(session_name);
    }
%>


<style>
    .box-app {
        background-color: #4db6ac;
    }
</style>


<div class="container">
    <div class="row">
        <div class="col-md-8 m-auto pt-2">
            <div class="p-4">
                <h3>Successfully Application Submitted!!</h3>

            </div>

        </div>
    </div>
</div>


<div class="col-md-8 m-auto box box-app" id="HTMLtoPDF">
    <div class="p-5 m-5">
        <p>
            To</br> The Chairman</br>
                <%
				out.print(session_dept);
			%></br> University of Barishal
        </p>

        <p>
            <strong>Subject:</strong> Application for
            <%
                out.print(newsub);
            %>
            of
            <%
                out.print(session_feetype);
            %>
        </p>
        <p>
            Sir,</br> I am
                <%
			out.print(session_name);
		%>
            bearing roll no:
                <%
			out.print(session_roll);
		%>
            studying in
                <%
			out.print(session_semester);
		%>
            semester in the department of
                <%
			out.print(session_dept);
		%>
            at University of Barishal.</br>

                <%
				out.print(session_reason);
			%>
            </br>
        <p>In the circumstance, I hope that you would be kind enough to
            consider my problems and grant my application.</p>

        <p>
            Your Obediently,</br>
                <%
				out.print(session_name);
			%></br> Class Roll:<span id="applicantRollNo"> <%
            out.print(session_roll);
        %></span></br> Department of
                <%
 	out.print(session_dept);
 %></br> University of Barisal
        </p>
    </div>
</div>


<a href="#" onclick="HTMLtoPDF()" style="float: right" class="mr-5">Download
    PDF</a>


<script>
    function HTMLtoPDF() {
        /* var rollno = ('#applicantRollNo').val(); */
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
                pdf.save('application_form.pdf');
            })
    }
</script>

<script type="text/javascript" src="../WebContent/assets/js/jspdf.js"></script>
<script type="text/javascript" src="../WebContent/assets/js/pdfFromHTML.js"></script>
<script type="text/javascript" src="../WebContent/assets/js/jquery-2.1.3.js"></script>

<br>
<br>
</body>
<%@include file="footer.jsp" %>
<%
    } else {
        response.sendRedirect("login.jsp");

    }
%>