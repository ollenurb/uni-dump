package com.example.iumclient.pages.coursespage;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.example.iumclient.R;
import com.example.iumclient.beans.Course;
import com.example.iumclient.pages.bookingsdialog.BookingsDialog;
import com.example.iumclient.util.OnItemClickListener;

import java.util.ArrayList;
import butterknife.BindView;
import butterknife.ButterKnife;

public class CoursesView extends Fragment implements CoursesContract.CoursesFragmentView, SwipeRefreshLayout.OnRefreshListener, OnItemClickListener<Course> {

    @BindView(R.id.courses_view_recycler) RecyclerView recyclerView;
    @BindView(R.id.courses_view_swipe_refresh) SwipeRefreshLayout swipeRefreshLayout;

    private CoursesViewAdapter coursesViewAdapter;
    private CoursesContract.CoursesPresenterInterface presenter;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view =  inflater.inflate(R.layout.courses_view, container, false);
        ButterKnife.bind(this, view);
        presenter = new CoursesPresenter(this);
        swipeRefreshLayout.setOnRefreshListener(this);

        if(coursesViewAdapter == null) {
            coursesViewAdapter = new CoursesViewAdapter(new ArrayList<>());
            coursesViewAdapter.setAdapterListener(this);
            presenter.refreshRecyclerView();   // Requests network data, then fills recycler's data set
        }

        initRecyclerView();
        return view;
    }

    private void initRecyclerView() {
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(coursesViewAdapter);
    }

    @Override
    public void changeRecyclerData(ArrayList<Course> newData) {
        coursesViewAdapter.updateData(newData);
        recyclerView.scheduleLayoutAnimation();
    }

    @Override
    public void showToastMessage(String message) {
        Toast.makeText(getContext(), message, Toast.LENGTH_LONG).show();
    }

    @Override
    public void showRefreshing(boolean value) {
        swipeRefreshLayout.setRefreshing(value);
    }

    @Override
    public void onRefresh() {
        presenter.refreshRecyclerView();
    }

    @Override
    public void onItemClicked(Course course, View view) {
        // Called when an element of the recycler view gets clicked
        new BookingsDialog(course).show(getFragmentManager(), "BOOKINGS");
    }

    @Override
    public void onItemLongClicked(Course course, View view) {
        // Called when an element of the recycler view gets long clicked
    }

    @Override
    public void onDestroy() {
        presenter.dispose();
        super.onDestroy();
    }
}
