package com.example.iumclient.pages.historypage;

import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.iumclient.R;
import com.example.iumclient.beans.Booking;
import com.example.iumclient.util.OnItemClickListener;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import butterknife.BindView;
import butterknife.ButterKnife;

public class HistoryViewAdapter extends RecyclerView.Adapter<HistoryViewAdapter.ViewHolder> {

    private ArrayList<Booking> bookingList;
    private OnItemClickListener<Booking> clickListener;
    private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

    public HistoryViewAdapter(ArrayList<Booking> bookingList) {
        this.bookingList = bookingList;
    }

    @NonNull
    @Override
    public HistoryViewAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.history_card_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull HistoryViewAdapter.ViewHolder holder, int position) {
        Booking currentBooking = bookingList.get(position);
        // Course or teacher could be null, check if null and place a default placeholder
        if (currentBooking.getCourse() == null) {
            holder.courseTitle.setText(R.string.deleted_teacher);
            holder.courseTitle.setTypeface(holder.courseTitle.getTypeface(), Typeface.ITALIC);
        } else {
            holder.courseTitle.setText(currentBooking.getCourse().getTitle());
            holder.courseTitle.setTypeface(holder.courseTitle.getTypeface(), Typeface.NORMAL);
        }

        if (currentBooking.getTeacher() == null) {
            holder.teacherName.setText(R.string.deleted_course);
            holder.teacherName.setTypeface(holder.courseTitle.getTypeface(), Typeface.ITALIC);
        } else {
            holder.teacherName.setText(currentBooking.getTeacher().getNameSurname());
            holder.teacherName.setTypeface(holder.courseTitle.getTypeface(), Typeface.NORMAL);
        }

        holder.date.setText(format.format(currentBooking.getDate()));
        holder.hour.setText(currentBooking.getPrintableHour());
        if(currentBooking.isDone()) {
            holder.stateImage.setImageResource(R.drawable.ic_baseline_check_circle_24_green);
        } else if(currentBooking.isUnbooked()) {
            holder.stateImage.setImageResource(R.drawable.ic_baseline_cancel_24_red);
        } else {
            holder.stateImage.setImageResource(R.drawable.ic_baseline_event_available_24_black);
        }
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
        @BindView(R.id.history_card_course_title) TextView courseTitle;
        @BindView(R.id.history_card_teacher) TextView teacherName;
        @BindView(R.id.history_card_date) TextView date;
        @BindView(R.id.history_card_hour_label) TextView hour;
        @BindView(R.id.history_card_state_icon) ImageView stateImage;

        ViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
            view.setOnClickListener(this);
        }
        @Override
        public void onClick(View view) {
            clickListener.onItemClicked(bookingList.get(getAdapterPosition()), view);
        }
    }

    public void setClickListener(OnItemClickListener<Booking> cardClickListener) {
        this.clickListener = cardClickListener;
    }
}
