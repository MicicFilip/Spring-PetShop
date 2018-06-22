<%-- 
    Document   : viewCustomer
    Created on : Jun 22, 2018, 1:14:33 AM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Customer Detail</h1>

            <p class="lead">Here is the detail information of the <b>${customer.username}</b> customer</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h3>Customer Name: ${customer.customerName}</h3>
                    <h3>Customer Email: ${customer.customerEmail}</h3>
                    <h3>Customer Phone: ${customer.customerPhone}</h3>
                    <h3>Customer City: ${customer.customerCity}</h3>
                </div>
                
                <ul class="rig columns-2">
                <c:forEach items="${customerOrders}" var="customerOrders">     
                <li>     
                    <h2>Order Status: ${customerOrders.ordersName}</h2>
                    <h4>Order Date: ${customerOrders.dateCreation}</h4>
                    <h4>View <a href="<spring:url value="/admin/customer/view/order/${customerOrders.ordersId}" />"><b>${customer.username}</b>'s</a> order</h4>
                </li>
                </c:forEach>
            </ul>
            </div>
            <a href="<spring:url value="/admin/customer" />" class="btn btn-default">Back to Customer Panel</a>
        </div>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>