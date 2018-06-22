<%-- 
    Document   : viewOrder
    Created on : Jun 22, 2018, 1:53:24 AM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Customer Detail</h1>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <ul class="rig columns-2">
                        <c:forEach items="${ordersDetails}" var="ordersDetails">     
                            <li>     
                                <h2>Product Id: ${ordersDetails.productId}</h2>
                                <h4>Orders Id: ${ordersDetails.ordersId}</h4>
                                <h4>Price: ${ordersDetails.price} RSD</h4>
                                <h4>Quantity ${ordersDetails.quantity}</h4>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                
            </div>
            <a href="<spring:url value="/admin/customer" />" class="btn btn-default">Back to Customer Panel</a>
        </div>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>