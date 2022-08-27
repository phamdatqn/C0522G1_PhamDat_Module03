<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 27/08/2022
  Time: 11:06 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xóa sản phẩm</title>
</head>
<body>
<h3>Xóa sản phẩm</h3>
<p>
    <a href="/user">Về trang quản lý user</a>
</p>
<form method="post">
    <p>Bạn có chắc muốn xóa User: <span style="color: blue"> ${user.getName()}</span> không ?</p>
    <fieldset>
        <legend>Thông tin user</legend>
        <table>
            <tr>
                <td>Tên user:</td>
                <td>${user.getName()}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${user.getEmail()}</td>
            </tr>
            <tr>
                <td>Tỉnh:</td>
                <td>${user.getCountry()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Xóa"></td>
                <td><a href="/user">Không</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
