<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/17/2023
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Product</title>
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
<h1 align="center"> Detail Product</h1>
<hr>
<a>Ma SP :</a><c:out value="${pro.id}"/><br>
<a>Ten SP : </a><c:out value="${pro.name}"/><br>
<table class="table table-striped table-hover">
    <tr>
        <td>Ma San Pham :</td>
        <td><c:out value="${pro.id}"/></td>
    </tr>
    <tr>
        <td>Ten San Pham :</td>
        <td><c:out value="${pro.name}"/></td>
    </tr>

    <tr>
        <td>Gia San Pham:</td>
        <td><c:out value="${pro.price}"/></td>
    </tr>
    <tr>
        <td>Mo Ta San Pham :</td>
        <td><c:out value="${pro.describe}"/></td>
    </tr>
    <tr>
        <td>Nha San Xuat :</td>
        <td><c:out value="${pro.producer}"/></td>
    </tr>

</table>
<p class="container" align="right"><a href="/product/list.jsp"/>Back to homepage</p>
</body>
</html>
