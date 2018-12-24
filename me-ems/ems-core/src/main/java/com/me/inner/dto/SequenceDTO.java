package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2018/12/18.
 */
public class SequenceDTO implements Serializable {

    private static final long serialVersionUID = 6264807129327399629L;

    private String type;    // 老师 学生  辅导员 系统管理员
    private String lastNumber;  //  上一次编号
    private String nextNumber;  //  下一次的编号
    private Integer nextSequence;   // 下一次的序列号
    private Date actionDate;    // 操作时间

    public SequenceDTO(){}

    public SequenceDTO(String type, String lastNumber, String nextNumber, Integer nextSequence, Date actionDate) {
        this.type = type;
        this.lastNumber = lastNumber;
        this.nextNumber = nextNumber;
        this.nextSequence = nextSequence;
        this.actionDate = actionDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLastNumber() {
        return lastNumber;
    }

    public void setLastNumber(String lastNumber) {
        this.lastNumber = lastNumber;
    }

    public String getNextNumber() {
        return nextNumber;
    }

    public void setNextNumber(String nextNumber) {
        this.nextNumber = nextNumber;
    }

    public Integer getNextSequence() {
        return nextSequence;
    }

    public void setNextSequence(Integer nextSequence) {
        this.nextSequence = nextSequence;
    }

    public Date getActionDate() {
        return actionDate;
    }

    public void setActionDate(Date actionDate) {
        this.actionDate = actionDate;
    }
}
