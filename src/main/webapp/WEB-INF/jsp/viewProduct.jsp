<%-- 
    Document   : viewProducts
    Created on : Jun 19, 2018, 8:45:05 PM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Detail</h1>
            <p class="lead">Here is the detail information of the product:</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <img src="${product.productImage}" alt="image" style="width:100%"/>
                </div>
                <div class="col-md-5">
                    <h3>${product.productName}</h3>
                    <p><strong>Manufacturer</strong>: ${product.productManufacturer}</p>
                    <p><strong>Category</strong>: ${product.productCategory}</p>
                    <p><strong>Price</strong>: ${product.productPrice} RSD</p>
                    <p><strong>Description</strong>: ${product.productDescription}</p>
                    <p><i>Only ${product.unitInStock} are left of ${product.productName}</i></p>
                    <br/>
                    
                    <a href="<c:url value = "/product/allProducts/all" />" class="btn btn-default">Back</a>
                    <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                        <a href="${pageContext.request.contextPath}/customer/cart/buy/${product.productId}" class="btn btn-warning btn-large"><span class="glyphicon glyphicon-shopping-cart"></span> Order Now</a>
                        <a href="<spring:url value="/customer/cart" />" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span> View Cart</a>
                    </c:if>
                    
                </div>
            </div>
        </div>
                    
<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>