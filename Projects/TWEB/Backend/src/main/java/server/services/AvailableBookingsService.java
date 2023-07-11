package server.services;

import datasource.beans.Booking;
import datasource.beans.TeacherCourse;
import server.responses.ServiceResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

@WebServlet(name = "AvailableBookingsService", urlPatterns = {"AvailableBookingsService"})
public class AvailableBookingsService extends JsonHttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        ServiceResponse<List<Booking>> serviceResponse = new ServiceResponse<>();
        String courseIdParam = request.getParameter("courseId");
        try {
            checkArguments(courseIdParam != null, "Missing required parameter: courseId");
            int courseId = Integer.parseInt(courseIdParam);
            serviceResponse.setData(generateBookingList(courseId).collect(Collectors.toList()));
        }
        catch (NumberFormatException | SQLException e) {
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

    private Stream<Booking> generateBookingList(int courseId) throws SQLException {
        final int HOUR_TO = 19;
        final int HOUR_FROM = 15;
        final int N_DAYS = 7;
        // Generate a list of dates using an infinite stream of dates starting from tomorrow, then limit it to N_DAYS
        List<Date> dateList = Stream
                .iterate(new Date(System.currentTimeMillis()), this::getTomorrow)
                .limit(N_DAYS)
                .collect(Collectors.toList());
        // Generate a list of integers using an infinite stream of hours starting from HOUR_FROM, then limit it to HOUR_TO
        List<Integer> hourList = IntStream
                .rangeClosed(HOUR_FROM, HOUR_TO)
                .boxed()
                .collect(Collectors.toList());

        Stream<TeacherCourse> teacherCourses = dbService.getTeacherCourses(courseId); // Get the stream of teacherCourses
        List<Booking> unavailableBooking = dbService.getBookingList(new Date(System.currentTimeMillis()), dateList.get(dateList.size() - 1), courseId)  // Get the list of bookings that are already inserted into the database
                .collect(Collectors.toList());

        return teacherCourses
                .flatMap(tc -> dateList
                        .stream()
                        .flatMap(ds -> hourList
                                .stream()
                                .map(hr -> new Booking(tc.getTeacher(), ds, hr, tc.getCourse()))))
                .filter(booking -> !unavailableBooking.contains(booking));
    }

    private Date getTomorrow(Date date) {
        return new Date(date.getTime() + 24*60*60*1000);
    }

}
