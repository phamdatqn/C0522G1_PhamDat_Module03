<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 25/08/2022
  Time: 3:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new products</h1>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<a href="/product">Back to Product list</a>
</p>
<form action="/product?action=add" method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Product Code:</td>
                <td>
                    <input type="text" name="productCode" id="productCode">
                </td>
            </tr>
            <tr>
                <td>Product Name:</td>
                <td>
                    <input type="text" name="productName" id="productName">
                </td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>
                    <input type="text" name="price" id="price">
                </td>
            </tr>
            <tr>
                <td>Options:</td>
                <td>
                    <input type="text" name="options" id="manufacture">
                </td>
            </tr>
            <tr>
                <td>Vendor:</td>
                <td>
                    <input type="text" name="vendor" id="productInfo">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Create Product">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
