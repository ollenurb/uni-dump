package server.services;

import datasource.beans.User;
import server.responses.ServiceResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Optional;

@WebServlet(name = "AuthService", urlPatterns = {"AuthService"})
public class AuthService extends JsonHttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);
        PrintWriter out = response.getWriter();
        ServiceResponse<User> serviceResponse = new ServiceResponse<>();

        HttpSession loginSession = request.getSession(false);
        String emailParam = request.getParameter("email");
        String passParam = request.getParameter("password");

        try {
            checkArguments((loginSession == null), "User has been already authenticated");
            checkArguments((emailParam != null && passParam != null), "Invalid parameters");
            Optional<User> user = dbService.authenticateUser(new User(emailParam, passParam));
            if(user.isPresent()) {
                loginSession = request.getSession();
                loginSession.setAttribute(USER_SESSION, user.get());
                serviceResponse.setData(user.get());
            } else {
                serviceResponse.setError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid username or password");
            }
        }
        catch(SQLException e) {
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

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        requireCredentials(response);

        PrintWriter out = response.getWriter();
        ServiceResponse<Object> serviceResponse = new ServiceResponse<>();
        HttpSession loginSession = request.getSession(false);

        try {
            checkArguments((loginSession != null), "You don't have any active session from which you can log out");
            loginSession.invalidate(); 
            serviceResponse.setStatus(HttpServletResponse.SC_OK);
            serviceResponse.setMessage("Successfully logged out from the current session");
        } catch(IllegalArgumentException e) {
            serviceResponse.setError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        finally {
            out.print(gson.toJson(serviceResponse));
        }
    }


}
