package com.example.iumclient.pages.loginpage;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;
import com.example.iumclient.R;
import com.example.iumclient.pages.mainpage.MainPageView;
import com.example.iumclient.util.ApplicationUtils;
import com.google.android.material.snackbar.Snackbar;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class LoginView extends AppCompatActivity implements LoginContract.LoginActivityView {

    private LoginContract.LoginPresenterInterface loginPresenter;

    // Bind View components with ButterKnife library
    @BindView(R.id.login_activity_edtEmail)
    EditText edtEmail;
    @BindView(R.id.login_activity_edtPassword)
    EditText edtPassword;
    private Snackbar loginProgressSnackBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_view);

        loginPresenter = new LoginPresenter(this);
        ButterKnife.bind(this);
        loginProgressSnackBar = createCustomSnackBar();
    }

    // Creates a custom SnackBar with indefinite circled progress bar
    private Snackbar createCustomSnackBar() {
        Snackbar retVal = Snackbar.make(findViewById(R.id.login_activity_root), R.string.logging_in_snackbar, Snackbar.LENGTH_INDEFINITE);
        ViewGroup contentLay = (ViewGroup) retVal.getView().findViewById(com.google.android.material.R.id.snackbar_text).getParent();
        ProgressBar item = new ProgressBar(this);
        contentLay.addView(item);
        return retVal;
    }

    @OnClick({R.id.login_activity_btnLogin})
    void onBtnLoginClick() {
        loginPresenter.onLoginBtnClicked();
    }

    @Override
    public void showLoginProgressSnack(boolean isShown) {
        if(isShown) {
            loginProgressSnackBar.show();
        } else {
            loginProgressSnackBar.dismiss();
        }
    }

    @Override
    public void closeActivity() {
        finish();
    }

    @Override
    public void showToastMessage(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    /**
     * Get the EditText email or username value
     * @return The value of the EditTextView that contains the email or username
     */
    @Override
    public String getEmailValue() {
        return edtEmail.getText().toString();
    }

    /**
     * Get the EditText Password value
     * @return The value of the EditTextView that contains the password
     */
    @Override
    public String getPasswordValue() {
        String plainPwd = edtPassword.getText().toString();
        return ApplicationUtils.toMD5(plainPwd);
    }

    @Override
    protected void onDestroy() {
        loginPresenter.dispose();
        super.onDestroy();
    }
}
