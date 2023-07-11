package com.example.iumclient.pages.startup;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.BounceInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.ImageView;

import com.example.iumclient.R;
import com.example.iumclient.pages.mainpage.MainPageView;
import com.example.iumclient.util.ApplicationStorage;
import com.example.iumclient.util.GlobalApplication;

import java.util.Timer;
import java.util.TimerTask;

import butterknife.BindView;
import butterknife.ButterKnife;

public class StartupView extends AppCompatActivity {

    @BindView(R.id.startup_logo)
    ImageView logo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.startup_view);
        ButterKnife.bind(this);

        // Start the MainPage activity
        Intent activityToStart = new Intent(GlobalApplication.getAppContext(), MainPageView.class);
        activityToStart.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);

        logo.animate()
                .scaleX(1.8f)
                .scaleY(1.8f)
                .setInterpolator(new OvershootInterpolator())
                .setDuration(1000);

        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                startActivity(activityToStart);
                finish();
            }
        }, 1500);

    }

}
