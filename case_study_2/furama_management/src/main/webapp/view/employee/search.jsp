<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 03/09/2022
  Time: 10:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tìm Kiếm Nhân Viên</title>

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
<a href="view/home.jsp" style="color: #0d6efd;margin-top: 40px;font-size: 30px"><span class="bi bi-house-door" style="font-size: 30px; color: #4267b2;"> Back To Home</span></a><br><br><br>

<h3 style="color: #6a1a21;text-align: center">Tìm kiếm nhân viên</h3>

<form action="/employee" method="get">
    <input hidden type="text" name="action" value="search">
    <input type="text" name="nameSearch" value="${nameSearch}" placeholder="nhập tên khách hàng">
    <input type="text" name="addressSearch" value="${addressSearch}" placeholder="nhập địa chỉ">
    <input type="text" name="phoneNumberSearch" value="${phoneNumberSearch}" placeholder="nhập địa chỉ">
    <button type="submit">Search</button>
</form>

<p><a href="/employee?action=add">
    <button type="button" style="background: #0dcaf0;margin-left: 5px">Thêm mới</button>
</a></p>

<div style="text-align: center">
    <table id="tableEmployee" class="table table-striped">
        <thead>
        <tr style="background: aquamarine">
            <th>STT</th>
            <th>Tên nhân viên</th>
            <th>Ngày sinh</th>
            <th>Số điện thoại</th>
            <th>Chức vụ</th>
            <th>Bộ phận</th>
            <th>Trình độ</th>
            <th>Địa chỉ</th>
            <th>Cập nhập</th>
            <th>Xóa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="employee" items="${employeeList}">
            <tr>
                <td>${status.count}</td>
                <td><a href="#">${employee.getName()}</a></td>
                <td>${employee.getDateOfBirth()}</td>
                <td>${employee.getPhoneNumber()}</td>

                <c:forEach var="position" items="${positionList}">
                    <c:if test="${position.getId()==employee.getPositionId()}">
                        <td>${position.getName()}</td>
                    </c:if>
                </c:forEach>

                <c:forEach var="division" items="${divisionList}">
                    <c:if test="${division.getId()==employee.getDivisionId()}">
                        <td>${division.getName()}</td>
                    </c:if>
                </c:forEach>

                <c:forEach var="educationDegree" items="${educationDegreeList}">
                    <c:if test="${educationDegree.getId()==employee.getEducationDegreeId()}">
                        <td>${educationDegree.getName()}</td>
                    </c:if>
                </c:forEach>

                <td><span>${employee.getAddress()}</span></td>

                <td>
                    <a href="/employee?action=update&id=${employee.getId()}">
                        <button type="button" class="btn btn-primary">Update</button>
                    </a>
                </td>
                <td>
                    <button onclick="infoDelete('${employee.getId()}','${employee.getName()}')" type="button"
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
        <form action="/employee">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Cơ Sở</h5>
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

<%--<div class="modal" style="margin-top: 10%" id="infoCustomer" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div action="/customer">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title" id="infoCustomerLabel" style="color: #4267b2">Thông Tin Khách Hàng : <span--%>
<%--                            style="color: rebeccapurple" id="nameCustomer"></span></h5>--%>
<%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <table border="1" class="table table-striped">--%>
<%--                        <tr>--%>
<%--                            <td>Giới tính:</td>--%>
<%--                            <td><span id="genderCustomer"></span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Ngày sinh:</td>--%>
<%--                            <td><span id="dateOfBirthCustomer"></span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Số CMND:</td>--%>
<%--                            <td><span id="idCardCustomer"></span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Số điện thoại:</td>--%>
<%--                            <td><span id="phoneNumberCustomer"></span></td>--%>
<%--                        </tr>--%>

<%--                        <tr>--%>
<%--                            <td>Loại khách hàng:</td>--%>
<%--                            <td><span id="customerType"></span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>

<%--                            <td>Email:</td>--%>
<%--                            <td><span id="emailCustomer"></span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Địa chỉ:</td>--%>
<%--                            <td><span id="addressCustomer"></span></td>--%>
<%--                        </tr>--%>
<%--                    </table>--%>

<%--                </div>--%>
<%--                &lt;%&ndash;                <div class="modal-footer">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><a href="/view/">Close</a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </button>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--            </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
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
    $(document).ready(function (){
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</html>

