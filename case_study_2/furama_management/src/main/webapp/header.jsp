<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 05/09/2022
  Time: 4:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="row container-fluid">
    <img src="/view/img/header.png">
    <nav class="navbar navbar-expand-lg navbar-light " style="background: #0c63e4">
        <a class="navbar-brand chu_menu" href="https://furamavietnam.com/vi/the-resort/" style="color: white">introduction</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle chu_menu" href="#" id="navbarEmployee" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                        Employee
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarEmployee">
                        <li><a class="dropdown-item" href="/employee?action=add">Thêm mới nhân viên</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/employee">Quản lý nhân viên</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle chu_menu" href="#" id="navbarCustomer" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                        Customer
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarCustomer">
                        <li><a class="dropdown-item" href="/customer?action=add">Thêm mới khách hàng</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/customer">Quản lý khách hàng</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle chu_menu" href="#" id="navFacility" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                        Service
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarFacility">
                        <li><a class="dropdown-item" href="/facility?action=add">Thêm mới cơ sở</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/facility">Quản lý Cơ Sở</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle chu_menu" href="#" id="navbarContract" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                        Contract
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarContract">
                        <li><a class="dropdown-item" href="/contract?action=add">Thêm mới hợp đồng</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/contract">Quản lý hợp đồng</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/contractdetail">Quản lý hợp đồng chi tiết</a></li>
                    </ul>
                </li>
            </ul>
<%--            <form class="d-flex align-items-center m-0">--%>
<%--                <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">--%>
<%--                <button class="btn btn-outline-success chu_menu" type="submit">Search</button>--%>
<%--            </form>--%>
        </div>
    </nav>
</div>

</body>
</html>
