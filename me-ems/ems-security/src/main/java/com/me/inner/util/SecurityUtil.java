package com.me.inner.util;

import com.google.common.collect.Lists;
import com.me.inner.dto.BaseUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.CollectionUtils;

import java.util.List;

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

    public static List<String> listUserAuthority() {
        List<GrantedAuthority> authorityList = getUserInfo().getAuthorities();

        List<String> authorityNameList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(authorityList)) {
            for (GrantedAuthority authority : authorityList) {
                String authorityName = authority.getAuthority();
                authorityNameList.add(authorityName);
            }
        }

        return authorityNameList;
    }
}
