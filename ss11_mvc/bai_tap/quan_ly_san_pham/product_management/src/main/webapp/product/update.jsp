<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/17/2023
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
<h1>Update Product</h1>
<form method="post">
    <fieldset>
        <legend> Product Information</legend>
        <table>
            <c:if test="${pr != null}">
                <input type="hidden" name="id" value="${pr.id}"/>
            </c:if>
            <tr>
                <th>Ten San Pham:</th>
                <td>
                    <input type="text" name="name" size="45" value="${pr.name}"/><br>
                </td>
            </tr>
            <tr>
                <th>Gia San Pham:</th>
                <td>
                    <input type="text" name="price" size="45" value="${pr.price}"/><br>
                </td>
            </tr>

                <th>Mo Ta San Pham:</th>
                <td>
                    <input type="text" name="describe" size="45" value="${pr.describe}"/><br>
                </td>
            </tr>
            <tr>
                <th>Nha San Xuat :</th>
                <td>
                    <input type="text" name="producer" size="45" value="${pr.producer}"><br>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
