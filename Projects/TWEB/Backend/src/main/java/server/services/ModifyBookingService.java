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

@WebServlet(name = "ModifyBookingService", urlPatterns = {"ModifyBookingService"})
public class ModifyBookingService extends JsonHttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();

        HttpSession loginSession = request.getSession(false);
        String bookingParam = request.getParameter("bookingId");
        String methodParam = request.getParameter("method");

        int changedRows = -1; 

        try {
            checkArguments(loginSession != null, "You must be logged in to use this function");
            User user = (User) Objects.requireNonNull(loginSession).getAttribute(USER_SESSION);
            checkArguments(bookingParam != null && methodParam != null, "Invalid parameter bookingId or method");
            switch (methodParam) {
                // TODO: Check if the booking belongs to the User
                case "unbook":
                    changedRows = dbService.setUnbookedBooking(new Booking(Integer.parseInt(bookingParam)));
                    break;

                case "done":
                    changedRows = dbService.setDoneBooking(new Booking(Integer.parseInt(bookingParam)));
                    break;

                default:
                    serviceResponse.setError(HttpServletResponse.SC_BAD_REQUEST, "Invalid method: choose one from either 'unbook' or 'done'");
            }
            if(changedRows > 0) {
                serviceResponse.setStatus(HttpServletResponse.SC_OK); 
                serviceResponse.setMessage("Booking has been successfully set as " + methodParam);
            }
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
