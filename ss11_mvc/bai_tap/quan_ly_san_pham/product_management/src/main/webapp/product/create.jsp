<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/17/2023
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<h1> Create Student</h1>
<form action="/product" method="post">
    <fieldset>
        <legend></legend>
        <table>
            <tr>
                <th>Ma San Pham :</th>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <th>Ten San Pham :</th>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <th>Gia San Pham :</th>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <th>Mo Ta San Pham :</th>
                <td><input type="text" name="describe"></td>
            </tr>

            <tr>
                <th>Nha San Xuat</th>
                <td><input type="text" name="producer"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save" align="center"></td>
            </tr>
        </table>
    </fieldset>
    <input type="hidden" name="action" value="create">
</form>
</body>
</html>
