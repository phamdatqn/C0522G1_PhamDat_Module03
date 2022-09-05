<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 03/09/2022
  Time: 7:22 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Mới Hợp Đồng Chi Tiết</title>
</head>
<body>
<h3>Thêm mới hợp đồng</h3>
<p>
    <a href="/contract">Về trang quản lý hợp đồng</a>
</p>
<c:if test="${mess!=null}">
    <p style="color: red">${mess}</p>
</c:if>
<form action="/facility?action=add" method="post">
    <fieldset>
        <legend style="color: crimson">Thông tin hợp đồng</legend>
        <table>
            <tr>
                <td>Ngày bắt đầu:</td>
                <td><input type="date" name="startDate" ></td>
            </tr>
            <tr>
                <td>Ngày kết thúc:</td>
                <td><input type="date" name="endDate"></td>
            </tr>
            <tr><td>Đặt cọc:</td>
                <td><input name="deposit"></td>
            </tr>
            <tr>
                <td>Tên nhân viên:</td>
                <td>
                    <select id="employeeId" name="employeeId">
                        <c:forEach var="employee" items="${employeeList}">
                            <option value="${employee.getId()}">ID: ${employee.getId()} , Tên: ${employee.getName()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Tên Khách Hàng:</td>
                <td>
                    <select id="customerId" name="customerId">
                        <c:forEach var="customer" items="${customerList}">
                            <option value="${customer.getId()}">ID:${customer.getId()} , Tên: ${customer.getName()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Tên cơ sở:</td>
                <td>
                    <select id="facilityId" name="facilityId">
                        <c:forEach var="facility" items="${facilityList}">
                            <option value="${facility.getId()}">${facility.getName()}</option>
                        </c:forEach>
                    </select>
                </td>
            <tr>
                <td></td>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

