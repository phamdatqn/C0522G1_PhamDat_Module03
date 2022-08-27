<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 26/08/2022
  Time: 9:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<form style="margin-top: 50px">
    <fieldset>
        <legend>Nhập tỉnh cần tìm:</legend>
        <table>
            <tr>
                <td><input name="txtCountry"></td>
                <td><input name="action" type="submit" value="search"></td>
                <td>
                    <button name="action" type="submit" value="sort">Sắp xếp tên tăng dần</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>

<span style="text-align: center">Danh sách User</span>
<br>
<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>Họ và tên</th>
        <th>Email</th>
        <th>Tỉnh</th>
        <th>Xóa</th>
        <th>Cập nhập</th>
    </tr>
    <c:forEach varStatus="status" var="user" items="${users}">
        <tr>
            <td>${status.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/user?action=delete&id=${user.getId()}">Delete</a></td>
            <td><a href="/user?action=update&id=${user.getId()}">update</a></td>
        </tr>
    </c:forEach>
</table>
<form action="view/create.jsp">
    <button name="add">Thêm mới</button>
</form>

</body>
</html>
