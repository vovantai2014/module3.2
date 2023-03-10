<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/10/2023
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/display" method="post">
    <h1>Product Description</h1>
    <label>List Price: </label><br/>
    <input type="text" name="price"  value=""/><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="percent" value=""/><br/>
    <input type = "submit" id = "submit" value = "Calculate Discount"/>
  </form>
  </body>
</html>
