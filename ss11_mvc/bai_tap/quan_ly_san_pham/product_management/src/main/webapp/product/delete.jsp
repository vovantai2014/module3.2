<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/17/2023
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1 align="center">Delete Product</h1>
<form method="post">
    <fieldset>
        <legend> </legend>
        <table>
            <tr>
                <td> Ma San Pham :</td>
                <td><input type="text" name="id" width="30px" value="${prod.id}"></td>
            </tr>
            <tr>
                <td> Ten San Pham :</td>
                <td><input type="text" name="name" width="30px" value="${prod.name}"></td>
            </tr>
            <tr>
                <td> Gia San Pham :</td>
                <td><input type="text" name="price" width="30px" value="${prod.price}"></td>
            </tr>
            <tr>
                <td> Mo Ta San Pham :</td>
                <td><input type="text" name="describe" width="30px" value="${prod.describe}"></td>
            </tr>
            <tr>
                <td> Nha San Xuat :</td>
                <td><input type="text" name="producer" width="30px" value="${prod.producer}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
