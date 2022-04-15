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
    <title>Edit</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test='${"message" != null}'>
        <span class="message">${"message"}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to products list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" id="id" value="${"product".getId()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${"product".getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${"product".getPrice()}"></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input type="text" name="description" id="description" value="${"product".getDescription()}"></td>
            </tr>
            <tr>
                <td>Brand: </td>
                <td><input type="text" name="brand" id="brand" value="${"product".getBrand()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
