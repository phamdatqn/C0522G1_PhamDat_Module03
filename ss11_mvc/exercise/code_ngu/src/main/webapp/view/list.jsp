<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 26/08/2022
  Time: 2:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form >
    <input name="name">
    <input name="action" type="submit" value="search">tìm kiếm</input>
</form>
<h1 style="text-align: center">Danh sách sản phẩm hiện có:</h1>
<table class="table table-striped" border="1">
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả thêm</th>
        <th>Nhà sản xuất</th>
        <th>Xóa</th>
        <th>Sửa</th>
    </tr>
    <c:forEach varStatus="status" var="product" items="${productList}">
        <tr>
            <td>${status.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()} VNĐ</td>
            <td>${product.getOptions()}</td>
            <td>${product.getVendor()}</td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
            <td><a href="/product?action=update&id=${product.getId()}">update</a></td>
        </tr>
    </c:forEach>
</table>
<form action="view/product/create.jsp">
    <td><button name="add" >Thêm mới</button></td>
</form>

</body>
</html>
