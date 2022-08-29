<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 26/08/2022
  Time: 9:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            color: blue;
            text-decoration: none;
        }

        a:hover {
            color: red;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<form style="margin-top: 50px">
    <table>
        <tr>
            <th colspan="2">Nhập tên tỉnh cần tìm:</th>
        </tr>
        <tr>
            <td><span id="messenger"></span></td>
        </tr>
    </table>
    <table>
        <tr>
            <td><input id="txtCountry" name="txtCountry"></td>
            <td><input name="action" type="submit" value="search" onclick="thongBao()"></td>

        </tr>
    </table>
    <table>
        <tr>
            <th>Sắp xếp theo tên:</th>
        </tr>
        <tr>
            <td>
                <button name="action" type="submit" value="sortIncrease">Sắp xếp tên tăng dần</button>
            </td>
        </tr>
    </table>

</form>

<span style="text-align: center">Danh sách User</span>
<br>

<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>Họ và tên</th>
        <th>Email</th>
        <th>Tỉnh</th>
        <th>Xóa</th>
        <th>Cập nhập</th>
    </tr>
    <c:forEach varStatus="status" var="user" items="${users}">
        <tr>
            <td>${status.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td>
                <a href="/user?action=update&id=${user.getId()}">update</a>
            </td>
            <td>
                <!-- Button trigger modal -->
                <button onclick="infoDelete('${user.getId()}','${user.getName()}')" type="button"
                        class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>

                <!-- Modal -->

            </td>
        </tr>
    </c:forEach>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/user">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa user</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden type="text" name="idDelete" id="idDelete">
                    <input hidden type="text" name="action" value="delete">
                    <span>Bạn có chắc đang muốn xóa</span>
                    <span style="color: red" id="nameDelete"></span> ?
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Xóa</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><a href="/user">Hủy bỏ</a>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<p>Insert bằng PraperaStament</p>
<form action="view/create.jsp">
    <button name="add">Thêm mới</button>
</form>

<p>Insert bằng CallableStament</p>
<form action="view/insert.jsp">
    <button name="add">Thêm mới</button>
</form>
</div>
</body>
<script>
    function sortIncrease(name, value) {
        document.getElementById("idSortIncrease").value = name;
        document.getElementsByName("nameSortIncrease").value = value;
    }

    function thongBao() {
        let searchName = document.getElementById("txtCountry").value;
        document.getElementById("messenger").innerHTML = "Bạn vừa tìm " + searchName;
    }

    function infoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;

    }
</script>
</html>
