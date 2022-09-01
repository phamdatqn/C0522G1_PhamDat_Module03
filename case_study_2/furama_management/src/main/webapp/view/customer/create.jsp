<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 31/08/2022
  Time: 11:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tạo khách hàng mới</title>
</head>
<body>
<h3>Thêm mới khách hàng</h3>
<p>
    <a href="/customer">Về trang quản lý khách hàng</a>
</p>

<form action="/customer?action=create" method="post">
    <fieldset>
        <legend style="color: crimson">Thông tin khách hàng</legend>
        <table>
            <tr>
                <td>Tên khách hàng:</td>
                <td><input name="name" ></td>
            </tr>
            <tr>
                <td>Giới tính:</td>
                <td><input name="gender" ></td>
            </tr>
            <tr>
                <td>Ngày sinh:</td>
                <td><input name="dateOfBirth" ></td>
            </tr>
            <tr>
                <td>Số CMND:</td>
                <td><input name="idCard" ></td>
            </tr>
            <tr>
                <td>Số điện thoại:</td>
                <td><input name="phoneNumber" ></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input name="email" ></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input name="address" ></td>
            </tr>
            <tr>
                <td>Mã loại khách hàng:</td>
                <td><input name="customerTypeId" ></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
