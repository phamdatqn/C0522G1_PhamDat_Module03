<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 24/08/2022
  Time: 9:38 SA
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<c:out value="${search}"></c:out>
<c:out value="${result}"></c:out>
<c:out value="${noResult}"></c:out>
</body>
</html>