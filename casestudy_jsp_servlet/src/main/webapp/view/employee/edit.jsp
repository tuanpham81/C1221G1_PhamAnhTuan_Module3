<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/23/2022
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
</head>
<body>
<div style="text-align: center;">
    <h1>Employee Management</h1>
    <h2>
        <a href="employees?action=employees">List All Employees</a>
    </h2>
</div>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Employee
                </h2>
            </caption>
            <c:if test="${employee != null}">
                <input type="hidden" name="employeeId" value="<c:out value='${employee.employeeId}' />"/>
            </c:if>
            <tr>
                <th>Employee Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${employee.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer Birthday:</th>
                <td>
                    <input type="date" name="birthday" size="45"
                           value="<c:out value='${employee.birthday}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee ID Card:</th>
                <td>
                    <input type="text" name="idCardNumber" size="45"
                           value="<c:out value='${employee.idCardNumber}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Salary:</th>
                <td>
                    <input type="number" name="salary" size="45"
                           value="<c:out value='${employee.salary}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Phone Number:</th>
                <td>
                    <input type="text" name="phone" size="45"
                           value="<c:out value='${employee.phone}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee email:</th>
                <td>
                    <input type="text" name="email" size="15"
                           value="<c:out value='${employee.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Address:</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${employee.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Position:</th>
                <td>
                    <select name="position">
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.positionId}" ${employee.positionId == position.positionId?"selected":""}>
                                    ${position.positionName}</option>

                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Employee Education Degree:</th>
                <td>
                    <select name="educationDegree">
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.degreeId}" ${employee.educationDegree == educationDegree.degreeId?"selected":""}>
                                    ${educationDegree.degreeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Employee Division:</th>
                <td>
                    <select name="division">
                        <c:forEach var="division" items="${divisionList}">
                            <option value="${division.divisionId}" ${employee.divisionId == division.divisionId?"selected":""}>
                                    ${division.divisionName}</option>
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

