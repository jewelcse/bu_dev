<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@include file="header.jsp" %>
<body>
<div class="container">
    <div class="row section10 mb-4">
        <div class="col-md-12">


            <div id="carouselExampleIndicators" class="carousel slide"
                 data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0"
                        class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="../images/slider/slider1.jpg"
                             alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <!--  <a href="payment.jsp" ><button type="submit" id="btn1" class="btn btn-primary ">Pay now</button></a>
    <a href="application_form.jsp" ><button type="submit" id="btn2" class="btn btn-primary ">Application now</button></a>-->
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../images/slider/slider2.jpg"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../images/slider/slider3.jpg"
                             alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators"
                   role="button" data-slide="prev"> <span
                        class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                        class="sr-only">Previous</span>
                </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
                        role="button" data-slide="next"> <span
                    class="carousel-control-next-icon" aria-hidden="true"></span> <span
                    class="sr-only">Next</span>
            </a>
            </div>
        </div>
    </div>
    <!--  end row -->


    <div class="row"></div>

</div>


<%@include file="footer.jsp" %>
</body>


