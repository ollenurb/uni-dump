package com.example.iumclient.beans;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ServiceResponse<T> {
    @SerializedName("isError")
    @Expose
    private boolean isError;

    @SerializedName("status")
    @Expose
    private int status;

    @SerializedName("message")
    @Expose
    private String message;

    @SerializedName("data")
    @Expose
    private T data;

    public ServiceResponse() {}

    public ServiceResponse(boolean isError, int status, String message, T data) {
        this.isError = isError;
        this.status = status;
        this.data = data;
        this.message = message;
    }

    public boolean isError() {
        return isError;
    }

    public T getData() {
        return data;
    }

    public String getMessage() {
        return message;
    }

}
