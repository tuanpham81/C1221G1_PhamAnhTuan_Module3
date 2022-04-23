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
                    <input type="number" name="serviceId" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Service Name:</th>
                <td>
                    <input type="text" name="name" size="45"/>
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
                    <input type="number" name="cost" size="45"/>
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
                    <select name="rentTypeId">
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Service Type ID:</th>
                <td>
                    <select name="serviceTypeId">
                        <c:forEach var="serviceType" items="${serviceTypeList}">
                            <option value="${serviceType.serviceTypeId}">${serviceType.serviceTypeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Service Standard:</th>
                <td>
                    <input type="text" name="standard" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Other Convenient</th>
                <td>
                    <input type="text" name="otherConvenient" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Pool Area:</th>
                <td>
                    <input type="number" name="poolArea" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Number of floors:</th>
                <td>
                    <input type="number" name="floorNumber" size="15"/>
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
