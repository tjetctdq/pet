<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>查询所有主人信息进行显示</title>
  </head>
  <body>
 <%
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
   String sql="select * from master";
  //执行sql  查询功能要使用query
   ResultSet rs = stmt.executeQuery(sql);
   //利用while循环遍历显示查询的所有结果
   while(rs.next()){//判断光标下一个是否有元素  有就返回真 光标下移
      //rs.getInt() rs.getDate() rs.getDouble() rs.getString()获取数据库指定类型的数据
     //rs.getInt():参数可以是下标 也可以指指定字段名称
      //直接打印输出到界面
     out.println(rs.getInt("id")+"--"+rs.getString("name")+"--"+rs.getString("password")+"--"+rs.getInt("money")
             +"<a href='showUpdateMaster.jsp?id="+rs.getInt("id")+"'>编辑</a>   "+
             "<a href='delMaster.jsp?id="+rs.getInt("id")+"'>删除</a>"
             +"<br>");
   }
   //关闭资源
   rs.close();
   stmt.close();
   conn.close();

 %>
  </body>
</html>
