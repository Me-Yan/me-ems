package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2019/1/7.
 */
public class User2RoleSecDTO implements Serializable {

    private static final long serialVersionUID = 3930701947936415657L;

    private Integer id;
    private Integer userId;
    private Integer roleId;
    private Date createDate;
    private String createBy;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
