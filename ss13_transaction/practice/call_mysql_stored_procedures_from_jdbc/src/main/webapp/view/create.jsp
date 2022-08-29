<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 27/08/2022
  Time: 12:55 CH
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
<h1>Tạo mới user</h1>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<a href="/user">Quay về trang quản lý user</a>
</p>
<form action="/user?action=add" method="post">
    <fieldset>
        <legend>Thêm thông tin user mới</legend>
        <table>
            <tr>
                <td>Tên user:</td>
                <td>
                    <input type="text" name="name">
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <input type="text" name="email">
                </td>
            </tr>
            <tr>
                <td>Tỉnh:</td>
                <td>
                    <input type="text" name="country">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Create user">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
