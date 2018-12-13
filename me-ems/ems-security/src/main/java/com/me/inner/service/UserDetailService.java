package com.me.inner.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.annotation.Resource;

/**
 * Created by Me on 2018/8/18.
 */
public class UserDetailService implements UserDetailsService {

    private Logger logger = LoggerFactory.getLogger(UserDetailService.class);

    @Resource
    private SecurityService securityService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.debug("Execute Method loadUserByUsername.........");
        UserDetails user = null;
        try {
            user = securityService.getUserByUsername(username);
            if (user == null) {
                throw new UsernameNotFoundException("can not find the user.");
            }
        } catch (UsernameNotFoundException e) {
            logger.error("exception that not find the user ", e);
            throw e;
        }
        return user;
    }
}
