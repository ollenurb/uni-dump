package com.example.iumclient.network;

import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.User;
import com.example.iumclient.beans.Course;
import com.example.iumclient.beans.ServiceResponse;
import java.util.List;
import io.reactivex.Observable;

/*
* This interface tells how the model should be implemented.
* The controller (or the presenter) relies on those methods in order to get data
*/
public interface DataModelInterface {

    Observable<ServiceResponse<User>> authenticate(String email, String password);
    Observable<ServiceResponse<List<Course>>> getCourses();
    Observable<ServiceResponse<List<Booking>>> getHistory();
    Observable<ServiceResponse<List<Booking>>> getAvailableBookings(int courseId);
    Observable<ServiceResponse<Object>> insertBooking(Booking booking);
    Observable<ServiceResponse<Object>> modifyBooking(String method, int bookingId);

}
