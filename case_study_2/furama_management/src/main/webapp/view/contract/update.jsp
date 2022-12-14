<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 31/08/2022
  Time: 8:03 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý khách hàng</title>
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
<h3>Cập nhập khách hàng</h3>
<p>
    <a href="customer">Về trang quản lý khách hàng</a>
</p>
<form method="post">
    <fieldset>
        <legend style="color: crimson">Thông tin khách hàng</legend>
        <table>
            <tr>
                <td>Tên khách hàng:</td>
                <td><input name="name" value="${customer.getName()}"></td>
            </tr>
            <tr>
                <td>Giới tính:</td>
                <td>
                        <input type="radio" value="true" name="gender" checked>Name
                        <input type="radio" value="false" name="gender">Nữ
                </td>
            </tr>
            <tr>
                <td>Ngày sinh:</td>
                <td><input type="date" name="dateOfBirth" value="${customer.getDateOfBirth()}"></td>
            </tr>
            <tr>
                <td>Số CMND:</td>
                <td><input name="idCard" value="${customer.getIdCard()}"></td>
            </tr>
            <tr>
                <td>Số điện thoại:</td>
                <td><input name="phoneNumber" value="${customer.getPhoneNumber()}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input name="email" value="${customer.getEmail()}"></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input name="address" value="${customer.getAddress()}"></td>
            </tr>
            <tr>
                <td>Loại khách hàng:</td>
                <td> <select id="customerType" name="customerType">
                    <c:forEach var="customerType" items="${customerTypeList}">
                        <option value="${customerType.getId()}">${customerType.getName()}</option>
                    </c:forEach>
                </select>
                </td>
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
