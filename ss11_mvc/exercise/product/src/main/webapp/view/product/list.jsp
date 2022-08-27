<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 25/08/2022
  Time: 3:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<form>
    <input name="name">
    <input name="action" type="submit" value="search">
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
    <jsp:useBean id="productList" scope="request" type="java.util.List"/>
    <c:forEach varStatus="status" var="product" items="${productList}">
        <tr>
            <td>${status.count}</td>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()} VNĐ</td>
            <td>${product.getOptions()}</td>
            <td>${product.getVendor()}</td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
            <td><a href="/product?action=update&id=${product.getId()}">update</a></td>
        </tr>
    </c:forEach>
</table>
<form action="view/product/create.jsp">
    <td>
        <button name="add">Thêm mới</button>
    </td>
</form>

</body>
</html>
