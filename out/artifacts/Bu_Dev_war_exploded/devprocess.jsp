<%@ page import="com.budev.model.Student" %>
<%@include file="header.jsp" %>
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
    if (session.getAttribute("currentSessionStudent") != null) {

        Student currentUser = (Student) (session.getAttribute("currentSessionStudent"));
%>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<section class="">
    <div class="">
        <div class="container">
            <h3 class="h3-responsive font-weight-bold text-center ">Payment
                Form</h3>

            <div class="text-center text-md-right">
                <button onclick="goBack()"
                        class="btn btn-primary mdb-color darken-3">Back
                </button>
                <button class="btn btn-primary mdb-color darken-3">Confirm
                    Payment
                </button>
            </div>
            <hr>

            <div class="row">

                <aside class="col-sm-6">

                    <article class="card">
                        <div class="card-body p-5">

                            <ul class="nav bg-light nav-pills rounded nav-fill mb-3"
                                role="tablist">
                                <li class="nav-item"><a class="nav-link active"
                                                        data-toggle="pill" href="#nav-tab-card"> <i
                                        class="fa fa-credit-card"></i> bKash
                                </a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="pill"
                                                        href="#nav-tab-paypal"> <i class="fab fa-paypal"></i>
                                    Sure-Cash
                                </a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="pill"
                                                        href="#nav-tab-bank"> <i class="fa fa-university"></i>
                                    Dutch Bangla Bank
                                </a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="nav-tab-card">

                                    <p>Payment Instructions</p>
                                    1. For App Payment<br> 2. Make Payment<br> 3. Enter
                                    Daraz Merchant Number: 01 966 114 400<br> 4. Enter total
                                    order amount<br> 5. Enter Reference Number (as displayed
                                    above)<br> 6. Verify your payment by entering your PIN<br>
                                    7. It might take up to 15 minutes for payment verification<br>
                                    8. For USSD Payment follow below steps<br> 9. Dial *247#
                                    to view bKash Menu<br> 10. Press 3 for "Payments"<br>
                                    11. Enter Daraz Merchant Number: 01 966 114 400<br> 12.
                                    Enter total order amount<br> 13. Enter Reference Number
                                    (as displayed above)<br> 14. Enter 1 for the bKash Counter
                                    No<br> 15. Verify your payment by entering your PIN<br>
                                    16. It might take up to 15 minutes for payment verification
                                    Please note that Daraz will not accept split bKash payments for
                                    a single order. All bKash order payment must be on the exact
                                    order amount. Split payments will result in cancelled orders
                                    and will not be eligible for cashback.


                                </div>


                                <div class="tab-pane fade" id="nav-tab-paypal">
                                    <p>Paypal is easiest way to pay online</p>

                                </div>


                                <div class="tab-pane fade" id="nav-tab-bank">
                                    <p>Bank accaunt details</p>
                                    <dl class="param">
                                        <dt>BANK:</dt>
                                        <dd>THE WORLD BANK</dd>
                                    </dl>
                                    <dl class="param">
                                        <dt>Accaunt number:</dt>
                                        <dd>12345678912345</dd>
                                    </dl>
                                    <dl class="param">
                                        <dt>IBAN:</dt>
                                        <dd>123456789</dd>
                                    </dl>
                                    <p>
                                        <strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur
                                        adipisicing elit, sed do eiusmod tempor incididunt ut labore
                                        et dolore magna aliqua.
                                    </p>
                                </div>
                            </div>

                        </div>


                    </article>
</section>


</body>
</html>
<br>
<br>
<%@include file="footer.jsp" %>
<%
    } else
        response.sendRedirect("login.jsp");
%>
