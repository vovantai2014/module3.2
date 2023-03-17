<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/16/2023
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Student</title>
</head>
<body>
<h1>Delete Student</h1>
<form method="post">
    <fieldset>
        <legend> Student Information</legend>
        <table>
            <tr>
                <td> Id :</td>
                <td><input type="text" name="id" width="30px" value="${st.id}"></td>
            </tr>
            <tr>
                <td> Name :</td>
                <td><input type="text" name="name" width="30px" value="${st.name}"></td>
            </tr>
            <tr>
                <td> Sex :</td>
                <td><input type="text" name="sex" width="30px" value="${st.sex}"></td>
            </tr>
            <tr>
                <td> Address :</td>
                <td><input type="text" name="address" width="30px" value="${st.address}"></td>
            </tr>
            <tr>
                <td> Mark :</td>
                <td><input type="text" name="mark" width="30px" value="${st.mark}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
