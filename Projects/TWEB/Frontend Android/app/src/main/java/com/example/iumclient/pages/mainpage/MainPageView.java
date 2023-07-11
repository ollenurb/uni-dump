package com.example.iumclient.pages.mainpage;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import com.example.iumclient.R;
import com.example.iumclient.pages.accountpage.AccountView;
import com.example.iumclient.pages.coursespage.CoursesView;
import com.example.iumclient.pages.historypage.HistoryView;
import com.example.iumclient.pages.loginpage.LoginView;
import com.example.iumclient.util.ApplicationStorage;
import com.example.iumclient.util.GlobalApplication;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import butterknife.BindView;
import butterknife.ButterKnife;

public class MainPageView extends AppCompatActivity {

    @BindView(R.id.main_activity_bottom_nav)
    BottomNavigationView bottomNav;

    @BindView(R.id.main_activity_actionbar)
    Toolbar actionbar;

    SharedPreferences.OnSharedPreferenceChangeListener sessionStorageListener;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_page_view);
        ButterKnife.bind(this);
        bottomNav.setOnNavigationItemSelectedListener(navListener);
        changeFragmentView(new CoursesView());
        setSupportActionBar(actionbar);
        // Setup listener to check if sessionStorage value has been changed
        sessionStorageListener = (sharedPreferences, s) -> {
            setLoggedVisibility(sharedPreferences.getInt("id", -1) != -1);
        };
        ApplicationStorage.setSessionListener(sessionStorageListener);
    }

    @Override
    public void onBackPressed() {
        this.finish();
    }

    private void changeFragmentView(Fragment fragment) {
        String backStateName = fragment.getClass().getName();

        FragmentManager manager = getSupportFragmentManager();
        boolean fragmentPopped = manager.popBackStackImmediate(backStateName, 0);
        FragmentTransaction ft = manager.beginTransaction();

        if (!fragmentPopped) {
            ft.replace(R.id.main_activity_frame_layout, fragment);
            ft.addToBackStack(backStateName);
            ft.commit();
        }
    }

    /**
    * Set the listener of the bottom NavigationBar, it is responsible for the switching of
    * the fragment objects by calling  changeFragmentView
    **/
    private BottomNavigationView.OnNavigationItemSelectedListener navListener =
            menuItem -> {
                Fragment selectedView = null;

                // Only if the selected item isn't already selected change fragment, don't do anything otherwise
                if(menuItem.getItemId() != bottomNav.getSelectedItemId()) {
                    switch (menuItem.getItemId()) {
                        case R.id.bottom_nav_account:
                            selectedView = new AccountView();
                            actionbar.setTitle("Your account");
                            break;

                        case R.id.bottom_nav_history:
                            selectedView = new HistoryView();
                            actionbar.setTitle("History");
                            break;

                        case R.id.bottom_nav_courses:
                            selectedView = new CoursesView();
                            actionbar.setTitle("Available courses");
                            break;
                    }
                    changeFragmentView(selectedView);
                }
                return true;
            };

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_toolbar, menu);
        return true;
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        // Check if the user has been already authenticated
        setLoggedVisibility(ApplicationStorage.getUserSession().getId() != -1);
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.toolbar_login_btn:
                startActivity(new Intent(GlobalApplication.getAppContext(), LoginView.class));
                return true;

            case R.id.toolbar_logout_btn:
                ApplicationStorage.clearSessionAndCookies();
                changeFragmentView(new CoursesView());
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    /**
     * Change the visibility of the menu items and login/logout button
     */
    public void setLoggedVisibility(boolean isLogged) {
        bottomNav.getMenu().findItem(R.id.bottom_nav_history).setVisible(isLogged);
        bottomNav.getMenu().findItem(R.id.bottom_nav_account).setVisible(isLogged);
        actionbar.getMenu().findItem(R.id.toolbar_login_btn).setVisible(!isLogged);
        actionbar.getMenu().findItem(R.id.toolbar_logout_btn).setVisible(isLogged);
    }

}
