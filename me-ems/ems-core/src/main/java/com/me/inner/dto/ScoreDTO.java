package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2018/12/18.
 */
public class ScoreDTO implements Serializable {

    private static final long serialVersionUID = -7459689563900532906L;

    private Integer scoreId;    // 成绩id
    private Float result;   //  总成绩
    private Float usual;    //  平时成绩
    private Float test;     //  考试成绩
    private String status;  //  状态：作废  有效
    private Integer studentId;  // 学生id
    private Integer subjectId;  //  课程id
    private Integer teacherId;  // 教师id
    private Date createDate;    //  创建时间
    private String createBy;    //  创建人
    private Date updateDate;    //  修改时间
    private String updateBy;    //  修改人

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getScoreId() {
        return scoreId;
    }

    public void setScoreId(Integer scoreId) {
        this.scoreId = scoreId;
    }

    public Float getResult() {
        return result;
    }

    public void setResult(Float result) {
        this.result = result;
    }

    public Float getUsual() {
        return usual;
    }

    public void setUsual(Float usual) {
        this.usual = usual;
    }

    public Float getTest() {
        return test;
    }

    public void setTest(Float test) {
        this.test = test;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
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

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
