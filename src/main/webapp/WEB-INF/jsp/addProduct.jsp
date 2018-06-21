<%-- 
    Document   : addProduct
    Created on : Jun 19, 2018, 8:48:39 PM
    Author     : micic
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/jsp/partials/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Add Product</h1>


            <p class="lead">Fill the below information to add a product:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/product/addProduct"
                   method="post" commandName="product" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name</label>
                <form:errors path="productName" cssStyle="color:#ff0000;" />
                <form:input path="productName" id="productName" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <form:textarea path="productDescription" id="productDescription" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <label class="checkbox-inline"><form:radiobutton path="productCategory" id="productCategory" value="Food" />Food</label>
                <label class="checkbox-inline"><form:radiobutton path="productCategory" id="productCategory" value="Toys" />Toys</label>
                <label class="checkbox-inline"><form:radiobutton path="productCategory" id="productCategory" value="Grooming" />Grooming</label>
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <form:errors path="productPrice" cssStyle="color:#ff0000;" />
                <form:input path="productPrice" id="productPrice" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="status">Status</label>
                <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="active" />Active</label>
                <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="inactive" />Inactive</label>
            </div>

            <div class="form-group">
                <label for="unitInStock">Unit In Stock</label>
                <form:errors path="unitInStock" cssStyle="color:#ff0000;" />
                <form:input path="unitInStock" id="unitInStock" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="manufacturer">Manufacturer</label>
                <form:input path="productManufacturer" id="productManufacturer" class="form-Control" />
            </div>

            <div class="form-group">
                <label class="control-label" for="productImage">Upload Picture</label>
                <input id="productImage" type="file" class="form-control" name="file"/>
            </div>

            <br/><br/>

            <input type="submit" value="submit" class="btn btn-default">
            <a href="<c:url value="/admin/productInventory" />" class="btn btn-default">Cancel</a>

        </form:form>

<%@ include file="/WEB-INF/jsp/partials/footer.jsp" %>