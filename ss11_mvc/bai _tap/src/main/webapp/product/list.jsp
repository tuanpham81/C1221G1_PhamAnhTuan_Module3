<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/15/2022
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<h1>Product manager</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Brand</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="product" items='${"products"}'>
        <tr>
            <th><a href="/products?action=view&id=${product.id}">${product.name}</a></th>
            <th>${product.price}</th>
            <th>${product.description}</th>
            <th>${product.brand}</th>
            <th><a href="/products?action=edit&id=${product.id}">edit</a></th>
            <th><a href="/products?action=delete&id=${product.id}">delete</a></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
