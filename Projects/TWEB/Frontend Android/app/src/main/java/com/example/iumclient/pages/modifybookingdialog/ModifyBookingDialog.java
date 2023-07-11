package com.example.iumclient.pages.modifybookingdialog;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

import com.example.iumclient.R;
import com.example.iumclient.beans.Booking;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class ModifyBookingDialog extends DialogFragment implements ModifyBookingContract.ModifyBookingView {

    @BindView(R.id.modify_booking_dialog_set_done) Button setDoneButton;
    @BindView(R.id.modify_booking_dialog_unbook) Button unbookButton;

    Booking booking;
    ModifyBookingContract.ModifyBookingPresenterInterface presenter;
    DialogInterface.OnDismissListener dismissListener;

    public ModifyBookingDialog(Booking booking) {
        this.booking = booking;
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
        presenter = new ModifyBookingPresenter(this);
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        View view = requireActivity().getLayoutInflater().inflate(R.layout.modify_booking_dialog, null);
        ButterKnife.bind(this, view);
        builder.setView(view);

        if(booking.isUnbooked() || booking.isDone()) {
            setDoneButton.setVisibility(View.INVISIBLE);
            unbookButton.setVisibility(View.INVISIBLE);
            builder.setMessage("This lesson has been already modified");
        }

        return builder.create();
    }


    @OnClick(R.id.modify_booking_dialog_cancel)
    void onCancelClick(View view) {
        this.dismiss();
    }

    @OnClick(R.id.modify_booking_dialog_set_done)
    void onSetDoneClick() {
        presenter.setDoneBooking(booking);
    }

    @OnClick(R.id.modify_booking_dialog_unbook)
    void onUnbookClick() {
        presenter.unbookBooking(booking);
    }

    @Override
    public void showToastMessage(String message) {
        Toast.makeText(this.getContext(), message, Toast.LENGTH_LONG).show();
    }

    @Override
    public void onDestroy() {
        if(!booking.isUnbooked() && !booking.isDone()) {
            dismissListener.onDismiss(getDialog());
        }
        presenter.dispose();
        super.onDestroy();
    }

    public void setDismissListener(DialogInterface.OnDismissListener dismissListener) {
        this.dismissListener = dismissListener;
    }
}
