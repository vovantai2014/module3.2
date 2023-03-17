<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/16/2023
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Students</title>
</head>
<body>
<h1>Update Students</h1>
<form method="post">
    <fieldset>
        <legend> Student Information</legend>
        <table>
            <c:if test="${s != null}">
                <input type="hidden" name="id" value="${s.id}"/>
            </c:if>
            <tr>
                <th>Name :</th>
                <td>
                    <input type="text" name="name" size="45" value="${s.name}"/><br>
                </td>
            </tr>
            <tr>
                <td>Gioi Tinh :</td>
                <td>
                    <select name="sex">
                        <option value=""> ---choose---</option>
                        <br>
                        <option value="1">Nam</option>
                        <option value="0">Nu</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Dia chi:</th>
                <td>
                    <input type="text" name="address" size="45" value="${s.address}"/><br>
                </td>
            </tr>
            <tr>
                <th>Diem :</th>
                <td>
                    <input type="text" name="mark" size="45" value="${s.mark}"><br>
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
