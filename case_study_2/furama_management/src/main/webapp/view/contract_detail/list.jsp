<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 03/09/2022
  Time: 4:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý hợp đồng chi tiết</title>

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
<h3 style="color: #6a1a21;text-align: center">Hợp đồng chi tiết chi tiết</h3><br><br>

<a style="margin-left: 20px" href="/contractdetail?action=add">
    <button class="btn btn-primary">+</button>
</a>

<table style="margin-top: 10px" id="tableContractDetail" class="table table-striped container-fluid">
    <thead>
    <tr style="background: aquamarine">
        <th>STT</th>
        <th>Mã hợp đồng</th>
        <th>Mã dịch vụ đi kèm</th>
        <th>Số lượng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach varStatus="status" var="contractDetail" items="${contractDetailList}">
        <tr>
            <td>${status.count}</td>
            <td>${contractDetail.contractId}</td>
            <td>${contractDetail.attachFacilityId}</td>
            <td>${contractDetail.quantity}</td>
        </tr>
    </c:forEach>


    </tbody>
</table>

<div class="modal" style="margin-top: 10%" id="orderAttachFacility" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div action="/customer">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderAttachFacilityLabel" style="color: #4267b2">Thông Tin dịch vụ đã
                        dùng: <span
                                style="color: rebeccapurple" id="nameAttachFacility"></span></h5>
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
        $('#tableContractDetail').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</html>
