<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/22/2022
  Time: 1:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service Management</title>
</head>
<body>
<center>
    <h1>Service Management</h1>
    <h2>
        <a href="services?action=services">List All Services</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Service</h2>
            </caption>
            <tr>
                <th>Service ID:</th>
                <td>
                    <input type="text" name="serviceId"size="45"/>
                </td>
            </tr>
            <tr>
                <th>Service Name:</th>
                <td>
                    <input type="number" name="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Service Area:</th>
                <td>
                    <input type="text" name="area" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Service Cost:</th>
                <td>
                    <input type="date" name="cost" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Service max capacity:</th>
                <td>
                    <input type="number" name="maxPeople" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Rent Type ID:</th>
                <td>
                    <input type="number" name="rentTypeId" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Service Standard:</th>
                <td>
                    <input type="text" name="phone" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Other Convenient</th>
                <td>
                    <input type="text" name="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Pool Area:</th>
                <td>
                    <input type="text" name="address" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Number of floors:</th>
                <td>
                    <input type="text" name="floorNumber" size="15"/>
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
