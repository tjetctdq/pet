<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改主人信息界面</title>
    <style>
        input[name="id"]{
            border: none;
            outline: none;
        }
    </style>
</head>
<%--根据id查询当前要修改的信息--%>
<%
    Integer id = Integer.valueOf(request.getParameter("id"));
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
    String sql="select * from master where id ="+id;
    //根据id查询 所有如果要i有结果 有且只有一个 不需要用while循环  直接if判断就可以
    //执行sql语句
    ResultSet rs = stmt.executeQuery(sql);
%>
<body>
    <%
        if(rs.next()){
    %>

    <form action="updateMaster.jsp" method="post">
        <%--不去显示id   type=hidden表示隐藏 不会在界面 --%>
        <input type="hidden"  name="sssid" value="嘻嘻嘻嘻">
        <%--显示id 不可被修改  readonly:只读  不能被修改--%>
        <input type="text" name="id"  value='<%=rs.getInt("id")%>' readonly><br>
        <input type="text" name="name"  value='<%=rs.getString("name")%>' placeholder="请输入姓名"><br>
        <input type="password" name="password"  value='<%=rs.getString("password")%>' placeholder="请输入密码"><br>
        <input type="text" name="money"  value='<%=rs.getInt("money")%>' placeholder="请输入元宝数量"><br>
        <input type="submit" value="修改">
    </form>
    <%
        }
    %>
</body>
</html>
