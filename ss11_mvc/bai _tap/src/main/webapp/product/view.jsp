<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/15/2022
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>f
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to products list</a>
</p>
<table>
    <tr>
        <td>Id: </td>
        <td>${"product".getId()}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${"product".getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${"product".getPrice()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>${"product".getDescription()}</td>
    </tr>
    <tr>
        <td>Brand: </td>
        <td>${"product".getBrand()}</td>
    </tr>
</table>
</body>
</html>
