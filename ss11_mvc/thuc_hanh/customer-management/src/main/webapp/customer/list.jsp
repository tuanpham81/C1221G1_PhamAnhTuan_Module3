<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/14/2022
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/customers?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="customer" items='${requestScope["customers"]}'>
        <tr>
            <th><a href="/customers?action=view&id=${customer.id}">${customer.getName()}</a></th>
            <th>${customer.getEmail()}</th>
            <th>${customer.getAddress()}</th>
            <th><a href="/customers?action=edit&id=${customer.id}">edit</a></th>
            <th><a href="/customers?action=delete&id=${customer.id}">delete</a></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
