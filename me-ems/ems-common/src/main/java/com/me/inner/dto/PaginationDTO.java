package com.me.inner.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Me on 2018/9/4.
 */
public class PaginationDTO implements Serializable {

    private static final long serialVersionUID = 3829496979122277519L;

    private Integer totalPage;
    private Integer count;
    private Integer curPage;
    private Integer begin;
    private Integer limit;
    private List dataList;

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCurPage() {
        return curPage;
    }

    public void setCurPage(Integer curPage) {
        this.curPage = curPage;
    }

    public Integer getBegin() {
        return begin;
    }

    public void setBegin(Integer begin) {
        this.begin = begin;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }
}
