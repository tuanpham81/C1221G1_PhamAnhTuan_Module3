<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/23/2022
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management</title>
</head>
<body>
<center>
    Employee <h2>
    <a href="/employees?action=employees">List All Employees</a>
</h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Employee</h2>
            </caption>
            <tr>
                <th>Employee ID:</th>
                <td>
                    <input type="number" name="employeeId" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee Name:</th>
                <td>
                    <input type="text" name="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee Birthday:</th>
                <td>
                    <input type="date" name="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee ID Card:</th>
                <td>
                    <input type="text" name="idCardNumber" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee Salary:</th>
                <td>
                    <input type="number" name="salary" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee Phone Number:</th>
                <td>
                    <input type="text" name="phone" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Employee email:</th>
                <td>
                    <input type="text" name="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Employee Address:</th>
                <td>
                    <input type="text" name="address" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Employee Position:</th>
                <td>
                    <select name="position">
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.positionId}">${position.positionName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Employee Education Degree:</th>
                <td>
                    <select name="educationDegree">
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.degreeId}">${educationDegree.degreeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Employee Division:</th>
                <td>
                    <select name="division">
                        <c:forEach var="division" items="${divisionList}">
                            <option value="${division.divisionId}">${division.divisionName}</option>
                        </c:forEach>
                    </select>
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

