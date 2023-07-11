package com.example.iumclient.pages.bookingsdialog;

import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.ServiceResponse;
import com.example.iumclient.network.DataModelInterface;
import com.example.iumclient.network.NetworkServiceClient;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.observers.DisposableObserver;

public class BookingsPresenter implements BookingsContract.BookingsPresenterInterface {

    BookingsContract.BookingsView view;
    private DisposableObserver<ServiceResponse<List<Booking>>> getBookingsNetworkCallObserver;
    private DisposableObserver<ServiceResponse<Object>> insertBookingNetworkObserver;
    private DataModelInterface dataModel;

    public BookingsPresenter(BookingsContract.BookingsView view) {
        this.view = view;
        dataModel = new NetworkServiceClient();
    }

    @Override
    public void refreshRecyclerView(int courseId) {
        view.showRefreshing(true);
        getBookingsNetworkCallObserver = dataModel
                .getAvailableBookings(courseId)
                .subscribeWith(getBookingsDisposableObserver());
    }

    @Override
    public void bookBooking(Booking booking) {
        insertBookingNetworkObserver = dataModel
                .insertBooking(booking)
                .subscribeWith(getInsertBookingsDisposableObserver());
    }

    private DisposableObserver<ServiceResponse<List<Booking>>> getBookingsDisposableObserver() {
        return new DisposableObserver<ServiceResponse<List<Booking>>>() {
            @Override
            public void onNext(ServiceResponse<List<Booking>> serviceResponse) {
                if(serviceResponse.getData() != null) {
                    view.changeRecyclerData(new ArrayList<>(serviceResponse.getData()));
                } else {
                    view.showToastMessage(serviceResponse.getMessage());
                }
            }

            @Override
            public void onError(Throwable e) {
                view.showRefreshing(false);
                view.showToastMessage(e.getMessage());
                e.printStackTrace();
                getBookingsNetworkCallObserver.dispose();
            }

            @Override
            public void onComplete() {
                getBookingsNetworkCallObserver.dispose();
                view.showRefreshing(false);
            }
        };
    }

    private DisposableObserver<ServiceResponse<Object>> getInsertBookingsDisposableObserver() {
        return new DisposableObserver<ServiceResponse<Object>>() {
            @Override
            public void onNext(ServiceResponse<Object> serviceResponse) {
                view.showToastMessage(serviceResponse.getMessage());
            }

            @Override
            public void onError(Throwable e) {
                view.showRefreshing(false);
                view.showToastMessage(e.getMessage());
                e.printStackTrace();
                insertBookingNetworkObserver.dispose();
            }

            @Override
            public void onComplete() {
                insertBookingNetworkObserver.dispose();
                view.notifyRefresh();
            }
        };
    }

    @Override
    public void dispose() {
        if(insertBookingNetworkObserver != null) {
            insertBookingNetworkObserver.dispose();
        }
        if(getBookingsNetworkCallObserver != null) {
            getBookingsNetworkCallObserver.dispose();
        }
    }
}
