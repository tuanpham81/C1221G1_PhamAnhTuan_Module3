<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/20/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div align="center">
    <h2>Customer Management</h2>

    <form method="post" action="/customers?action=search">
        <label> Search customer by name</label>
        <input type="text" name="searchName">
        <button type="submit">Search</button>
    </form>

</div>

<a href="/customers?action=create">Add New Customer</a>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableCustomer" class="table table-striped table-bordered" style="width:100%">
                <thead>
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
                </thead>
                <tbody>
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
                            <button onclick="deleteCustomerModal(${customer.customerId},'${customer.name}')"
                                    type="button"
                                    class="btn btn-danger"
                                    data-toggle="modal" data-target="#exampleModal">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<form action="/customers?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete customer?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="idCustomer" id="idCustomerDelete">
                    Do you want to delete this Customer? <br>
                    Customer id: <p id="idCustomer"></p>
                    Customer name: <p id="nameCustomer"></p>
                    <p>Can not undo</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    function deleteCustomerModal(id, name) {
        document.getElementById("idCustomer").innerText = id;
        document.getElementById("idCustomerDelete").value = id;
        document.getElementById("nameCustomer").innerText = name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>

