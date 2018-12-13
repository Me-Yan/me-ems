package com.me.inner.dto;

import java.io.Serializable;

/**
 * Created by Me on 2018/9/16.
 */
public class Role2ResSecDTO implements Serializable {

    private static final long serialVersionUID = -5863717270694857747L;

    private Integer roleId;
    private String roleName;
    private Integer resourceId;
    private String path;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
