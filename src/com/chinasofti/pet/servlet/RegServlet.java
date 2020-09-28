package com.chinasofti.pet.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet( name = "regServlet",urlPatterns = "/hello")
@MultipartConfig
public class RegServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        System.out.println(account);
        String password = req.getParameter("password");
        System.out.println(password);
        String phone = req.getParameter("phone");
        System.out.println(phone);
        Part image = req.getPart("image");
        System.out.println(image.getSubmittedFileName());
        String name = image.getSubmittedFileName();
        System.out.println(image.getName());
        System.out.println(image.getSize());
        String path = this.getServletContext().getRealPath("\\upload");
        File f=new File(path);
        if(!f.exists())f.mkdir();
        String s=path+"/"+ UUID.randomUUID().toString()+name.substring(name.lastIndexOf('.'));
        System.out.println(s);
        image.write(s);
    }
}
