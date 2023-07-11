package server.services.admin;

import datasource.beans.*;
import com.google.gson.JsonParseException;
import datasource.beans.TeacherCourse;
import datasource.beans.User;
import server.responses.ServiceResponse;
import server.services.JsonHttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

@WebServlet(name = "TeacherCourseService", urlPatterns = {"TeacherCourseService"})
public class TeacherCourseService extends JsonHttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(user.isAdministrator(), "Only administrators can use this function");
            serviceResponse.setData(dbService.getTeacherCourseList().collect(Collectors.toList()));
        }
        catch (SQLException e) {
            serviceResponse.setError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        catch (IllegalArgumentException e) {
            serviceResponse.setError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        finally {
            out.print(gson.toJson(serviceResponse));
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        String objectParam = request.getParameter("teacherCourse");
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(user.isAdministrator(), "Only administrators can use this function");
            checkArguments(objectParam != null, "Missing parameter teacherCourse");
            TeacherCourse teacherCourse = gson.fromJson(objectParam, TeacherCourse.class);
            if(dbService.insertTeacherCourse(teacherCourse) > 0) {
                serviceResponse.setStatus(HttpServletResponse.SC_OK);
                serviceResponse.setMessage("TeacherCourse successfully inserted");
            } else {
                throw new SQLException("TeacherCourse hasn't been inserted");
            }
        } catch (SQLException | JsonParseException e) {
            serviceResponse.setError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } catch (IllegalArgumentException e) {
            serviceResponse.setError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } finally {
            out.print(gson.toJson(serviceResponse));
        }

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        String teacherId = request.getParameter("teacherId");
        String courseId = request.getParameter("courseId");
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(user.isAdministrator(), "Only administrators can use this function");
            checkArguments(teacherId != null && courseId != null, "Missing required parameters");
            // Delete the teacherCourse association using courseId and teacherId
            if(dbService.deleteTeacherCourse(new TeacherCourse(new Teacher(Integer.parseInt(teacherId)),new Course(Integer.parseInt(courseId)))) > 0) {
                serviceResponse.setStatus(HttpServletResponse.SC_OK);
                serviceResponse.setMessage("TeacherCourse deleted successfully");
            } else {
                throw new SQLException("TeacherCourse hasn't been deleted");
            }
        }
        catch (SQLException | NumberFormatException e) {
            serviceResponse.setError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        catch(IllegalArgumentException e) {
            serviceResponse.setError(HttpServletResponse.SC_UNAUTHORIZED, e.getMessage());
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
        finally {
            out.print(gson.toJson(serviceResponse));
        }

    }
}
