package com.example.iumclient.util;

import android.view.View;

public interface OnItemClickListener<T> {
    void onItemClicked(T t, View view);
    void onItemLongClicked(T t, View view);
}