<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //接收请求信息
    String message = (String)request.getAttribute("message");
    if(message !=null){
        out.println(message+"<br>");
    }
%>
<form action="loginServlet" method="post">
    <input type="text" name="name" placeholder="请输入姓名"><br>
    <input type="text" name="password" placeholder="请输入密码"><br>
    <input type="submit" value="登录">
</form>
</body>
</html>
