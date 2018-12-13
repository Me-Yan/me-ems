package com.me.inner.constant;

/**
 * Created by Me on 2018/9/4.
 */
public class CommonConstant {

    /**
     * 分页请求
     */
    public interface Pagination {
        String CURRENT_PAGE = "curPage";
        String LIMIT = "limit";
        Integer DEFAULT_LIMIT = 10;
    }

    /**
     * Yes or No
     */
    public interface YES_NO {
        String YES = "Y";
        String NO = "N";
    }

    /**
     * X-Frame-Options: DENY, SAMEORIGIN, ALLOW-FROM
     */
    public interface FrameOption {
        String DENY = "DENY";
        String SAMEORIGIN = "SAMEORIGIN";
        String ALLOW_FROM = "ALLOW-FROM";
    }

    /**
     * Active: A, I
     */
    public interface IN_ACTIVE {
        String ACTIVE = "A";
        String IN_ACTIVE = "I";
    }

    /**
     * datetime pattern
     */
    public interface Pattern {
        String YYYY_MM_DD = "yyyy-MM-dd";
        String DD_MM_YYYY = "dd-MM-yyyy";
        String YYYY_MM_DD_HH_MM = "yyyy-MM-dd HH:mm";
        String DD_MM_YYYY_HH_MM = "dd-MM-yyyy HH:mm";

        String YYYYMMDD = "yyyy/MM/dd";
        String DDMMYYYY = "dd/MM/yyyy";
        String YYYYMMDD_HH_MM = "yyyy/MM/dd HH:mm";
        String DDMMYYYY_HH_MM = "dd/MM/yyyy HH:mm";

        String HH_MM = "HH:mm";
    }

    public interface CodeStatus {
        String ACTIVE = "A";        // 可使用且可修改的
        String IN_ACTIVE = "I";    // 不可使用的
        String STABLED = "S";      // 可使用且不可修改的
    }
}
