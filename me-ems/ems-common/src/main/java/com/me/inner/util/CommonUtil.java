package com.me.inner.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Created by Me on 2018/9/4.
 */
public class CommonUtil {

    private static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    public static String encodePassword(String originPassword) {
        logger.debug("Execute Method encodePassword...");

        return new BCryptPasswordEncoder(11).encode(originPassword);
    }
}
