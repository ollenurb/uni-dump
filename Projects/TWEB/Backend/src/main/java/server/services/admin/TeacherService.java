package server.services.admin;

import com.google.gson.JsonParseException;
import datasource.beans.Course;
import datasource.beans.Teacher;
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

@WebServlet(name = "TeacherService", urlPatterns = {"TeacherService"})
public class TeacherService  extends JsonHttpServlet {

    
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
            serviceResponse.setData(dbService.getTeacherList().collect(Collectors.toList()));
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        String objectParam = request.getParameter("teacher");
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(user.isAdministrator(), "Only administrators can use this function");
            checkArguments(objectParam != null, "Missing parameter teacher");
            Teacher teacher = gson.fromJson(objectParam, Teacher.class);
            dbService.insertTeacher(teacher);
            serviceResponse.setStatus(HttpServletResponse.SC_OK);
            serviceResponse.setMessage("Teacher successfully inserted");
        }
        catch (SQLException | JsonParseException e) {
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

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        String teacherId = request.getParameter("teacherId");
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(user.isAdministrator(), "Only administrators can use this function");
            checkArguments(teacherId != null, "Missing parameter teacherId");
            dbService.deleteTeacher(new Teacher(Integer.parseInt(teacherId)));
            serviceResponse.setStatus(HttpServletResponse.SC_OK);
            serviceResponse.setMessage("Teacher successfully deleted");
        }
        catch (SQLException | NumberFormatException e) {
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

}
