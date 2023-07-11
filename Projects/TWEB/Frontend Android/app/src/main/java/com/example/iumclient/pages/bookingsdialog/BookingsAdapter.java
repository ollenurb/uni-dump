package com.example.iumclient.pages.bookingsdialog;


import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.iumclient.R;
import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.Course;
import com.example.iumclient.util.ApplicationStorage;
import com.example.iumclient.util.OnItemClickListener;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;

public class BookingsAdapter extends RecyclerView.Adapter<BookingsAdapter.ViewHolder> {

    private OnItemClickListener<Booking> onItemClickListener;
    private ArrayList<Booking> bookingList;
    private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

    public BookingsAdapter(ArrayList<Booking> bookingList) {
        this.bookingList = bookingList;
    }

    @NonNull
    @Override
    public BookingsAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.bookings_card_item, parent, false);
        return new BookingsAdapter.ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull BookingsAdapter.ViewHolder holder, int position) {
        Booking currentBooking = bookingList.get(position);
        holder.teacherName.setText(currentBooking.getTeacher().getNameSurname());
        holder.date.setText(format.format(currentBooking.getDate()));
        holder.hour.setText(currentBooking.getPrintableHour());
        holder.bookButton.setVisibility(holder.isLoggedIn ? View.VISIBLE : View.INVISIBLE);
    }

    void updateData(ArrayList<Booking> newData) {
        bookingList.clear();
        bookingList.addAll(newData);
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        return bookingList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        boolean isLoggedIn = false;
        @BindView(R.id.bookings_card_teacher) TextView teacherName;
        @BindView(R.id.bookings_card_date) TextView date;
        @BindView(R.id.bookings_card_hour_label) TextView hour;
        @BindView(R.id.bookings_card_book_button) ImageButton bookButton;

        ViewHolder(View view) {
            super(view);
            if(ApplicationStorage.getUserSession().getId() != -1) {
                isLoggedIn = true;
            }
            ButterKnife.bind(this, view);
            bookButton.setOnClickListener(this);
        }

        @Override
        public void onClick(View view) {
            onItemClickListener.onItemClicked(bookingList.get(getAdapterPosition()), view);
        }
    }

    public void setAdapterListener(OnItemClickListener<Booking> listener) {
        this.onItemClickListener = listener;
    }
}
