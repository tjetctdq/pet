package com.chinasofti.pet.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LiveServlet extends HttpServlet {
    public LiveServlet() {
        System.out.println("我是LivewServlet的构造方法");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getRemoteAddr());
        System.out.println("我是LivewServlet的doget方法");
        resp.sendRedirect("hello");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("我是LivewServlet的dopost方法");
    }

    @Override
    public void destroy() {
        System.out.println("我是LivewServlet的destroy方法");

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //当前这个类继承HttpServlet  间接继承ServletConfig接口
        String account = this.getInitParameter("account");
        System.out.println("获取的初始化参数时:"+account);
        //获取上下问对象
        ServletContext sc = this.getServletContext();
        //通过上下文对象获取参数
        String username = sc.getInitParameter("username");
        System.out.println("获取的上下文对象参数时:"+username);
        System.out.println("我是LivewServlet的service方法");
        super.service(req, resp);
    }

    @Override
    public void init() throws ServletException {
        System.out.println("我是LivewServlet的init方法");

    }
}
