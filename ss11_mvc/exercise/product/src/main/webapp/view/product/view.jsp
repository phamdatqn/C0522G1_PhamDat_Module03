<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 25/08/2022
  Time: 9:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view</title>
</head>
<body>
<h3>Thông tin chi tiết sản phẩm</h3>
<p>
    <a href="/product">Về trang quản lý sản phẩm</a>
</p>
<fieldset>
    <legend>Thông tin sản phẩm</legend>
    <table>
        <tr>
            <td>Mã sản phẩm:</td>
            <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
        </tr>
        <tr>
            <td>Tên sản phẩm:</td>
            <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
        </tr>
        <tr>
            <td>Giá tiền:</td>
            <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
        </tr>
        <tr>
            <td>Mô tả:</td>
            <td><input type="text" name="options" id="describe" value="${product.getOptions()}"></td>
        </tr>
        <tr>
            <td>Hãng sản xuất:</td>
            <td><input type="text" name="vendor" id="producer" value="${product.getVendor()}"></td>
        </tr>
    </table>
</fieldset>
</body>
</html>
