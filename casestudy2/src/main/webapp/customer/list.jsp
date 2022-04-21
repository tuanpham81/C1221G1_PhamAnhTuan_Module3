<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/21/2022
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

</head>
<body>
<div  align="center">
    <h2>Customer Management</h2>
<%--    <form method="post" action="/customers?action=search">--%>
<%--        <label> Search user by country</label>--%>
<%--        <input type="text" name="country">--%>
<%--        <button type="submit">Search</button>--%>
<%--    </form>--%>
</div>

<a href="/customers?action=create">Add New Customer</a>

<div>
    <table border="1" cellpadding="5">
        <tr>
            <th>Customer ID</th>
            <th>Customer Type</th>
            <th>Full Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>ID card</th>
            <th>Phone number</th>
            <th>Email</th>
            <th>Address</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="customer" items="${listCustomer}">
            <tr>
                <td><c:out value="${customer.customerId}"/></td>
                <td><c:out value="${customer.customerType}"/></td>
                <td><c:out value="${customer.name}"/></td>
                <td><c:out value="${customer.birthDay}"/></td>
                <td><c:out value="${customer.idNumber}"/></td>
                <td><c:out value="${customer.gender}"/></td>
                <td><c:out value="${customer.phoneNumber}"/></td>
                <td><c:out value="${customer.email}"/></td>
                <td><c:out value="${customer.address}"/></td>
                <td>
                    <form method="post">
                        <button>
<%--                            <a href="/customers?action=edit&id=${customer.id}">Edit</a>--%>
                        </button>
                    </form>
                </td>
                <td>
<%--                    <button onclick="deleteCustomerModal(${customer.id},'${customer.name}')" type="button" class="btn btn-danger"--%>
<%--                            data-toggle="modal" data-target="#exampleModal">--%>
<%--                        Delete--%>
<%--                    </button>--%>
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
