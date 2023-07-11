package com.example.iumclient.beans;

import java.sql.Date;

public class Booking {

    int id;
    User user;
    Teacher teacher;
    Date date;
    int hour;
    boolean unbooked;
    boolean done;
    Course course;

    public Booking(int id, User user, Teacher teacher, Date date, int hour, boolean unbooked, boolean done, Course course) {
        this.id = id;
        this.user = user;
        this.teacher = teacher;
        this.date = date;
        this.hour = hour;
        this.unbooked = unbooked;
        this.done = done;
        this.course = course;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public boolean isUnbooked() {
        return unbooked;
    }

    public void setUnbooked(boolean unbooked) {
        this.unbooked = unbooked;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getPrintableHour() {
        return this.hour + ":00 - " + (this.hour + 1) + ":00";
    }

}
