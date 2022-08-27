<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 25/08/2022
  Time: 8:34 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Xóa sản phẩm</title>
</head>
<body>
<h3>Xóa sản phẩm</h3>
<p>
    <a href="/product">Về trang quản lý sản phẩm</a>
</p>
<form method="post">
    <p>Bạn có chắc muốn xóa không ?</p>
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Mã sản phẩm:</td>
                <td>${product.getId()}</td>
            </tr>
            <tr>
                <td>Tên sản phẩm:</td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Giá tiền:</td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td>${product.getOptions()}</td>
            </tr>
            <tr>
                <td>Hãng sản xuất:</td>
                <td>${product.getVendor()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Xóa"></td>
                <td><a href="/product">Không</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
</body>
</html>
