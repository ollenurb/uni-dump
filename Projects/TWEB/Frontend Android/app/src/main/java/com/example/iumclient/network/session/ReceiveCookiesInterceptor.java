package com.example.iumclient.network.session;

import android.util.Log;

import com.example.iumclient.util.ApplicationStorage;

import java.io.IOException;
import java.util.HashSet;

import okhttp3.Interceptor;
import okhttp3.Response;

public class ReceiveCookiesInterceptor implements Interceptor {
    @Override
    public Response intercept(Chain chain) throws IOException {
        Response originalResponse = chain.proceed(chain.request());

        if (!originalResponse.headers("Set-Cookie").isEmpty()) {
            // If already on storage, retrieve them, if not get empty set
            HashSet<String> cookies = ApplicationStorage.getCookiesData();
            // Add the new cookie headers
            cookies.addAll(originalResponse.headers("Set-Cookie"));
            // Save new cookies to SP
            ApplicationStorage.saveCookiesData(cookies);
        }

        return originalResponse;
    }
}
