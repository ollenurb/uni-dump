package com.example.iumclient.beans;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class User {

    @SerializedName("id")
    @Expose
    private int id;

    @SerializedName("name")
    @Expose
    private String name;

    @SerializedName("surname")
    @Expose
    private String surname;

    @SerializedName("email")
    @Expose
    private String email;

    @SerializedName("administrator")
    @Expose
    private boolean administrator;

    public User(int id, String name, String surname, String email, boolean administrator) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.administrator = administrator;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getEmail() {
        return email;
    }

    public boolean isAdministrator() {
        return administrator;
    }

    public String getNameSurname() {
        return name + " " + surname;
    }

    public String getPrintableId() {
        return "Account #" + id;
    }
}
