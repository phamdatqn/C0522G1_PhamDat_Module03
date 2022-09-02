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
    <title>Update nhân viên</title>
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
<h3>Cập nhập nhân viên</h3>
<p>
    <a href="/employee">Về trang quản lý nhân viên</a>
</p>
<form method="post">
    <fieldset>
        <legend style="color: crimson">Thông tin nhân viên</legend>
        <table>
            <tr>
            <tr>
                <td>Họ và tên:</td>
                <td><input name="name" value="${employee.getName()}" ></td>
            </tr>
            <tr>
                <td>Ngày sinh:</td>
                <td><input type="date" name="dateOfBirth" value="${employee.getDateOfBirth()}" ></td>
            </tr>
            <tr>
                <td>Số CMND:</td>
                <td><input name="idCard" value="${employee.getIdCard()}" ></td>
            </tr>
            <tr>
                <td>Lương:</td>
                <td><input name="salary" value="${employee.getSalary()}" ></td>
            </tr>
            <tr>
                <td>Số điện thoại:</td>
                <td><input name="phoneNumber" value="${employee.getPhoneNumber()}" ></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input name="email" value="${employee.getEmail()}" ></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input name="address" value="${employee.getAddress()}" ></td>
            </tr>
            <tr>
                <td>Chức vụ:</td>
                <td> <select id="position" name="positionId">
                    <c:forEach var="position" items="${positionList}">
                        <option value="${position.getId()}">${position.getName()}</option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td>Chức vụ:</td>
                <td> <select id="division" name="divisionId">
                    <c:forEach var="division" items="${divisionList}">
                        <option value="${division.getId()}">${division.getName()}</option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td>Chức vụ:</td>
                <td> <select id="educationDegree" name="educationDegreeId">
                    <c:forEach var="educationDegree" items="${educationDegreeList}">
                        <option value="${educationDegree.getId()}">${educationDegree.getName()}</option>
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
