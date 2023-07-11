package com.example.iumclient.pages.modifybookingdialog;

import com.example.iumclient.beans.Booking;

public interface ModifyBookingContract {

    interface ModifyBookingView {
        void dismiss();
        void showToastMessage(String message);
    }

    interface ModifyBookingPresenterInterface {
        void unbookBooking(Booking booking);
        void setDoneBooking(Booking booking);
        void dispose();
    }

}
