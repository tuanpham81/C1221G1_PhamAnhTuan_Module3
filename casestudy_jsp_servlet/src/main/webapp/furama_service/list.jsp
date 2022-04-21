<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/21/2022
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furama Service</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div  align="center">
    <h2>Service Management</h2>

<%--    <form method="post" action="/services?action=search">--%>
<%--        <label> Search customer by name</label>--%>
<%--        <input type="text" name="searchName">--%>
<%--        <button type="submit">Search</button>--%>
<%--    </form>--%>

</div>

<%--<a href="/customers?action=create">Add New Customer</a>--%>

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
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td><c:out value="${customer.customerId}"/></td>
                <td>
                    <c:forEach var="customerType" items="${customerTypeList}">
                        <c:if test="${customer.customerType == customerType.typeId}">
                            ${customerType.typeName}
                        </c:if>
                    </c:forEach>
                </td>
                <td><c:out value="${customer.name}"/></td>
                <td><c:out value="${customer.birthDay}"/></td>
                <td>
                    <c:choose>
                        <c:when test="${customer.gender=='1'}">
                            Nam
                            <br/>
                        </c:when>
                        <c:otherwise>
                            Nữ
                            <br/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><c:out value="${customer.idCardNumber}"/></td>
                <td><c:out value="${customer.phoneNumber}"/></td>
                <td><c:out value="${customer.email}"/></td>
                <td><c:out value="${customer.address}"/></td>
                <td>
                    <form method="post">
                        <button>
                            <a href="/customers?action=edit&id=${customer.customerId}">Edit</a>
                        </button>
                    </form>
                </td>
                <td>
                    <button onclick="deleteCustomerModal(${customer.customerId},'${customer.name}')" type="button" class="btn btn-danger"
                            data-toggle="modal" data-target="#exampleModal">
                        Delete
                    </button>
                </td>
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
