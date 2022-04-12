<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/12/2022
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Discount Calculator</title>
  </head>
  <body>
  <h1>Product Discount Calculator</h1>
  <form action="/display-discount" method="post">
    <label>Product's Name: </label><br/>
    <input type="text" name="name"/><br/>
    <label>Product's Price: </label><br/>
    <input type="number" name="price" placeholder="VND"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="number" name="percent" placeholder="%"/><br/>
    <br>
    <input type = "submit" id = "submit" value = "Calculate"/>
  </form>
  </body>
</html>
