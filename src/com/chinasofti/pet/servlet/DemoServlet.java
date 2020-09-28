package com.chinasofti.pet.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "demoServlet",urlPatterns = "/demo")
public class DemoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用了get请求");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write("哈哈哈");
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        System.out.println(req.getParameter("name")+"----"
        +req.getParameter("password"));
        PrintWriter out = resp.getWriter();
        out.write("可以了");
        out.flush();
    }
}
