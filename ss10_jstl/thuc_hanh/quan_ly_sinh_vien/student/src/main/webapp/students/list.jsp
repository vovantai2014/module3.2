<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<h2 align="center"> DANH SACH SINH VIEN</h2>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>STT</th>
                <th>Id</th>
                <th>Name</th>
                <th>Sex</th>
                <th>Address</th>
                <th>Mark</th>
                <th>Actions</th>
            </tr>
        </thead>
        <thead>
            <c:forEach items="${students}" var="student" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>
                        <c:if test="${student.sex == 1}">Nam</c:if>
                        <c:if test="${student.sex == 0}">Nu</c:if>
                    </td>
                    <td>${student.address}</td>
                    <td>${student.mark}</td>
                    <td>
                        <a href="#" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                        <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                    </td>
                </tr>
            </c:forEach>
        </thead>
    </table>
    <br>
    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Student</span></a>



























<%--<h1> Student List</h1>--%>
<%--<a href="/student?action = create">Create New Student</a>--%>
<%--<table class="table table-striped" style="width: 100%" align="center">--%>
<%--    <tr>--%>
<%--        <th>STT</th>--%>
<%--        <th>ID</th>--%>
<%--        <th>Name</th>--%>
<%--        <th>Sex</th>--%>
<%--        <th>Address</th>--%>
<%--        <th>Mark</th>--%>
<%--        <th>Detail</th>--%>
<%--        <th>Update</th>--%>
<%--    </tr>--%>
<%--    <c:forEach items="${students}" var="student" varStatus="status">--%>
<%--        <tr>--%>
<%--            <td>${status.count}</td>--%>
<%--            <td>${student.id}</td>--%>
<%--            <td>${student.name}</td>--%>
<%--            <td>--%>
<%--                <c:if test="${student.sex == 1}">Nam</c:if>--%>
<%--                <c:if test="${student.sex == 0}">Nu</c:if>--%>
<%--            </td>--%>
<%--            <td>${student.address}</td>--%>
<%--            <td>${student.mark}</td>--%>
<%--            <td><a href="/student? action = detail&id=${student.id}">Detail</a></td>--%>
<%--            <td><a href="/student? action = update&id=${student.id}">Update</a></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

<%--</table>--%>
</body>
</html>
