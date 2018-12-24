package com.me.inner.dto;

import java.io.Serializable;

/**
 * Created by yanyanghong on 2018/12/24.
 */
public class PasswordVO implements Serializable {

    private static final long serialVersionUID = 2098781328692639209L;

    private String oldPassword;
    private String newPassword;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
