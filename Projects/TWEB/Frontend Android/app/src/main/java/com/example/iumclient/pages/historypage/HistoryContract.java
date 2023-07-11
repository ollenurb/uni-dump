package com.example.iumclient.pages.historypage;

import com.example.iumclient.beans.Booking;

import java.util.ArrayList;

public interface HistoryContract {

    interface HistoryFragmentView {
        void changeRecyclerData(ArrayList<Booking> newData);
        void showRefreshing(boolean value);
        void showToastMessage(String message);
    }

    interface HistoryPresenterInterface {
        void refreshRecyclerView();
        void dispose();
    }

}
