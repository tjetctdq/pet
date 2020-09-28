<%--
  Created by IntelliJ IDEA.
  User: tivon
  Date: 2020/5/19
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示所有主人信息</title>
</head>
<body>
<%@include file="header.jsp"%>
<%=request.getAttribute("info")%>
</body>
</html>
