package com.example.iumclient.pages.loginpage;


import android.content.Context;
import android.util.Log;
import com.example.iumclient.R;
import com.example.iumclient.beans.User;
import com.example.iumclient.beans.ServiceResponse;
import com.example.iumclient.network.DataModelInterface;
import com.example.iumclient.network.NetworkServiceClient;
import com.example.iumclient.util.ApplicationStorage;
import com.example.iumclient.util.GlobalApplication;

import io.reactivex.observers.DisposableObserver;

public class LoginPresenter implements LoginContract.LoginPresenterInterface {

    private boolean hasBeenClicked;
    private Context appContext;
    private DataModelInterface dataModel;
    private LoginContract.LoginActivityView loginActivityView;
    private DisposableObserver<ServiceResponse<User>>  disposableObserver;

    LoginPresenter(LoginContract.LoginActivityView loginActivityView) {
        this.loginActivityView = loginActivityView;
        hasBeenClicked = false;
        appContext = GlobalApplication.getAppContext();
        dataModel = new NetworkServiceClient();
    }

    /**
     * This method gets fired from the view when the user clicks the button,
     * The method has to authenticate the user through the network authentication service
     */
    @Override
    public void onLoginBtnClicked() {
        // Check if the button has been already clicked in order to avoid multiple useless requests
        if(!hasBeenClicked) {
            hasBeenClicked = true;
            loginActivityView.showLoginProgressSnack(true);
            disposableObserver = dataModel
                    .authenticate(loginActivityView.getEmailValue(), loginActivityView.getPasswordValue())
                    .subscribeWith(getDisposableObserver());
        }
    }

    @Override
    public void dispose() {
        if(disposableObserver != null) {
            disposableObserver.dispose();
        }
    }

    private DisposableObserver<ServiceResponse<User>> getDisposableObserver() {
        return new DisposableObserver<ServiceResponse<User>>() {
            @Override
            public void onNext(ServiceResponse<User> authServiceDataServiceResponse) {
                // If the service response doesn't have any error nor has replied with empty data field
                if(authServiceDataServiceResponse.getData() != null) {
                    ApplicationStorage.saveUserSession(authServiceDataServiceResponse.getData());
                    // Show logged in successfully message
                    loginActivityView.showToastMessage(appContext.getString(R.string.logged_in_successfully));
                    loginActivityView.closeActivity();
                } else {
                    // If the service has replied with an error or empty data, shows error message to the user
                    loginActivityView.showToastMessage(authServiceDataServiceResponse.getMessage());
                }
            }

            @Override
            public void onError(Throwable e) {
                Log.e("NetworkError", String.valueOf(e.getLocalizedMessage()));
                loginActivityView.showToastMessage(e.getLocalizedMessage());
                loginActivityView.showLoginProgressSnack(false);
                hasBeenClicked = false;
            }

            @Override
            public void onComplete() {
                loginActivityView.showLoginProgressSnack(false);
                hasBeenClicked = false;
                // This observable is not needed anymore
                disposableObserver.dispose();
            }
        };
    }

}
