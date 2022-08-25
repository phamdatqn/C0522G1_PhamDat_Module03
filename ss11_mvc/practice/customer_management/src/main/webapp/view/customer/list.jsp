<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 25/08/2022
  Time: 10:03 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Danh sách khách hàng hiện có: </p>
<table border="1">
    <tr>
        <th>STT</th>
        <th>Mã khách hàng</th>
        <th>Họ và tên</th>
        <th>Email</th>
        <th>Địa chỉ</th>
    </tr>
    <c:forEach varStatus="status" var="customer" items="${customerList}">
        <tr>
            <td>${status.count}</td>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
        </tr>
    </c:forEach>
</table>
<a href="/customer?action=add">Thêm mới khách hàng</a>
</body>
</html>
