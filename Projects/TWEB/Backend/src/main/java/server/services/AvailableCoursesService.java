package server.services;


import datasource.beans.Course;
import server.responses.ServiceResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "AvailableCoursesService", urlPatterns = {"AvailableCoursesService"})
public class AvailableCoursesService extends JsonHttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        ServiceResponse<List<Course>> serviceResponse = new ServiceResponse<>();

        try {
            serviceResponse.setData(dbService.getCourseList().collect(Collectors.toList()));
        }
        catch(SQLException e) {
            serviceResponse.setError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        finally {
            out.print(gson.toJson(serviceResponse));
        }
    }

}
