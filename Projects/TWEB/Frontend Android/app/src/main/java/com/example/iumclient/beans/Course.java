package com.example.iumclient.beans;

public class Course {

    private int id;
    private String title;
    private int available_teachers;

    public Course(int id, String title, int available_teachers) {
        this.id = id;
        this.title = title;
        this.available_teachers = available_teachers;
    }

    public Course(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public int getAvailableTeachers() {
        return available_teachers;
    }

    public void setTitle(String title) {
        this.title = title;
    }


}
