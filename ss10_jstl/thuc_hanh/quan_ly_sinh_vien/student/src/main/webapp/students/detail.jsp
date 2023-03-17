<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/16/2023
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Students</title>
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
<h1 align="center"> Detail Student</h1>
<hr>
<a> MSV :</a><c:out value="${student.id}"/><br>
<a>Ho Ten: </a><c:out value="${student.name}"/><br>
<table class="table table-striped table-hover">
    <tr>
        <td>Ma Sinh Vien :</td>
        <td><c:out value="${student.id}"/></td>
    </tr>
    <tr>
        <td>Ho Va Ten :</td>
        <td><c:out value="${student.name}"/></td>
    </tr>
    <tr>
        <td>Gioi Tinh :</td>
        <td>
            <c:if test="${student.sex == 1}">Nam</c:if>
            <c:if test="${student.sex == 0}">Nu</c:if>
        </td>
    </tr>
    <tr>
        <td>Dia Chi :</td>
        <td><c:out value="${student.address}"/></td>
    </tr>
    <tr>
        <td>Diem :</td>
        <td><c:out value="${student.mark}"/></td>
    </tr>
    <tr>
        <td>Xep Loai :</td>
        <td>
            <c:choose>
                <c:when test="${student.mark >=9}">Xuat Sac</c:when>
                <c:when test="${student.mark >=8}">Gioi</c:when>
                <c:when test="${student.mark >=6.5}">Kha</c:when>
                <c:when test="${student.mark >=5}">Trung Binh</c:when>
                <c:otherwise>Yeu</c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>
<p class="container" align="right"><a href="/students/list.jsp"/>Back to homepage</p>
</body>
</html>
