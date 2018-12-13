package com.me.inner.dto;

import java.io.Serializable;

/**
 * Created by Me on 2018/9/4.
 */
public class ResponseData implements Serializable {

    private static final long serialVersionUID = 8622400871012418599L;

    private Boolean success;
    private String message;

    public ResponseData(){}

    public ResponseData(Boolean success) {
        this.success = success;
    }

    public ResponseData(Boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
