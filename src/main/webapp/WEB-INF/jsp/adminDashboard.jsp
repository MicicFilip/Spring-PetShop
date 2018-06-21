<%-- 
    Document   : admin
    Created on : Jun 16, 2018, 4:24:27 PM
    Author     : micic
--%>

<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Administrator PetShop Dashboard</h1>

            <p class="lead">This is the administrator page!</p>
        </div>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>
                Welcome administrator: ${pageContext.request.userPrincipal.name}
            </h2>

        </c:if>

        <h3>
            <a href="<c:url value="/admin/productInventory" /> ">Product Supply Dashboard</a>
        </h3>

        <p>Here you can view, check and modify the product inventory!</p>

        <br/><br/>

        <h3>
            <a href="<c:url value="/admin/customer" /> ">Customer Management Dashboard</a>
        </h3>

        <p>Here you can view the customer information!</p>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>
