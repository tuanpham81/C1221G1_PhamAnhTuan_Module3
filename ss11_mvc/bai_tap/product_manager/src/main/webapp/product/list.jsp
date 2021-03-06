<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/15/2022
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<form method="post" action="/products?action=search">
<%--    khi nào thì post sẽ tự động bỏ dấu ?--%>
    <label> Search product by name: </label>
    <input type="text" name="name">
    <button type="submit">Tìm kiếm</button>
</form>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Brand</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="product" items='${products}'>
        <tr>
            <th>${product.id}</th>
            <th><a href="/products?action=view&id=${product.id}">${product.getName()}</a></th>
            <th>${product.getPrice()}</th>
            <th>${product.getDescription()}</th>
            <th>${product.getBrand()}</th>
            <th><a href="/products?action=edit&id=${product.id}">edit</a></th>
            <th><a href="/products?action=delete&id=${product.id}">delete</a></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
