package com.chinasofti.pet.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.util.Date;

public class MyTest {
    public static void main(String[] args) {
        Student s=new Student(1001,"张三","男",new Date(),90);
        Student s2=new Student(1003,"李四","女",new Date(),100);
        s.setStudent(s2);
        s2.setStudent(s);
        String ss = JSON.toJSONString(s, SerializerFeature.PrettyFormat);
        System.out.println(ss);
        Object o = JSON.parse(ss);
        System.out.println(o);
       // JSON.DEFAULT_GENERATE_FEATURE |=SerializerFeature.DisableCircularReferenceDetect.getMask();

    }
}
