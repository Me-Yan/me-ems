package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2018/12/18.
 */
public class SequenceDTO implements Serializable {

    private static final long serialVersionUID = 6264807129327399629L;

    private String type;    // 老师或者学生
    private String lastNumber;
    private String nextNumber;
    private Integer nextSequence;
    private Date actionDate;

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
