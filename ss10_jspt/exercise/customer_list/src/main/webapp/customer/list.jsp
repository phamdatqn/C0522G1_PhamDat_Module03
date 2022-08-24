<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 24/08/2022
  Time: 2:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h3 style="text-align: center"> Danh sách khách hàng:</h3>
<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>Mã khách hàng</th>
        <th>Tên khách hàng</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Hình ảnh</th>
    </tr>
    <c:forEach varStatus="status" var="customer" items="${customerList}">
        <tr>
            <td>${status.count}</td>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getBirthDay()}</td>
            <td>${customer.getAddress()}</td>
            <td><img style="width: 50px;height: 50px" src="${customer.getImg()}"></td>
        </tr>
    </c:forEach>
</table>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</html>
