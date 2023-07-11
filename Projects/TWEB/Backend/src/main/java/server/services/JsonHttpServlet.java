package server.services;

import com.google.gson.Gson;
import datasource.core.DaoImpl;
import com.google.gson.GsonBuilder;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JsonHttpServlet extends HttpServlet {

    private final String CLIENT_HOST = "http://localhost:8080";
    protected final String USER_SESSION = "userData";
    protected DaoImpl dbService;
    protected Gson gson;

    @Override
    public void init(ServletConfig config) {
        dbService = new DaoImpl();
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.setPrettyPrinting();
        gsonBuilder.disableHtmlEscaping();
        gson = gsonBuilder.create();
    }

    @Override
    public void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Credentials", "true");
        super.doOptions(request, response);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", CLIENT_HOST);
        response.setHeader("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE, PATCH, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");
        super.service(request, response);
    }

    protected void requireCredentials(HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }

    public void checkArguments(boolean condition, String errMessage) throws IllegalArgumentException {
        if(!condition) {
            throw new IllegalArgumentException(errMessage);
        }
    }
}