package com.me.inner.dto;

import java.io.Serializable;

/**
 * Created by yanyanghong on 2018/12/21.
 */
public class CurriculumDTO implements Serializable {

    private static final long serialVersionUID = -5817261420247909889L;

    private Integer curriculumId;   //  课表id
    private Integer subjectId;      //  课程id
    private Integer clazzId;        //  班级id
    private Integer professionId;   //  专业id
    private Integer teacherId;      //  老师id
    private Integer semester;       //  学期
    private String status;          //  课程状态：进行中，取消
    private String createDate;      //  创建时间
    private String createBy;        //  创建人

    public Integer getCurriculumId() {
        return curriculumId;
    }

    public void setCurriculumId(Integer curriculumId) {
        this.curriculumId = curriculumId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getClazzId() {
        return clazzId;
    }

    public void setClazzId(Integer clazzId) {
        this.clazzId = clazzId;
    }

    public Integer getProfessionId() {
        return professionId;
    }

    public void setProfessionId(Integer professionId) {
        this.professionId = professionId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
