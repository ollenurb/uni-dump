package com.example.iumclient.pages.historypage;

import com.example.iumclient.beans.Booking;
import com.example.iumclient.beans.ServiceResponse;
import com.example.iumclient.network.DataModelInterface;
import com.example.iumclient.network.NetworkServiceClient;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.observers.DisposableObserver;

public class HistoryPresenter implements HistoryContract.HistoryPresenterInterface {

    private HistoryContract.HistoryFragmentView view;
    private DisposableObserver<ServiceResponse<List<Booking>>> networkCallObserver;
    private DataModelInterface dataModel;

    public HistoryPresenter(HistoryContract.HistoryFragmentView view) {
        this.view = view;
        dataModel = new NetworkServiceClient();
    }

    @Override
    public void refreshRecyclerView() {
        view.showRefreshing(true);
        networkCallObserver = dataModel
                .getHistory()
                .subscribeWith(getDisposableObserver());
    }

    @Override
    public void dispose() {
        if(networkCallObserver != null) {
            networkCallObserver.dispose();
        }
    }

    private DisposableObserver<ServiceResponse<List<Booking>>> getDisposableObserver() {
        return new DisposableObserver<ServiceResponse<List<Booking>>>() {
            @Override
            public void onNext(ServiceResponse<List<Booking>> serviceResponse) {
                if(serviceResponse.getData() != null) {
                    view.changeRecyclerData(new ArrayList<>(serviceResponse.getData()));
                } else {
                    view.showToastMessage(serviceResponse.getMessage());
                }
            }

            @Override
            public void onError(Throwable e) {
                view.showRefreshing(false);
                view.showToastMessage(e.getMessage());
                e.printStackTrace();
                networkCallObserver.dispose();
            }

            @Override
            public void onComplete() {
                networkCallObserver.dispose();
                view.showRefreshing(false);
            }
        };
    }

}
