<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 03/09/2022
  Time: 7:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Mới Hợp Đồng Chi Tiết</title>
</head>
<body>
<h3>Thêm mới hợp đồng chi tiết</h3>
<p>
    <a href="/contractdetail">Về trang quản lý hợp đồng chi tiết</a>
</p>

<form action="/contractdetail?action=add" method="post">
    <fieldset>
        <legend style="color: crimson">Thông tin hợp đồng</legend>
        <table>
            <tr>
                <td>Mã hợp đồng:</td>
                <td> <select id="contractId" name="contractId">
                    <c:forEach var="contract" items="${contractList}">
                        <option value="${contract.getId()}">Mã: ${contract.getId()} </option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td>Mã dịch vụ đi kèm:</td>
                <td> <select id="attachFacilityId" name="attachFacilityId">
                    <c:forEach var="attachFacility" items="${attachFacilityList}">
                        <option value="${attachFacility.getId()}">Mã:${attachFacility.getId()} - ${attachFacility.getName()} </option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td>Số lượng</td>
                <td><input name="quantity" type="text"></td>
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
