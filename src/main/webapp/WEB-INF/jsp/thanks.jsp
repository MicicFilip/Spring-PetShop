<%-- 
    Document   : thanks
    Created on : Jun 19, 2018, 8:49:02 PM
    Author     : micic
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Thanks for shopping with us!</h1>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/product/allProducts/all" />" class="btn btn-default">Return to all products</a></p>
        </section>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>