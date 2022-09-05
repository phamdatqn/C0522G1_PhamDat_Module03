<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 03/09/2022
  Time: 5:54 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Danh sách dịch vụ đi kèm</title>

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
<h3 style="color: #6a1a21;text-align: center">Danh sánh dịch vụ đi kèm</h3>

<p><a href="/facility?action=addAttachFacility">
    <button type="button" style="background: #0dcaf0;margin-left: 5px">Thêm mới</button>
</a></p>

<div style="text-align: center">
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


                </div>
                <%--                <div class="modal-footer">--%>
                <%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><a href="/view/">Close</a>--%>
                <%--                    </button>--%>
                <%--                </div>--%>
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
        $('#tableContract').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>

