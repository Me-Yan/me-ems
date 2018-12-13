package com.me.inner.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Me on 2018/9/23.
 */
public class DateUtil {

    private static Logger logger = LoggerFactory.getLogger(DateUtil.class);

    public static String formatDate(Date date, String pattern) throws Exception {
        logger.debug("Execute Method formatDate...");

        DateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            return dateFormat.format(date);
        } catch (Exception e) {
            logger.error("occur a error when format date");
            throw e;
        }
    }

    public static Date parseDate(String date, String pattern) throws Exception {
        logger.debug("Execute Method parseDate...");

        DateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            return dateFormat.parse(date);
        } catch (Exception e) {
            logger.error("occur a error when parse date");
            throw e;
        }
    }
}
