package datasource.beans;

import com.google.gson.annotations.Expose;

public class TeacherCourse {

    @Expose
    int id;
    @Expose
    Teacher teacher;
    @Expose
    Course course;

    public TeacherCourse(Teacher teacher, Course course) {
        this.id = -1;
        this.teacher = teacher;
        this.course = course;
    }

    public TeacherCourse(int id, Teacher teacher, Course course) {
        this.id = id;
        this.teacher = teacher;
        this.course = course;
    }

    public TeacherCourse(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
