<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 27/08/2022
  Time: 12:43 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        a{
            color: blue;
            text-decoration: none;
        }
        a:hover{
            color: red;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h3>Cập nhập user</h3>
<p>
    <a href="/user">Về trang quản lý user</a>
</p>
<form method="post">
    <fieldset>
        <legend>Thông tin user</legend>
        <table>
            <tr>
                <td>Tên user:</td>
                <td><input name="name" value="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input name="email" value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Tỉnh:</td>
                <td><input name="country" value="${user.getCountry()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Cập nhập"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
