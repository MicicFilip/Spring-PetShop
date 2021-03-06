<%-- 
    Document   : products
    Created on : Jun 19, 2018, 8:44:41 PM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div id="two-columns" class="grid-container" style="display:block;">
            <ul class="rig columns-2">
                <c:forEach items="${products}" var="product">     
                <li> 
                    <c:choose>
                        <c:when test="${product.productImage != null}">
                            <img src="${product.productImage}" style="width:auto; max-height: 200px; height: 70%;"/>
                        </c:when>
                        <c:otherwise>
                            <img src="<c:url value="/resources/images/404.png" />" />
                        </c:otherwise>
                    </c:choose>
                   
                    <h2>${product.productName}</h2>
                    <h4>Category: ${product.productCategory}</h4>
                    <h4>Price: ${product.productPrice} RSD</h4>
                    <h1>More info <a href="<spring:url value="/product/viewProduct/${product.productId}" />">here</a></h1>
                </li>
                </c:forEach>
            </ul>
        </div>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>