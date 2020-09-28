package com.chinasofti.pet.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置请求编码方式
        req.setCharacterEncoding("UTF-8");
        //接收key
        String key = req.getParameter("key");
        //判断key值
        if("findAllMaster".equals(key)){
            //查询所有主人信息  将查询的结果存储到请求中
            req.setAttribute("info","这是查询所有主人的结果");
            //进行请求转发
            req.getRequestDispatcher("showMaster.jsp").forward(req,resp);
        }else if("regMaster".equals(key)){
            //
            req.setAttribute("info","这是注册熟人信息的结果");
          //这个界面跳转的目标就可以发生变化   registerMaster.jsp
            req.getRequestDispatcher("showMaster.jsp").forward(req,resp);
        }else if("regDog".equals(key)){
            //
            req.setAttribute("info","这是添加狗狗的结果");
            //这个界面跳转的目标就可以发生变化   registerMaster.jsp
            req.getRequestDispatcher("showMaster.jsp").forward(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用dopost");
    }
}
