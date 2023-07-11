package com.example.iumclient.pages.coursespage;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.iumclient.R;
import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.Course;
import com.example.iumclient.util.OnItemClickListener;

import java.util.ArrayList;
import butterknife.BindView;
import butterknife.ButterKnife;

public class CoursesViewAdapter extends RecyclerView.Adapter<CoursesViewAdapter.ViewHolder> {

    private ArrayList<Course> courseList;
    private OnItemClickListener<Course> cardClickListener;

    CoursesViewAdapter(ArrayList<Course> courseList) {
        this.courseList = courseList;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.courses_card_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Course currentCourse = courseList.get(position);
        holder.itemTitle.setText(currentCourse.getTitle());
        holder.itemLetter.setText(String.valueOf(currentCourse.getTitle().charAt(0)));
        holder.professorsNumber.setText(String.valueOf(currentCourse.getAvailableTeachers()));
    }

    @Override
    public int getItemCount() {
        return courseList.size();
    }

    void updateData(ArrayList<Course> newData) {
        courseList.clear();
        courseList.addAll(newData);
        notifyDataSetChanged();
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, View.OnLongClickListener {
        @BindView(R.id.courses_card_item_title_placeholder) TextView itemTitle;
        @BindView(R.id.courses_card_item_letter_placeholder) TextView itemLetter;
        @BindView(R.id.courses_card_item_professors_number_placeholder) TextView professorsNumber;

        ViewHolder(View view) {
            super(view);
            view.setOnClickListener(this);
            view.setOnLongClickListener(this);
            ButterKnife.bind(this, view);
        }

        @Override
        public void onClick(View view) {
            cardClickListener.onItemClicked(courseList.get(getAdapterPosition()), view);
        }

        @Override
        public boolean onLongClick(View view) {
            cardClickListener.onItemLongClicked(courseList.get(getAdapterPosition()), view);
            return false;
        }
    }

    public void setAdapterListener(OnItemClickListener<Course> listener) {
        this.cardClickListener = listener;
    }

}
