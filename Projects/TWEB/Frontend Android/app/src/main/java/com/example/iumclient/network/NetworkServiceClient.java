package com.example.iumclient.network;

import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.User;
import com.example.iumclient.beans.Course;
import com.example.iumclient.beans.ServiceResponse;
import com.example.iumclient.network.session.ReceiveCookiesInterceptor;
import com.example.iumclient.network.session.SendCookiesInterceptor;
import com.google.gson.Gson;

import java.util.List;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 *  This class represents the Model of the architecture, it works as a NetworkClient to make
 *  REST HTTP Calls trough retrofit interface
 */
public class NetworkServiceClient implements DataModelInterface {

    // This is the actual NetworkInterface to our REST API service
    private static NetworkServiceInterface networkDataSource;

    public NetworkServiceClient() {
        networkDataSource = getRetrofitClient().create(NetworkServiceInterface.class);
    }

    /**
     *  Creates a new retrofit client using its builder method
     *  @return The retrofitClient that has been created
     */
    public static Retrofit getRetrofitClient() {
        // Add session interceptors to client
        OkHttpClient.Builder builder = new OkHttpClient.Builder();
        HttpLoggingInterceptor loggingInterceptor = new HttpLoggingInterceptor();
        loggingInterceptor.level(HttpLoggingInterceptor.Level.BODY);
        builder.addInterceptor(new ReceiveCookiesInterceptor());
        builder.addInterceptor(new SendCookiesInterceptor());
        OkHttpClient okHttpClient = builder.build();
    
        return new Retrofit.Builder()
                .baseUrl(UrlManager.SERVICE_ENDPOINT)
                .addConverterFactory(GsonConverterFactory.create())
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .client(okHttpClient)
                .build();
    }

    /**
     *  Create an authentication service wrapped within an observable.
     *  The observable will be subscribed with a disposable observer which will be implemented
     *  in the application business logic (e.g. controller or presenter)
     *  @return The Observable that has been created
     */
    @Override
    public Observable<ServiceResponse<User>> authenticate(String email, String password) {
        return networkDataSource.auth(email, password)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    /**
     *  Create a getCourses service wrapped within an observable.
     *  @return The Observable that has been created
     */
    @Override
    public Observable<ServiceResponse<List<Course>>> getCourses() {
        return networkDataSource.availableCourses()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    /**
     *  Create a getHistory service wrapped within an observable.
     *  @return The Observable that has been created
     */
    @Override
    public Observable<ServiceResponse<List<Booking>>> getHistory() {
        return networkDataSource.getHistory()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    /**
     *  Create a getAvailableBookings service wrapped within an observable.
     *  @return The Observable that has been created
     */
    @Override
    public Observable<ServiceResponse<List<Booking>>> getAvailableBookings(int courseId) {
        return networkDataSource.getAvailableBookings(courseId)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    /**
     *  Create a insertBooking service wrapped within an observable.
     *  Needs a GSON converter to convert the booking to send over HTTP's encoded form
     *  @return The Observable that has been created
     */
    @Override
    public Observable<ServiceResponse<Object>> insertBooking(Booking booking) {
        Gson gson = new Gson();
        return networkDataSource.insertBooking(gson.toJson(booking))
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    /**
     *  Create a modifyBooking service wrapped within an observable.
     *  @return The Observable that has been created
     */
    @Override
    public Observable<ServiceResponse<Object>> modifyBooking(String method, int bookingId) {
        return networkDataSource.modifyBooking(method, bookingId)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

}
