package server.responses;

import com.google.gson.annotations.Expose;

import javax.servlet.http.HttpServletResponse;

public class ServiceResponse <T> {

    @Expose
    private int status;
    @Expose
    private String message;
    @Expose
    private T data;

    public ServiceResponse(int status, String message) {
        this.status = status;
        this.message = message;
    }

    public ServiceResponse(T data) {
        this.data = data;
        this.message = null;
        this.status = HttpServletResponse.SC_OK;
    }

    public ServiceResponse() { }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
        this.message = null;
        this.status = HttpServletResponse.SC_OK;
    }

    public void setError(int status, String message) {
        this.message = message;
        this.status = status;
    }

}
