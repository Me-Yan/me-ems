package com.me.inner.core;

import com.google.common.collect.Lists;
import com.me.inner.dto.Role2ResSecDTO;
import com.me.inner.service.SecurityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.CollectionUtils;
import org.springframework.util.PathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * Created by Me on 2018/9/16.
 */
public class CustomSecurityMetadataSource implements InitializingBean, FilterInvocationSecurityMetadataSource {

    private Logger logger = LoggerFactory.getLogger(CustomSecurityMetadataSource.class);

    @Autowired
    private SecurityService securityService;

    private PathMatcher urlMatcher;
    private List<Role2ResSecDTO> role2RoleList;

    public CustomSecurityMetadataSource() {
        this.urlMatcher = new AntPathMatcher();
    }

    public void afterPropertiesSet() throws Exception {
        logger.debug("Execute Method afterPropertiesSet...");

        this.role2RoleList = securityService.listRole2Resource();
    }

    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        logger.debug("Execute Method getAttributes...");

        if (!CollectionUtils.isEmpty(role2RoleList)) {
            Collection<ConfigAttribute> attributes = Lists.newArrayList();
            String requestUrl = ((FilterInvocation) object).getRequestUrl();
            for (Role2ResSecDTO role2Res : role2RoleList) {
                if ("/**".equals(requestUrl) || "**".equals(requestUrl) || urlMatcher.match(requestUrl, role2Res.getPath())) {
                    ConfigAttribute configAttribute = new SecurityConfig(role2Res.getRoleName());
                    attributes.add(configAttribute);
                }
            }

            return attributes;
        }
        return null;
    }

    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    public boolean supports(Class<?> clazz) {
        return true;
    }
}
