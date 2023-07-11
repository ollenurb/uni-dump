package com.example.iumclient.pages.loginpage;

public interface LoginContract {

    interface LoginActivityView {
        void showLoginProgressSnack(boolean isShown);
        void closeActivity();
        void showToastMessage(String message);
        String getEmailValue();
        String getPasswordValue();

    }

    interface LoginPresenterInterface {
        void onLoginBtnClicked();
        void dispose();
    }

}
