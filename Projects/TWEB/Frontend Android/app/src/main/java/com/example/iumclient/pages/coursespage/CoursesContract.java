package com.example.iumclient.pages.coursespage;

import com.example.iumclient.beans.Course;

import java.util.ArrayList;

public interface CoursesContract {

    interface CoursesFragmentView {
        void changeRecyclerData(ArrayList<Course> newData);
        void showToastMessage(String message);
        void showRefreshing(boolean value);
    }

    interface CoursesPresenterInterface {
        void refreshRecyclerView();
        void dispose();
    }

}
