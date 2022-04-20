<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/16/2022
  Time: 10:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>

</div>
<div align="center">
    <table border="1" cellpadding="5">
        <h2>List of Users</h2>
        <form method="post" action="/users?action=search">
            <label> Search user by country</label>
            <input type="text" name="country">
            <button type="submit">Search</button>
        </form>
        <br>
<%--        <form action="/users?action=create" method="post">--%>
<%--            <button type="submit" >Add new user</button>--%>
<%--            <br>--%>
<%--        </form>--%>
<%--        <br>--%>
<%--        <form action="/users?action=sortbyname" method="post">--%>
<%--            <button type="submit" >Sort by name</button>--%>
<%--        </form>--%>
<%--        <br>--%>
        <form action="/users?action=create" method="post">
            <button class="btn-secondary" type="submit">Add new user</button>
        </form>
        &nbsp;
        <form action="/users?action=sortbyname" method="post">
            <button class="btn-secondary" type="submit">Sort by name</button>
        </form>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <form method="post">
                        <button>
                            <a href="/customers?action=edit&id=${user.id}">Edit</a>
                        </button>
                    </form>
                </td>
                <td>
                    <button onclick="deleteUserModal(${user.id},'${user.name}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
            </c:forEach>
    </table>
</div>


<form action="/user?action=delete" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete user?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="id" id="idUserDelete">
                Do you want to delete this user? <br>
                User id: <p id="idUser"></p>
                User name: <p id="nameUser"></p>
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
    function deleteUserModal(id, name) {
        document.getElementById("idUser").innerText = id;
        document.getElementById("idUserDelete").value = id;
        document.getElementById("nameUser").innerText = name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>
