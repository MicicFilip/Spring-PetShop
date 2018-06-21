<%-- 
    Document   : productInventory
    Created on : Jun 19, 2018, 8:47:30 PM
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
            <h1>Product Inventory Dashboard</h1>

            <p class="lead">This is the product inventory page:</p>
            <a href="<spring:url value="/admin" />" class="btn btn-default">Back to Admin Panel</a>
            <table id="example" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-primary">
                        <th>Proto Thumb</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>View Product</th>
                        <th>Remove Product</th>
                        <th>Edit Product</th>
                    </tr>
                </thead>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td><img src="${product.productImage}" alt="image" style="width:100%"/></td>
                        <td>${product.productName}</td>
                        <td>${product.productCategory}</td>
                        <td>${product.productPrice} RSD </td>
                        <td>
                            <a href="<spring:url value="/product/viewProduct/${product.productId}" />"><span class="glyphicon glyphicon-info-sign"></span></a>
                        </td>
                        <td><a href="<spring:url value="/admin/product/deleteProduct/${product.productId}" />"><span class="glyphicon glyphicon-remove"></span></a></td>
                        <td><a href="<spring:url value="/admin/product/editProduct/${product.productId}" />"><span class="glyphicon glyphicon-pencil"></span></a></td>
                    </tr>
                </c:forEach>
            </table>

            <a href="<spring:url value="/admin/product/addProduct" />" class="btn btn-primary">Add Product</a>
            

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>