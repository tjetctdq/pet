package com.chinasofti.pet.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class VisitCountListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("应用启动了");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("应用关闭了");
    }
}
