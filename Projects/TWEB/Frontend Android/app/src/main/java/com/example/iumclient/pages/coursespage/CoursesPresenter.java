package com.example.iumclient.pages.coursespage;

import com.example.iumclient.beans.Course;
import com.example.iumclient.beans.ServiceResponse;
import com.example.iumclient.network.DataModelInterface;
import com.example.iumclient.network.NetworkServiceClient;
import com.example.iumclient.util.OnItemClickListener;

import java.util.ArrayList;
import java.util.List;

import butterknife.OnItemClick;
import io.reactivex.observers.DisposableObserver;

public class CoursesPresenter implements CoursesContract.CoursesPresenterInterface {

    private CoursesContract.CoursesFragmentView view;
    private DataModelInterface dataModel;
    private DisposableObserver<ServiceResponse<List<Course>>> networkCallObserver;

    CoursesPresenter(CoursesContract.CoursesFragmentView view) {
        this.view = view;
        dataModel = new NetworkServiceClient();
    }

    private DisposableObserver<ServiceResponse<List<Course>>> getDisposableObserver() {
        return new DisposableObserver<ServiceResponse<List<Course>>>() {
            @Override
            public void onNext(ServiceResponse<List<Course>> listServiceResponse) {
                if(listServiceResponse.getData() != null) {
                    view.changeRecyclerData(new ArrayList<>(listServiceResponse.getData()));
                } else {
                    view.showToastMessage(listServiceResponse.getMessage());
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

    /**
     * Fill RecyclerView is called from the view whenever it needs fresh data to be loaded into the RecyclerView
     * This methods launches the fetching process from the model within an Observable stream, then upon
     * retrieval of data the callback(s) of the Observer are executed.
     */
    @Override
    public void refreshRecyclerView() {
        view.showRefreshing(true);

        networkCallObserver = dataModel
                .getCourses()
                .subscribeWith(getDisposableObserver());
    }

    @Override
    public void dispose() {
        if(networkCallObserver != null) {
            networkCallObserver.dispose();
        }
    }


}
