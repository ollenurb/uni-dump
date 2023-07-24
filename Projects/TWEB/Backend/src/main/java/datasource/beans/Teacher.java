package datasource.beans;

import com.google.gson.annotations.Expose;

public class Teacher {

    @Expose
    int id;
    @Expose
    String name;
    @Expose
    String surname;

    public Teacher(int id, String name, String surname) {
        this.id = id;
        this.name = name;
        this.surname = surname;
    }

    public Teacher(String name, String surname) {
        this.name = name;
        this.surname = surname;
    }

    public Teacher() {
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Teacher(int id) {
        this.id = id;
    }
}