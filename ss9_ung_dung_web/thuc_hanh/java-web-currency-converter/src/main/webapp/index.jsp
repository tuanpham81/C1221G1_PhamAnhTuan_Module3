<%--
  Created by IntelliJ IDEA.
  User: garu9
  Date: 4/12/2022
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Converter</title>
<%--  <link rel="stylesheet" type="text/css" href="css/style.css">--%>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert" method="post">
  <label>List Price: </label><br/>
  <input type="text" name="price"/><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="percent"/><br/>
  <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>
