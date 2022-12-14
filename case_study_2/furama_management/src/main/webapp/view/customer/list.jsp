<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 30/08/2022
  Time: 2:51 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý khách hàng</title>

    <link rel="stylesheet" href="webapp/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="webapp/datatables/css/dataTables.bootstrap4.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            text-decoration: underline;
            color: #0b5ed7;
        }
    </style>
</head>
<body>
<%@include file="/header.jsp" %>


<h3 style="color: #6a1a21;text-align: center">Quản Lý Khách Hàng</h3>

<form action="/customer?action=search">
    <input hidden type="text" name="action" value="search">
    <input type="text" name="nameSearch" value="${nameSearch}" placeholder="nhập tên khách hàng">
    <input type="text" name="addressSearch" value="${addressSearch}" placeholder="nhập địa chỉ">
    <input type="text" name="phoneNumberSearch" value="${phoneNumberSearch}" placeholder="nhập số điện thoại">

    <button type="submit">Search</button>
</form>

<p><a href="/customer?action=add">
    <button type="button" style="background: #0dcaf0;margin-left: 5px">Thêm mới</button>
</a></p>

<div class="container-fluid" style="text-align: center">
    <table id="tableCustomer" class="table table-striped">
        <thead>
        <tr style="background: aquamarine">
            <th>STT</th>
            <th>Họ và tên</th>
            <th>Giới tính</th>
            <th>Ngày sinh</th>
            <th>Số điện thoại</th>
            <th>Địa chỉ</th>
            <th>Loại khách hàng</th>
            <th>Cập nhập</th>
            <th>Xóa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="customers" items="${customersList}">
            <tr>
                <td>${status.count}</td>
                <td><a
                        data-bs-toggle="modal" data-bs-target="#infoCustomer"
                        onclick="infoCustomer('${customers.getName()}','${customers.getGender()}','${customers.getDateOfBirth()}','${customers.getIdCard()}',
                                '${customers.getPhoneNumber()}','${status.count}','${customers.getEmail()}','${customers.getAddress()}')"
                        href="#">${customers.getName()}</a></td>
                <td>
                    <c:if test="${customers.getGender()}">
                        <c:out value="Nam"></c:out>
                    </c:if>
                    <c:if test="${!customers.getGender()}">
                        <c:out value="Nữ"></c:out>
                    </c:if>
                </td>
                <td>${customers.getDateOfBirth()}</td>
                <td>${customers.getPhoneNumber()}</td>
                <td>${customers.getAddress()}</td>

                <c:forEach var="customerTypeList" items="${customerTypeList}">
                    <c:if test="${customerTypeList.id==customers.customerTypeId}">
                           <td> <span id="${status.count}">${customerTypeList.name}</span></td>
                    </c:if>
                </c:forEach>
                <td>
                    <a href="/customer?action=update&id=${customers.getId()}">
                        <button type="button" class="btn btn-primary">Update</button>
                    </a>
                </td>
                <td>
                    <button onclick="infoDelete('${customers.getId()}','${customers.getName()}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Xóa
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Khách Hàng</h5>
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
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal" style="margin-top: 10%" id="infoCustomer" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div action="/customer">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="infoCustomerLabel" style="color: #4267b2">Thông Tin Khách Hàng : <span
                            style="color: rebeccapurple" id="nameCustomer"></span></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table border="1" class="table table-striped">
                        <tr>
                            <td>Giới tính:</td>
                            <td><span id="genderCustomer"></span></td>
                        </tr>
                        <tr>
                            <td>Ngày sinh:</td>
                            <td><span id="dateOfBirthCustomer"></span></td>
                        </tr>
                        <tr>
                            <td>Số CMND:</td>
                            <td><span id="idCardCustomer"></span></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td><span id="phoneNumberCustomer"></span></td>
                        </tr>

                        <tr>
                            <td>Loại khách hàng:</td>
                            <td><span id="customerType"></span></td>
                        </tr>
                        <tr>

                            <td>Email:</td>
                            <td><span id="emailCustomer"></span></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ:</td>
                            <td><span id="addressCustomer"></span></td>
                        </tr>
                    </table>

                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function infoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }

    function infoCustomer(name, gender, dateOfBirth, idCard, phoneNumber, customerType, email, address) {
        document.getElementById("nameCustomer").innerText = name;
        let gt;
        if (gender == "true") {
            gt = "Nam";
        } else {
            gt = "Nữ";
        }
        document.getElementById("genderCustomer").innerHTML = gt;
        document.getElementById("dateOfBirthCustomer").innerHTML = dateOfBirth;
        document.getElementById("idCardCustomer").innerHTML = idCard;
        document.getElementById("phoneNumberCustomer").innerHTML = phoneNumber;
        document.getElementById("customerType").innerHTML = document.getElementById(customerType).textContent;
        document.getElementById("emailCustomer").innerHTML = email;
        document.getElementById("addressCustomer").innerHTML = address;
    }

</script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function (){
        $('#tableCub stomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</html>
