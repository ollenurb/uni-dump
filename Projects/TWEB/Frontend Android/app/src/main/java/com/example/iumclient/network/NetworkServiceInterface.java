package com.example.iumclient.network;


import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.User;
import com.example.iumclient.beans.Course;
import com.example.iumclient.beans.ServiceResponse;

import java.util.List;

import io.reactivex.Observable;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;

public interface NetworkServiceInterface {

    @FormUrlEncoded
    @POST(UrlManager.AUTH_SERVICE)
    Observable<ServiceResponse<User>> auth(@Field("email") String email, @Field("password") String password);

    @GET(UrlManager.COURSES_SERVICE)
    Observable<ServiceResponse<List<Course>>> availableCourses();

    @GET(UrlManager.HISTORY_SERVICE)
    Observable<ServiceResponse<List<Booking>>> getHistory();

    @GET(UrlManager.AVAILABLE_BOOKINGS_SERVICE)
    Observable<ServiceResponse<List<Booking>>> getAvailableBookings(@Query("courseId") int courseId);

    @FormUrlEncoded
    @POST(UrlManager.BOOKING_SERVICE)
    Observable<ServiceResponse<Object>> insertBooking(@Field("booking") String booking);

    @GET(UrlManager.MODIFY_BOOKING_SERVICE)
    Observable<ServiceResponse<Object>> modifyBooking(@Query("method") String method, @Query("bookingId") int bookingId);

}
