<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/10/2023
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <h1>Product Description</h1>
    <label>List Price: </label><br/>
    <input type="text" name="price" value=${price} /><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="percent" value=${percent} /><br/>
    <label>Discount Amount: </label><br/>
    <input type="text" name="price" value=${discountAmount} /><br/>
    <label>Discount Price: </label><br/>
    <input type="text" name="percent" value=${discountPrice} /><br/>
</div>
</body>
</html>
