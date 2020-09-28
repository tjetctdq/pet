
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册主人信息界面</title>
</head>
<body>

    <form action="regManager.jsp" method="post">
        <%--id自增张，所以可以不需要id--%>
        <input type="text" name="name" placeholder="请输入姓名"><br>
        <input type="password" name="password" placeholder="请输入密码"><br>
        <input type="text" name="money" placeholder="请输入元宝数量"><br>
        <input type="submit" value="注册">
    </form>
</body>
</html>
