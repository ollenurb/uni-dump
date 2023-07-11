package com.example.iumclient.pages.historypage;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.example.iumclient.R;
import com.example.iumclient.beans.Booking;
import com.example.iumclient.pages.modifybookingdialog.ModifyBookingDialog;
import com.example.iumclient.util.OnItemClickListener;

import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;

public class HistoryView extends Fragment  implements HistoryContract.HistoryFragmentView, SwipeRefreshLayout.OnRefreshListener, OnItemClickListener<Booking>, DialogInterface.OnDismissListener {

    @BindView(R.id.history_view_recycler)
    RecyclerView recyclerView;
    @BindView(R.id.history_view_swipe_refresh)
    SwipeRefreshLayout swipeRefreshLayout;

    private HistoryContract.HistoryPresenterInterface presenter;
    private HistoryViewAdapter historyViewAdapter;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view =  inflater.inflate(R.layout.history_view, container, false);
        ButterKnife.bind(this, view);
        presenter = new HistoryPresenter(this);
        swipeRefreshLayout.setOnRefreshListener(this);

        if(historyViewAdapter == null) {
            historyViewAdapter = new HistoryViewAdapter(new ArrayList<>());
            historyViewAdapter.setClickListener(this);
            presenter.refreshRecyclerView();
        }

        initRecyclerView();
        return view;
    }

    private void initRecyclerView() {
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(historyViewAdapter);
    }

    @Override
    public void onRefresh() {
        presenter.refreshRecyclerView();
    }

    @Override
    public void showRefreshing(boolean value) {
        swipeRefreshLayout.setRefreshing(value);
    }

    @Override
    public void showToastMessage(String message) {
        Toast.makeText(getContext(), message, Toast.LENGTH_LONG).show();
    }

    @Override
    public void changeRecyclerData(ArrayList<Booking> newData) {
        historyViewAdapter.updateData(newData);
        recyclerView.scheduleLayoutAnimation();
    }

    @Override
    public void onDestroy() {
        presenter.dispose();
        super.onDestroy();
    }

    @Override
    public void onItemClicked(Booking booking, View view) {
        ModifyBookingDialog dialog = new ModifyBookingDialog(booking);
        dialog.setDismissListener(this);
        dialog.show(getFragmentManager(), "MODIFY_BOOKING_DIALOG");
    }

    @Override
    public void onItemLongClicked(Booking booking, View view) {
        // Ignore long click
    }

    @Override
    public void onDismiss(DialogInterface dialogInterface) {
        presenter.refreshRecyclerView();
    }
}
