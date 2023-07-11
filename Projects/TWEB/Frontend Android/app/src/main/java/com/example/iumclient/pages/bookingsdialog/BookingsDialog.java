package com.example.iumclient.pages.bookingsdialog;

import android.app.AlertDialog;
import android.app.Dialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;
import androidx.fragment.app.DialogFragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.example.iumclient.R;
import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.Course;
import com.example.iumclient.util.ApplicationStorage;
import com.example.iumclient.util.OnItemClickListener;
import org.jetbrains.annotations.NotNull;
import java.util.ArrayList;
import butterknife.BindView;
import butterknife.ButterKnife;


public class BookingsDialog extends DialogFragment implements BookingsContract.BookingsView, SwipeRefreshLayout.OnRefreshListener, OnItemClickListener<Booking> {
    @BindView(R.id.bookings_view_recycler)
    RecyclerView recyclerView;
    @BindView(R.id.bookings_view_swipe_refresh)
    SwipeRefreshLayout swipeRefreshLayout;

    // The course on which the dialog will be referred to
    private Course course;
    private BookingsContract.BookingsPresenterInterface presenter;
    private BookingsAdapter bookingsViewAdapter;

    public BookingsDialog(Course course) {
        this.course = course;
    }

    @NotNull
    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        View view = requireActivity().getLayoutInflater().inflate(R.layout.bookings_dialog, null);
        ButterKnife.bind(this, view);
        builder.setView(view);
        builder.setTitle(course.getTitle());
        builder.setMessage((ApplicationStorage.getUserSession().getId() != -1)
                        ? getString(R.string.select_lesson_dialog_message)
                        : getString(R.string.book_lesson_dialog_message));

        presenter = new BookingsPresenter(this);
        swipeRefreshLayout.setOnRefreshListener(this);

        if(bookingsViewAdapter == null) {
            bookingsViewAdapter = new BookingsAdapter(new ArrayList<>());
            bookingsViewAdapter.setAdapterListener(this);
            presenter.refreshRecyclerView(course.getId());
        }

        initRecyclerView();

        return builder.create();
    }

    private void initRecyclerView() {
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        recyclerView.setAdapter(bookingsViewAdapter);
    }

    @Override
    public void showToastMessage(String message) {
        Toast.makeText(getContext(), message, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void notifyRefresh() {
        presenter.refreshRecyclerView(course.getId());
    }

    @Override
    public void changeRecyclerData(ArrayList<Booking> newData) {
        bookingsViewAdapter.updateData(newData);
        recyclerView.scheduleLayoutAnimation();
    }

    @Override
    public void showRefreshing(boolean value) {
        swipeRefreshLayout.setRefreshing(value);
    }

    @Override
    public void onDestroy() {
        presenter.dispose();
        super.onDestroy();
    }

    @Override
    public void onRefresh() {
        presenter.refreshRecyclerView(course.getId());
    }

    @Override
    public void onItemClicked(Booking booking, View view) {
        presenter.bookBooking(booking);
    }

    @Override
    public void onItemLongClicked(Booking booking, View view) {
        // Empty method
    }
}
