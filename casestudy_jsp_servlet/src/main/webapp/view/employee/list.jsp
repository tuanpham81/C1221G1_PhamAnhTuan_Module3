<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/22/2022
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div align="center">
    <h2>Employee Management</h2>

    <form method="post" action="/employees?action=search">
        <label> Search employee by name</label>
        <input type="text" name="searchName">
        <button type="submit">Search</button>
    </form>

    <form method="post" action="/employees?action=search2">
        <input type="text" placeholder="Name" name="searchName">
        <input type="text" placeholder="Address" name="searchAddress">
        <select name="searchDivision">
            <option value="" disabled selected>-select division-</option>
            <c:forEach var="division" items="${divisionList}">
                <option value="${division.divisionId}">${division.divisionName}</option>
            </c:forEach>
        </select>
        <button type="submit">Search</button>
    </form>


</div>
<a href="/employees?action=create">Add New Employee</a>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableEmployee" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Full Name</th>
                    <th>Birthday</th>
                    <th>ID card</th>
                    <th>Salary</th>
                    <th>Phone number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Position ID</th>
                    <th>Education Degree</th>
                    <th>Division ID</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employeeList}">
                    <tr>
                        <td><c:out value="${employee.employeeId}"/></td>
                        <td><c:out value="${employee.name}"/></td>
                        <td><c:out value="${employee.birthday}"/></td>
                        <td><c:out value="${employee.idCardNumber}"/></td>
                        <td><c:out value="${employee.salary}"/></td>
                        <td><c:out value="${employee.phone}"/></td>
                        <td><c:out value="${employee.email}"/></td>
                        <td><c:out value="${employee.address}"/></td>
                        <td>
                            <c:forEach var="position" items="${positionList}">
                                <c:if test="${employee.positionId == position.positionId}">
                                    ${position.positionName}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="educationDegree" items="${educationDegreeList}">
                                <c:if test="${employee.educationDegree == educationDegree.degreeId}">
                                    ${educationDegree.degreeName}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="division" items="${divisionList}">
                                <c:if test="${employee.divisionId == division.divisionId}">
                                    ${division.divisionName}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <form method="post">
                                <button>
                                    <a href="/employees?action=edit&id=${employee.employeeId}">Edit</a>
                                </button>
                            </form>
                        </td>
                        <td>
                            <button onclick="deleteEmployeeModal(${employee.employeeId},'${employee.name}')"
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


<form action="/employees?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete employee?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="employeeId" id="employeeIdDelete">
                    Do you want to delete this employee? <br>
                    Employee id: <p id="employeeId"></p>
                    Employee name: <p id="name"></p>
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
    function deleteEmployeeModal(id, name) {
        document.getElementById("employeeId").innerText = id;
        document.getElementById("employeeIdDelete").value = id;
        document.getElementById("name").innerText = name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>