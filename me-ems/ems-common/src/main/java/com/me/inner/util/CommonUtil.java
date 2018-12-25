package com.me.inner.util;

import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.PaginationDTO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Me on 2018/9/4.
 */
public class CommonUtil {

    private static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    public static String encodePassword(String originPassword) {
        logger.debug("Execute Method encodePassword...");

        return new BCryptPasswordEncoder(11).encode(originPassword);
    }

    public static boolean matches(String rawPassword, String encodedPassword) {
        logger.debug("Execute Method matches...");

        return new BCryptPasswordEncoder(11).matches(rawPassword, encodedPassword);
    }

    public static PaginationDTO packagePagination(HttpServletRequest request) {
        logger.debug("Execute Method packagePagination...");

        PaginationDTO pagination = new PaginationDTO();

        Integer curPage = 0;
        Integer limit = CommonConstant.Pagination.DEFAULT_LIMIT;
        Integer begin = 0;

        String curPageStr = request.getParameter(CommonConstant.Pagination.CURRENT_PAGE);
        if (StringUtils.isBlank(curPageStr)) {
            curPage = Integer.valueOf(curPageStr);
        }
        String limitStr = request.getParameter(CommonConstant.Pagination.LIMIT);
        if (StringUtils.isBlank(limitStr)) {
            limit = Integer.valueOf(limitStr);
        }

        begin = curPage*limit;

        pagination.setCurPage(curPage);
        pagination.setLimit(limit);
        pagination.setBegin(begin);

        return pagination;
    }
}
