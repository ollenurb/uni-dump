package com.example.iumclient.pages.bookingsdialog;

import com.example.iumclient.beans.Booking;

import java.util.ArrayList;

public interface BookingsContract {

    interface BookingsView {
        void changeRecyclerData(ArrayList<Booking> newData);
        void showRefreshing(boolean value);
        void showToastMessage(String message);
        void notifyRefresh();
    }

    interface BookingsPresenterInterface {
        void refreshRecyclerView(int courseId);
        void bookBooking(Booking booking);
        void dispose();
    }

}
