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
    <title>Quản lý hợp đồng</title>

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

<h3 style="color: #6a1a21;text-align: center">Quản Lý hợp đồng</h3>

<form action="/contract" method="get">
    <input hidden type="text" name="action" value="search">
    <input type="text" name="nameSearch" value="${nameSearch}" placeholder="nhập tên khách hàng">
    <input type="text" name="addressSearch" value="${addressSearch}" placeholder="nhập địa chỉ">
    <button type="submit">Search</button>
</form>

<p><a href="/contract?action=add">
    <button type="button" style="background: #0dcaf0;margin-left: 5px">Thêm mới</button>
</a></p>

<div style="text-align: center">
    <table id="tableContract" class="table table-striped">
        <thead>
        <tr style="background: aquamarine">
            <th>STT</th>
            <th>Dịch vụ</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Tiền đặt cọc</th>
            <th>Tổng tiền</th>
            <th></th>
            <th>các dịch vụ đi kèm</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="contract" items="${contractList}">
            <tr>
                <td>${status.count}</td>

                <c:forEach var="facility" items="${facilityList}">
                    <c:if test="${facility.id==contract.facilityId}">
                        <td><a  href="#" onclick="showAttachFacility('${facility.name}','KH${status.count}','NV${status.count}','${contract.getStartDate()}',
                                '${contract.getEndDate()}','${contract.getDeposit()}')" data-bs-toggle="modal"
                               data-bs-target="#showAttachFacility">
                                ${facility.name}</a></td>
                    </c:if>
                </c:forEach>

                <td hidden><c:forEach var="customer" items="${customerList}">
                    <c:if test="${customer.id==contract.customerId}">
                       <span id="KH${status.count}">${customer.name}</span>
                    </c:if>
                </c:forEach></td>

                <td hidden><c:forEach var="employee" items="${employeeList}">
                    <c:if test="${employee.id==contract.employeeId}">
                       <span id="NV${status.count}">${employee.name}</span>
                    </c:if>
                </c:forEach></td>

                <td>${contract.getStartDate()}</td>
                <td>${contract.getEndDate()}</td>
                <td>${contract.getDeposit()}</td>
                <td></td>
                <td>
                    <button type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#addAttachFacility">+
                    </button>
                </td>
                <td>
                    <a href="/facility?action=addAttachFacility">
                        <button  type="button" class="btn btn-primary">Dánh sách dịch vụ đi kèm</button>
                    </a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="showAttachFacility" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title" id="showAttachFacilityModal">Thông tin chi tiết</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <table>
                   <tr>
                       <td>Tên dịch vụ:</td>
                       <td><span id="nameFacility"></span></td>
                   </tr>
                   <tr>
                       <td>Khách hàng:</td>
                       <td><span id="nameCustomer"></span></td>
                   </tr>
                   <tr>
                       <td>Nhân viên:</td>
                       <td><span id="nameEmployee"></span></td>
                   </tr>
                   <tr>
                       <td>Ngày bắt đầu:</td>
                       <td><span id="startDate"></span></td>
                   </tr>
                   <tr>
                       <td>Ngày kết thúc:</td>
                       <td><span id="endDate"></span></td>
                   </tr>
                   <tr>
                       <td>Tiền đặt cọc:</td>
                       <td><span id="deposit"></span></td>
                   </tr>
               </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="addAttachFacility" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title" id="exampleModalLabel">Order dịch vụ đi kèm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-light table-striped table-bordered">
                    <tr>
                        <td>Ngày bắt đầu:</td>
                        <td><input type="date" name="startDate"></td>
                    </tr>
                    <tr>
                        <td>Ngày kết thúc:</td>
                        <td><input type="date" name="endDate"></td>
                    </tr>
                    <tr>
                        <td>Tiền gửi:</td>
                        <td><input type="text" name="cost"></td>
                    </tr>
                    <tr>
                        <td>Khách hàng thuê dịch vụ:</td>
                        <td>
                            <select name="customerName">
                                <option>Chọn khách hàng</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Dịch vụ:</td>
                        <td>
                            <select name="name">
                                <option>Chọn dịch vụ</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Dịch vụ đính kèm:</td>
                        <td>
                            <a href="#">
                                <button class="btn btn-primary">+</button>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a><button class="btn btn-danger">HỦY BỎ</button></a></td>
                        <td><a><button CLASS="btn btn-warning">TẠO HỢP ĐỒNG</button></a></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="attachFacilityList" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title" id="attachFacilityListModal">Thông tin chi tiết</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table id="tableAttachFacility" class="table table-striped">

                    <tr style="background: aquamarine">
                        <th>STT</th>
                        <th>Tên dịch vụ</th>
                        <th>Giá thuê</th>
                        <th>Unit</th>
                        <th>Tình trạng</th>
                    </tr>
                    <c:forEach varStatus="status" var="attachFacility" items="${attachFacilityList}">
                        <tr>
                            <td>${status.count}</td>
                            <td>${attachFacility.name}</td>
                            <td>${attachFacility.cost}</td>
                            <td>${attachFacility.unit}</td>
                            <td>${attachFacility.status}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


</body>
<script>

    function showAttachFacility(nameFacility, nameCustomer, nameEmployee, startDate, endDate,deposit) {
        document.getElementById("nameFacility").innerText = nameFacility;
        document.getElementById("nameCustomer").innerText = document.getElementById(nameCustomer).textContent;
        document.getElementById("nameEmployee").innerText = document.getElementById(nameEmployee).textContent;
        document.getElementById("startDate").innerText = startDate;
        document.getElementById("endDate").innerText = endDate;
        document.getElementById("deposit").innerText = deposit;

    }

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
        document.getElementById("customerType").innerText = document.getElementById(customerType).value;
        document.getElementById("emailCustomer").innerHTML = email;
        document.getElementById("addressCustomer").innerHTML = address;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableContract').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</html>
