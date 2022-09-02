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
    <title>Thêm mới cơ sở</title>
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
<h3>Thêm mới cơ sở</h3>
<p>
    <a href="/facility">Về trang quản lý cơ sở</a>
</p>
<form action="/facility?action=create" method="post">
    <fieldset>
        <legend style="color: crimson">Thông tin cơ sở</legend>
        <table>
            <tr>
                <td>Tên cơ sở:</td>
                <td><input name="name" ></td>
            </tr>
            <tr>
                <td>Diện tích:</td>
                <td><input name="area" ></td>
            </tr>
            <tr>
                <td>Phí thuê:</td>
                <td><input name="cost" ></td>
            </tr>
            <tr>
                <td>Số lượng người max:</td>
                <td><input name="maxPeople" ></td>
            </tr>
            <tr>
                <td>Kiểu thuê:</td>
                <td> <select id="rentType" name="rentTypeId">
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <option value="${rentType.getId()}">${rentType.getName()}</option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td>Loại cơ sở:</td>
                <td> <select id="facilityType" name="facilityTypeId">
                    <c:forEach var="facilityType" items="${facilityTypeList}">
                        <option value="${facilityType.getId()}">${facilityType.getName()}</option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td>Tiêu chuẩn phòng:</td>
                <td><input name="standardRoom" ></td>
            </tr>
            <tr>
                <td>Mô tả tiện nghi khác:</td>
                <td><input name="descriptionOtherConvenience"></td>
            </tr>
            <tr>
                <td>Diện tích hồ bơi:</td>
                <td><input name="poolArea" ></td>
            </tr>
            <tr>
                <td>Số tầng:</td>
                <td><input name="numberOfFloors" ></td>
            </tr>
            <tr>
                <td>Dịch vụ miễn phí:</td>
                <td><input name="facilityFree"></td>
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
