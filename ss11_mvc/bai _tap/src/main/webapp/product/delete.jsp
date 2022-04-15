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
    <title>Delete</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td>${"product".getId()}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${"product".getName()}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${"product".getPrice()}</td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${"product".getDescription()}</td>
            </tr>
            <tr>
                <td>Brand:</td>
                <td>${"product".getBrand()}</td>
            </tr>

            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/products">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
