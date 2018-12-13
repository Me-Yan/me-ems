package com.me.inner.manager;

import com.me.inner.dto.BaseUserDetails;
import com.me.inner.token.CustomAuthenticationToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.util.CollectionUtils;

import java.util.Collection;
import java.util.List;

/**
 * Created by Me on 2018/9/16.
 */
public class AccessSecurityManager implements AccessDecisionManager {

    private Logger logger = LoggerFactory.getLogger(AccessSecurityManager.class);

    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
        logger.debug("Execute Method decide...");

        if (!(authentication instanceof CustomAuthenticationToken) || CollectionUtils.isEmpty(configAttributes)) {
            return;
        }

        BaseUserDetails userDetails = (BaseUserDetails) authentication.getPrincipal();

        List<GrantedAuthority> authorities = userDetails.getAuthorities();
        if (!CollectionUtils.isEmpty(configAttributes) && !CollectionUtils.isEmpty(authorities)) {

            for (GrantedAuthority authority : authorities) {
                for (ConfigAttribute configAttribute : configAttributes) {
                    String authorityRoleName = authority.getAuthority();
                    String configRoleName = configAttribute.getAttribute();
                    if (authorityRoleName.equals(configRoleName)){
                        return;
                    }
                }
            }
        }
        if (CollectionUtils.isEmpty(configAttributes) && !CollectionUtils.isEmpty(authorities)) {
            return;
        }

        throw new AccessDeniedException("Access Denied.");
    }

    public boolean supports(ConfigAttribute attribute) {
        return true;
    }

    public boolean supports(Class<?> clazz) {
        return true;
    }
}
