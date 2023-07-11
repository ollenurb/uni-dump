package server.services.admin;

import datasource.beans.Booking;
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
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@WebServlet(name = "GeneralHistoryService", urlPatterns = {"GeneralHistoryService"})
public class GeneralHistoryService extends JsonHttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<List<Booking>> serviceResponse = new ServiceResponse<>();
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(user.isAdministrator(), "Only administrators can use this function");
            serviceResponse.setData(dbService.getBookingHistory().collect(Collectors.toList()));
        }
        catch(SQLException e) {
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
