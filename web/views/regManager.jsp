<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册逻辑界面</title>
</head>
<body>
    <%
        //设置编码方式
        request.setCharacterEncoding("UTF-8");
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
        //利用？类似于占位符进行占位
        String sql="insert into master (name,password,money) values (?,?,?)";
        //创建预编译sql语句操作对象  需要一个sql作为参数
        PreparedStatement pstmt = conn.prepareStatement(sql);
        //要给？进行赋值  第一个参数：给第几个问号赋值  第二个参数就是所赋的值
        pstmt.setString(1,name);
        pstmt.setString(2,password);
        pstmt.setInt(3,money);
        //执行sql语句
        int i = pstmt.executeUpdate();
        //判断i
        if(i>0){
            out.println("添加数据成功!");
        }else{
            out.println("对不起，插入数据失败!");
        }
        //关闭资源
        pstmt.close();
        conn.close();
    %>
</body>
</html>
