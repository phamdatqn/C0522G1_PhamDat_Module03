<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 23/08/2022
  Time: 3:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form method="post" action="/ProductServlet">
    <span>Product Description</span><br>
    <input name="productDescription" type="text"><br><br>

    <span>List Price</span><br>
    <input name="listPrice"><br><br>

    <span>Discount Percent</span><br><br>
    <input name="discountPercen">
    <button type="submit">Tính</button>
  </form>
  </body>
</html>
