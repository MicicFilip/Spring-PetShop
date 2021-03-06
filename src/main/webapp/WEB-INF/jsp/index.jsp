<%-- 
    Document   : index
    Created on : Jun 12, 2018, 9:34:42 PM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide home-image" src="<c:url value="/resources/images/back-1.jpg" />" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Welcome to PetShop </h1>
                    <p>Here you can browse and buy products for your pet. Food and grooming supplies avaliable. Order Now!</p>
                </div>
            </div>
        </div>

        <div class="item">
            <img class="second-slide home-image" src="<c:url value="/resources/images/back-2.jpg" />" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Welcome to PetShop </h1>
                    <p>Here you can browse and buy products for your pet. Food and grooming supplies avaliable. Order Now!</p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide home-image " src="<c:url value="/resources/images/back-3.jpg" />" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Welcome to PetShop </h1>
                    <p>Here you can browse and buy products for your pet. Food and grooming supplies avaliable. Order Now!</p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- /.carousel -->


<div class="container marketing">

    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/resources/images/dog-food-front.jpg"/>" alt="Dog Food Image" width="140" height="140">
            <h2>Dog Food</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/resources/images/cat-grooming-front.jpg"/>" alt="Grooming Products Image" width="140" height="140">
            <h2>Grooming Products</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/resources/images/cat-food-front.jpg"/>" alt="Cat Food Image" width="140" height="140">
            <h2>Cat Food</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.</p>
        </div>
    </div>


    <%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>

