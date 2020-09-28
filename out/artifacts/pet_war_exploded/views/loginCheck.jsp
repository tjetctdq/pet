<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: tivon
  Date: 2020/5/12
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //设置编码方式
    request.setCharacterEncoding("UTF-8");
    //获取注册界面传递的数据
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    //进行数据库链接
    //加载驱动类   注意 如果mysql是5.7一下的版本  可以删除cj
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    //通过DriverManager获取链接对象
    Connection conn =
            DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1:3306/pet?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC",
                    "root",
                    "root"
            );
    //通过链接对象获取数据操作对象
    Statement stmt = conn.createStatement();
    //创建一个sql语句
    String sql="select * from master where name='"+name+"' and password='"+password+"'";
    //执行sql语句执行查询用query
    ResultSet rs = stmt.executeQuery(sql);
    //判断i
    if(rs.next()){
        out.println("登录成功!");
    }else{
        out.println("登录失败!");
    }
    //关闭资源
    stmt.close();
    conn.close();
%>
</body>
</html>
