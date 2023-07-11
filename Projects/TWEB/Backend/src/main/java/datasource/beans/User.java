package datasource.beans;

public class User {

    private int id;
    private String email;
    private String name;
    private String surname;
    private String password;
    private boolean administrator;

    public User(int id, String email, String name, String surname, String password, boolean administrator) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.password = password;
        this.administrator = administrator;
    }

    public User(String email, String name, String surname, String password, boolean administrator) {
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.password = password;
        this.administrator = administrator;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(int id, String name, String surname) {
        this.id = id;
        this.name = name;
        this.surname = surname;
    }

    public User(int id) {
        this.id = id;
    }

    public User(int id, String name, String surname, boolean administrator) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.administrator = administrator;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdministrator() {
        return administrator;
    }

    public void setAdministrator(boolean administrator) {
        this.administrator = administrator;
    }
}
