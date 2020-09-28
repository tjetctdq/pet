<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: tivon
  Date: 2020/5/12
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改主人信息逻辑界面</title>
</head>
<body>
<%
    //设置编码方式
    request.setCharacterEncoding("UTF-8");
    //接收id  id是一个唯一标识 作为条件
    Integer id = Integer.valueOf(request.getParameter("id"));
    //获取注册界面传递的数据
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    //money是金钱 转化成数  ***注意 如果输入的是字符串abc  这里会报错
    Integer money = Integer.valueOf(request.getParameter("money"));
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
    String sql="update master set name='"+name+"' ,password='"+password+"',money="+money+" where id="+id;
    //执行sql语句 update用于增删改
    int i = stmt.executeUpdate(sql);
    //判断i
    if(i>0){
        out.println("修改数据成功!");
    }else{
        out.println("对不起，修改数据失败!");
    }
    //关闭资源
    stmt.close();
    conn.close();
%><br>
<a href="index.jsp">返回首页</a>
</body>
</html>
