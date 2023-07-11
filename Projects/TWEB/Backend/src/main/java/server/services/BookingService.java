package server.services;

import datasource.beans.Booking;
import datasource.beans.User;
import server.responses.ServiceResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet(name = "BookingService", urlPatterns = {"BookingService"})
public class BookingService extends JsonHttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        HttpSession loginSession = request.getSession(false);
        String bookingParam = request.getParameter("booking");

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(bookingParam != null, "Missing required parameter booking");
            Booking booking = gson.fromJson(bookingParam, Booking.class);
            booking.setUser(user);
            dbService.insertBooking(booking);
            serviceResponse.setMessage("Booking successfully inserted");
            serviceResponse.setStatus(HttpServletResponse.SC_OK);
        }
        catch (SQLException e) {
            serviceResponse.setError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        catch(IllegalArgumentException e) {
            serviceResponse.setError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        finally {
            out.print(gson.toJson(serviceResponse));
        }

    }

}
