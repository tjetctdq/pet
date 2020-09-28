package com.chinasofti.pet.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用了LoginServlet中的doget方法");
        //利用响应对象 传输html内容
        //设置内容类型
        resp.setContentType("text/html;charset=UTF-8");
        //设置字符集
        resp.setCharacterEncoding("UTF-8");
        //获取输出流 输出到客户端
        PrintWriter out = resp.getWriter();
        out.println("<p style='color:red;'>大家好我是一段文字</p>");
        out.println("嘻嘻嘻嘻嘻");
        //关闭输出流
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用了LoginServlet中的dopost方法");
        //设置编码方式
        req.setCharacterEncoding("UTF-8");
        //获取用户输入的账号和密码
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        //进行数据库链接
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        //加载驱动类 在java代码中需要进行异常处理
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            //通过DriverManager获取链接对象
             conn =
        DriverManager.getConnection(
         "jdbc:mysql://127.0.0.1:3306/pet?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC",
                            "root",
                            "root"
                    );
            //准备预编译sql语句
            String sql="select * from master where name=? and password=?";
            //通过链接对象获取数据库操作对象
             pstmt = conn.prepareStatement(sql);
            //给？进行赋值
            pstmt.setString(1,name);
            pstmt.setString(2,password);
            //执行sql语句
             rs = pstmt.executeQuery();
            //一般来讲 账号密码不重复 所以有一个结果 所以用if语句判断就可以
            if(rs.next()){//表示登录验证成功
                //通过请求获取session对象
                HttpSession session = req.getSession();
                //将用户名存储在session中
                session.setAttribute("account",name);
                //利用响应重定向进行界面跳转
                resp.sendRedirect("welcome.jsp");
            }else{//表示验证失败
                //设置错误信息在request中
                req.setAttribute("message","对不起账号或密码错误，请重新登录");
                //进行请求转发
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {//一定会执行代码块  一般在这里面进行资源关闭

               try {
                   if(rs!=null)   rs.close();
                   if(pstmt!=null)   pstmt.close();
                   if(conn!=null)   conn.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }

        }

    }
}
