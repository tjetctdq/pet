package com.chinasofti.pet.servlet;

import java.util.Date;

public class Student {
    private int id;
    private String name;
    private String sex;
    private Date birth;
    private double score;
    private Student student;
    public Student(int id, String name, String sex, Date birth, double score) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.birth = birth;
        this.score = score;
    }

    public Student() {
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", birth=" + birth +
                ", score=" + score +
                '}';
    }
}
