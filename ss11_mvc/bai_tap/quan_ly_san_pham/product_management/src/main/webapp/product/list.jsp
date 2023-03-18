<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/17/2023
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PRODUCT List</title>
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
<h2 align="center"> DANH SÁCH SẢN PHẨM</h2>
<hr>
<form action="/product" method="get">
    <input type="text" name="action" value="search" hidden>
    <input type="text" name="name" placeholder="nhập tên sp cần tìm">
    <button type="submit">Tìm kiếm</button>
</form>
<hr>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>DESCRIBE</th>
        <th>PRODUCER</th>
        <th>ACTIONS</th>
    </tr>
    </thead>
    <thead>
    <c:forEach items="${p}" var="pro" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${pro.id}</td>
            <td>${pro.name}</td>
            <td>${pro.price}</td>
            <td>${pro.describe}</td>
            <td>${pro.producer}</td>
            <td>
                <a href="/product?action=detail&id=${pro.id}" class="view" title="View" data-toggle="tooltip"><i
                        class="material-icons">&#xE417;</i></a>
                <a href="/product?action=update&id=${pro.id}" class="edit" data-toggle="tooltip"><i
                        class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                <a href="/product?action=delete&id=${pro.id}" class="delete" data-toggle="tooltip"><i
                        class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
            </td>
        </tr>
    </c:forEach>
    </thead>
</table>
<br>
<p align="center"><a href="/product?action=create" class="btn btn-success" data-toggle="tooltip"><i
        class="material-icons">&#xE147;</i> <span>Add New PRODUCT</span></a></p>
</body>
</html>
