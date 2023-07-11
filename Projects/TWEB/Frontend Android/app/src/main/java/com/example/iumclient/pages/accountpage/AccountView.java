package com.example.iumclient.pages.accountpage;


import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.example.iumclient.R;
import com.example.iumclient.beans.User;
import com.example.iumclient.util.ApplicationStorage;

import butterknife.BindView;
import butterknife.ButterKnife;

public class AccountView extends Fragment {

    @BindView(R.id.account_view_name) TextView tvName;
    @BindView(R.id.account_view_email) TextView tvEmail;
    @BindView(R.id.account_view_number) TextView tvNumber;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view =  inflater.inflate(R.layout.account_view, container, false);
        ButterKnife.bind(this, view);

        User user = ApplicationStorage.getUserSession();
        tvName.setText(user.getNameSurname());
        tvEmail.setText(user.getEmail());
        tvNumber.setText(user.getPrintableId());
        return view;
    }
}
