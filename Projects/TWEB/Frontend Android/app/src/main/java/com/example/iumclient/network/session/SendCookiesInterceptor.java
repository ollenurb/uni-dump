package com.example.iumclient.network.session;

import com.example.iumclient.util.ApplicationStorage;

import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.HashSet;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

public class SendCookiesInterceptor implements Interceptor {
    @NotNull
    @Override
    public Response intercept(@NotNull Chain chain) throws IOException {
        Request.Builder builder = chain.request().newBuilder();
        HashSet<String> cookies = ApplicationStorage.getCookiesData();

        Request original = chain.request();
        // Add coookies headers only if there are any in the session storage
        if (!cookies.isEmpty()) {
            for (String cookie : cookies) {
                builder.addHeader("Cookie", cookie);
            }
        }
        return chain.proceed(builder.build());
    }
}
