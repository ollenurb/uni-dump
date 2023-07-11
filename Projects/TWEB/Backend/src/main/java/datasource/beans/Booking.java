package datasource.beans;

import com.google.gson.annotations.Expose;

import java.sql.Date;

public class Booking {

    @Expose(serialize = false)
    int id;
    @Expose
    User user;
    @Expose
    Teacher teacher;
    @Expose
    Date date;
    @Expose
    int hour;
    @Expose(serialize = false)
    boolean unbooked;
    @Expose(serialize = false)
    boolean done;
    @Expose
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

    public Booking(User user, Teacher teacher, Date date, int hour, boolean unbooked, boolean done, Course course) {
        this.id = -1;
        this.user = user;
        this.teacher = teacher;
        this.date = date;
        this.hour = hour;
        this.unbooked = unbooked;
        this.done = done;
        this.course = course;
    }

    public Booking(int id, Teacher teacher, Date date, int hour, boolean unbooked, boolean done, Course course) {
        this.id = id;
        this.teacher = teacher;
        this.date = date;
        this.hour = hour;
        this.unbooked = unbooked;
        this.done = done;
        this.course = course;
        this.user = null;
    }

    public Booking(Teacher teacher, Date date, int hour, Course course) {
        this.teacher = teacher;
        this.date = date;
        this.hour = hour;
        this.course = course;
    }

    public Booking(int id) {
        this.id = id;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
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

    // TODO: Add unbooked to the condition
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Booking) {
            Booking booking = (Booking) obj;
            return (
                booking.getDate().toString().equals(date.toString()) &&
                booking.getTeacher().getId() == teacher.getId() &&
                booking.getHour() == hour
            );
        } else {
            return false;
        }
    }

    @Override
    public String toString() {
        return "\n { Date: " + date.toString()  + "hr: " + hour + ", Teacher: " + teacher.getId() + ", course: " + course.getId() + " }";
    }
}
