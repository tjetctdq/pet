<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除逻辑界面</title>
</head>
<body>
<%--利用请求对象获取id--%>
<%
    Integer id = Integer.valueOf(request.getParameter("id"));
    out.println("输出接收的数据是:"+id);
    //链接数据库 执行删除sql语句
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
    //创建sql语句
    String sql="delete from master where id="+id;
    //执行sql语句
    int i = stmt.executeUpdate(sql);
    if(i>0){
        out.println("删除成功!");
    }else{
        out.println("主人信息不存在，删除失败!");
    }
%>
<a href="index.jsp">返回首页</a>
</body>
</html>
