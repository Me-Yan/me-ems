package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2018/12/18.
 * 班级
 */
public class ClazzDTO implements Serializable {

    private static final long serialVersionUID = -2204942443275369743L;

    private Integer clazzId;    //  班级id
    private String gradeName;    //  年级
    private String clazzName;   //  班级名
    private Integer professionId;   // 专业id
    private String active;      // 作废, 有效
    private Date createDate;    //  创建时间
    private String createBy;    //  创建人

    // for view or operation
    private Integer facultyId;
    private String facultyName;
    private String facultyActive;
    private String professionName;
    private String professionActive;
    private Integer clazzCount;

    public Integer getClazzCount() {
        return clazzCount;
    }

    public void setClazzCount(Integer clazzCount) {
        this.clazzCount = clazzCount;
    }

    public Integer getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(Integer facultyId) {
        this.facultyId = facultyId;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String getFacultyActive() {
        return facultyActive;
    }

    public void setFacultyActive(String facultyActive) {
        this.facultyActive = facultyActive;
    }

    public String getProfessionName() {
        return professionName;
    }

    public void setProfessionName(String professionName) {
        this.professionName = professionName;
    }

    public String getProfessionActive() {
        return professionActive;
    }

    public void setProfessionActive(String professionActive) {
        this.professionActive = professionActive;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public Integer getClazzId() {
        return clazzId;
    }

    public void setClazzId(Integer clazzId) {
        this.clazzId = clazzId;
    }

    public String getClazzName() {
        return clazzName;
    }

    public void setClazzName(String clazzName) {
        this.clazzName = clazzName;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public Integer getProfessionId() {
        return professionId;
    }

    public void setProfessionId(Integer professionId) {
        this.professionId = professionId;
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
