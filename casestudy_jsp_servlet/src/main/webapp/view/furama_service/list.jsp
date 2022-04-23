<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/21/2022
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Furama Service</title>
</head>
<body>

<html>
<head>
    <title>Service Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div align="center">
    <h2>Service Management</h2>
</div>

<a href="/services?action=create">Add New Service</a>

<div>
    <table border="1" cellpadding="5">
        <tr>
            <th>Service ID</th>
            <th>Service Name</th>
            <th>Area</th>
            <th>Cost</th>
            <th>Max People</th>
            <th>Rent Type ID</th>
            <th>Service Type ID</th>
            <th>Room Standard</th>
            <th>Other Convenient</th>
            <th>Pool Area</th>
            <th>Number of Floors</th>
        </tr>
        <c:forEach var="service" items="${serviceList}">
            <tr>
                <td><c:out value="${service.serviceId}"/></td>
                <td><c:out value="${service.name}"/></td>
                <td><c:out value="${service.area}"/></td>
                <td><c:out value="${service.cost}"/></td>
                <td><c:out value="${service.maxPeople}"/></td>
                <td>
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <c:if test="${service.rentTypeId == rentType.rentTypeId}">
                            ${rentType.rentTypeName}
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="serviceType" items="${serviceTypeList}">
                        <c:if test="${service.serviceTypeId == serviceType.serviceTypeId}">
                            ${serviceType.serviceTypeName}
                        </c:if>
                    </c:forEach>
                </td>
                <td><c:out value="${service.standard}"/></td>
                <td><c:out value="${service.otherConvenient}"/></td>
                <td><c:out value="${service.poolArea}"/></td>
                <td><c:out value="${service.floorNumber}"/></td>
                    <%--                <td>--%>
                    <%--                    <button onclick="deleteServiceModal(${service.serviceId},'${service.name}')" type="button" class="btn btn-danger"--%>
                    <%--                            data-toggle="modal" data-target="#exampleModal">--%>
                    <%--                        Delete--%>
                    <%--                    </button>--%>
                    <%--                </td>--%>
            </tr>
        </c:forEach>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
</body>
</html>
</body>
</html>
