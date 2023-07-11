package com.example.iumclient.pages.modifybookingdialog;

import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.ServiceResponse;
import com.example.iumclient.network.DataModelInterface;
import com.example.iumclient.network.NetworkServiceClient;

import io.reactivex.observers.DisposableObserver;

public class ModifyBookingPresenter implements ModifyBookingContract.ModifyBookingPresenterInterface {

    ModifyBookingContract.ModifyBookingView view;
    private DisposableObserver<ServiceResponse<Object>> modifyBookingsNetworkObserver;
    private DataModelInterface dataModel;

    public ModifyBookingPresenter(ModifyBookingContract.ModifyBookingView view) {
        this.view = view;
        dataModel = new NetworkServiceClient();
    }

    private DisposableObserver<ServiceResponse<Object>> getModifyBookingsObserver() {
        return new DisposableObserver<ServiceResponse<Object>>() {
            @Override
            public void onNext(ServiceResponse<Object> serviceResponse) {
                view.showToastMessage(serviceResponse.getMessage());
            }

            @Override
            public void onError(Throwable e) {
                view.showToastMessage(e.getMessage());
                e.printStackTrace();
                modifyBookingsNetworkObserver.dispose();
            }

            @Override
            public void onComplete() {
                view.dismiss();
            }
        };
    }

    @Override
    public void unbookBooking(Booking booking) {
        modifyBookingsNetworkObserver = dataModel
                .modifyBooking("unbook", booking.getId())
                .subscribeWith(getModifyBookingsObserver());
    }

    @Override
    public void setDoneBooking(Booking booking) {
        modifyBookingsNetworkObserver = dataModel
                .modifyBooking("done", booking.getId())
                .subscribeWith(getModifyBookingsObserver());
    }

    @Override
    public void dispose() {
        if(modifyBookingsNetworkObserver != null) {
            modifyBookingsNetworkObserver.dispose();
        }
    }
}
