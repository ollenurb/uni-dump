package datasource.beans;

import com.google.gson.annotations.Expose;


public class Course {

    @Expose
    int id;
    @Expose
    String title;
    @Expose
    int available_teachers; 

    public Course(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public Course(int id, String title, int available_teachers) {
        this.id = id;
        this.title = title;
        this.available_teachers = available_teachers;
    }


    public Course(int id) {
        this.id = id;
    }

    public Course(String title) {
        this.title = title;
    }

    public Course() {
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

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return this.id + ", " + this.title;
    }
}
