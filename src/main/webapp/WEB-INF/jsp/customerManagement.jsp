<%-- 
    Document   : customerManagment
    Created on : Jun 19, 2018, 8:47:51 PM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>

<script>
    $(document).ready(function () {
        $('#example').DataTable({
             scrollY: '50vh',
             scrollCollapse: true,
             paging: false
        });
    });
</script>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Customer Management Page</h1>

            <p class="lead">This is the customer management page!</p>
            <a href="<spring:url value="/admin" />" class="btn btn-default">Back to Admin Panel</a>
        </div>

        <table id="example" class="display" cellspacing="0" width="100%">
            <thead> 
                <tr class="bg-primary">
                    <th>Username</th>
                    <th>Enabled</th>
                    <th>Ban/Unban User</th>
                </tr>
            </thead>
            <c:forEach items="${usersList}" var="users">
                <tr> 
                    <c:if test="${pageContext.request.userPrincipal.name != users.username}">
                        <td><a href="<spring:url value="/admin/customer/view/${users.usersId}" />">${users.username}</a></td>
                        <td>${users.enabled}</td>
                        <c:choose>
                            <c:when test="${users.enabled == true}">
                                <td><a href="<spring:url value="/admin/customer/ban/${users.username}" />"><span class="glyphicon glyphicon-remove" style="color: red;"></span></a></td>    
                            </c:when>
                            <c:otherwise>
                                <td><a href="<spring:url value="/admin/customer/unban/${users.username}" />"><span class="glyphicon glyphicon-ok" style="color: green;"></span></a></td>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </tr> 
            </c:forEach>
        </table>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>