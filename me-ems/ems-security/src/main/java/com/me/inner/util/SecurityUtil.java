package com.me.inner.util;

import com.me.inner.dto.BaseUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Created by Me on 2018/9/17.
 */
public class SecurityUtil {

    private static Logger logger = LoggerFactory.getLogger(SecurityUtil.class);

    public static BaseUserDetails getUserInfo() {
        logger.debug("Execute Method getUserInfo...");

        BaseUserDetails user = (BaseUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user != null) {
            return user;
        }
        return null;
    }
}
