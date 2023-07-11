package datasource.core;

import datasource.beans.*;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class DaoImpl implements Dao {

    private static final String DB_NAME = "priless";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    private static final String USER = "root";
    private static final String PASSWORD = "";

    /**
     * Register the necessary JDBC drivers in order to work properly.
     * it gets called upon object instantiation.
     */
    private void registerDriver()  {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * Try to create a new connection object
     * @return The new Connection object that has been generated
     */
    @Override
    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public Optional<User> authenticateUser(User user) throws SQLException {
        final String SQL = "SELECT * FROM users WHERE email = '%s' and password = '%s'";
        return this.query(String.format(SQL, user.getEmail(), user.getPassword()), rs -> new User(rs.getInt("id"), rs.getString("name"), rs.getString("surname"), rs.getBoolean("administrator"))).findFirst();
    }

    public Stream<Booking> getBookingHistory(User user) throws SQLException {
        final String SQL_NO_NULL = "SELECT * FROM bookings, users, teachers, courses WHERE bookings.user_id = users.id AND bookings.teacher_id = teachers.id AND bookings.course_id = courses.id AND bookings.user_id = %d";
        final String SQL_WITH_NULL = "SELECT * FROM bookings, users WHERE bookings.user_id = users.id AND bookings.teacher_id IS NULL AND bookings.course_id IS NULL AND bookings.user_id = %d";

        Stream<Booking> noNullsBookings = this.query(String.format(SQL_NO_NULL, user.getId()),
                rs -> new Booking(
                        rs.getInt("id"),
                        new Teacher(rs.getInt("teachers.id"), rs.getString("teachers.name"), rs.getString("teachers.surname")),
                        rs.getDate("day"),
                        rs.getInt("hour"),
                        rs.getBoolean("is_unbooked"),
                        rs.getBoolean("is_done"),
                        new Course(rs.getInt("courses.id"), rs.getString("courses.title"))
                )
        );

        Stream<Booking> nullsBookings = this.query(String.format(SQL_WITH_NULL, user.getId()),
                rs -> new Booking(
                        rs.getInt("id"),
                        null,
                        rs.getDate("day"),
                        rs.getInt("hour"),
                        rs.getBoolean("is_unbooked"),
                        rs.getBoolean("is_done"),
                        null
                )
        );

        return Stream.concat(noNullsBookings, nullsBookings); 
    }

    public Stream<Booking> getBookingHistory() throws SQLException {
        final String SQL_NO_NULL = "SELECT * FROM bookings, users, teachers, courses WHERE bookings.user_id = users.id AND bookings.teacher_id = teachers.id AND bookings.course_id = courses.id";
        final String SQL_WITH_NULL = "SELECT * FROM bookings, users WHERE bookings.user_id = users.id AND bookings.teacher_id IS NULL AND bookings.course_id IS NULL";
        Stream<Booking> noNullsBookings = this.query(SQL_NO_NULL,
                rs -> new Booking(
                        rs.getInt("id"),
                        new User(rs.getInt("users.id"), rs.getString("users.name"), rs.getString("users.surname"), rs.getBoolean("users.administrator")),
                        new Teacher(rs.getInt("teachers.id"), rs.getString("teachers.name"), rs.getString("teachers.surname")),
                        rs.getDate("day"),
                        rs.getInt("hour"),
                        rs.getBoolean("is_unbooked"),
                        rs.getBoolean("is_done"),
                        new Course(rs.getInt("courses.id"), rs.getString("courses.title"))
                )
        );

        Stream<Booking> nullsBookings = this.query(SQL_WITH_NULL,
                rs -> new Booking(
                        rs.getInt("id"),
                        new User(rs.getInt("users.id"), rs.getString("users.name"), rs.getString("users.surname"), rs.getBoolean("users.administrator")),
                        null,
                        rs.getDate("day"),
                        rs.getInt("hour"),
                        rs.getBoolean("is_unbooked"),
                        rs.getBoolean("is_done"),
                        null
                )
        );
        
        return Stream.concat(noNullsBookings, nullsBookings); 
    }

    public Stream<TeacherCourse> getTeacherCourses(int courseId) throws SQLException {
        final String SQL = "SELECT * FROM teacher_with_courses, courses, teachers where teacher_with_courses.teacher_id = teachers.id and teacher_with_courses.course_id = courses.id AND courses.id = %d";
        return this.query(String.format(SQL, courseId),
                rs -> new TeacherCourse(
                        new Teacher(rs.getInt("teachers.id"), rs.getString("teachers.name"), rs.getString("teachers.surname")),
                        new Course(rs.getInt("courses.id"), rs.getString("courses.title"))
                )
        );
    }

    public Stream<Booking> getBookingList(Date from, Date to, int courseId) throws SQLException {
        final String SQL = "SELECT * FROM bookings WHERE day BETWEEN '%tF' AND '%tF' AND bookings.course_id = %d AND bookings.is_unbooked = false";
        return this.query(String.format(SQL, from, to, courseId),
                rs -> new Booking(
                        rs.getInt("id"),
                        new User(rs.getInt("user_id")),
                        new Teacher(rs.getInt("teacher_id")),
                        rs.getDate("day"),
                        rs.getInt("hour"),
                        rs.getBoolean("is_unbooked"),
                        rs.getBoolean("is_done"),
                        new Course(rs.getInt("course_id"))
                )
        );
    }

    public Stream<Course> getCourseList() throws SQLException {
        final String SQL = "SELECT *, COUNT(teacher_id) AS available_teachers FROM teacher_with_courses, courses WHERE teacher_with_courses.course_id = courses.id GROUP BY(course_id)";
        return this.query(SQL, rs -> new Course(rs.getInt("id"), rs.getString("title"), rs.getInt("available_teachers")));
    }

    public Stream<Teacher> getTeacherList() throws SQLException {
        final String SQL = "SELECT * FROM teachers";
        return this.query(SQL, rs -> new Teacher(rs.getInt("id"), rs.getString("name"), rs.getString("surname")));
    }

    public Stream<TeacherCourse> getTeacherCourseList() throws SQLException {
        final String SQL = "SELECT * FROM teacher_with_courses, teachers, courses WHERE teacher_id = teachers.id AND course_id = courses.id";
        return this.query(SQL, rs -> new TeacherCourse(
                rs.getInt("id"),
                new Teacher( rs.getInt("teachers.id"),  rs.getString("teachers.name"),  rs.getString("teachers.surname")),
                new Course(rs.getInt("courses.id"),  rs.getString("courses.title"))
            )
        );
    }

    public int insertUser(User user) throws SQLException {
        final String SQL = "INSERT INTO users(email, name, surname, password, administrator) VALUES ('%s', '%s', '%s', '%s', '%b')";
        return this.update(String.format(SQL, user.getEmail(), user.getName(), user.getSurname(), user.getPassword(), user.isAdministrator()));
    }

    public int setUnbookedBooking(Booking booking) throws SQLException {
        final String SQL = "UPDATE bookings SET is_unbooked = 1 where id = %d";
        return this.update(String.format(SQL, booking.getId()));
    }

    public int setDoneBooking(Booking booking) throws SQLException {
        final String SQL = "UPDATE bookings SET is_done = 1 where id = %d";
        return this.update(String.format(SQL, booking.getId()));
    }

    public int insertBooking(Booking booking) throws SQLException {
        final String SQL = "INSERT INTO bookings(user_id, teacher_id, day, hour, course_id) VALUES (%d, %d, '%tF', %d, %d)";
        return this.update(String.format(SQL, booking.getUser().getId(), booking.getTeacher().getId(), booking.getDate(), booking.getHour(), booking.getCourse().getId()));
    }

    public int insertCourse(Course course) throws SQLException {
        final String SQL = "INSERT INTO courses (title) VALUES ('%s')";
        return this.update(String.format(SQL, course.getTitle()));
    }

    public int insertTeacher(Teacher teacher) throws SQLException {
        final String SQL = "INSERT INTO teachers (name, surname) VALUES ('%s', '%s')";
        return this.update(String.format(SQL, teacher.getName(), teacher.getSurname()));
    }

    public int insertTeacherCourse(TeacherCourse teacherCourse) throws SQLException {
        final String SQL = "INSERT INTO teacher_with_courses (course_id, teacher_id) VALUES (%d, %d)";
        return this.update(String.format(SQL, teacherCourse.getCourse().getId(), teacherCourse.getTeacher().getId()));
    }

    public int deleteCourse(Course course) throws SQLException {
        String SQL = "DELETE FROM courses WHERE id = %d";
        return this.update(String.format(SQL, course.getId()));
    }

    public int deleteTeacher(Teacher teacher) throws SQLException {
        final String SQL = "DELETE FROM teachers WHERE id = %d";
        return this.update(String.format(SQL, teacher.getId()));
    }

    public int deleteTeacherCourse(TeacherCourse teacherCourse) throws SQLException {
        String SQL = "DELETE FROM teacher_with_courses WHERE teacher_id = %d and course_id = %d";
        return this.update(String.format(SQL, teacherCourse.getTeacher().getId(), teacherCourse.getCourse().getId()));
    }
}
