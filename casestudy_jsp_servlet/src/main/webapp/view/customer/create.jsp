<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/20/2022
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="customers?action=customers">List All Customers</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Customer</h2>
            </caption>
            <tr>
                <th>Customer ID:</th>
                <td>
                    <input type="number" name="customerId" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Type:</th>
                <td>
                    <select name="customerType">
                        <c:forEach var="customerType" items="${customerTypeList}">
                            <option value="${customerType.typeId}">${customerType.typeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Birthday:</th>
                <td>
                    <input type="date" name="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Gender:</th>
                <td>
                    <select name="gender">
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer ID Card:</th>
                <td>
                    <input type="text" name="idCard" size="45"/>
                    <p></p>
                </td>
            </tr>
            <tr>
                <th>Customer Phone Number:</th>
                <td>
                    <input type="text" name="phone" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Customer Address:</th>
                <td>
                    <input type="text" name="address" size="15"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
