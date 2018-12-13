package com.me.inner.handle;

import com.me.inner.dto.BaseUserDetails;
import com.me.inner.dto.LoginHistorySecDTO;
import com.me.inner.service.SecurityService;
import com.me.inner.token.CustomAuthenticationToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Me on 2018/8/18.
 */
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private static Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandler.class);

    @Autowired
    private SecurityService securityService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication authentication)
            throws ServletException, IOException {
        logger.debug("Execute Method onAuthenticationSuccess...");

        CustomAuthenticationToken customAuthenticationToken = (CustomAuthenticationToken) authentication;
        BaseUserDetails userDetails = (BaseUserDetails) customAuthenticationToken.getPrincipal();

        saveLoginHistory(request, userDetails.getUsername());

        String homePage = userDetails.getHomePage();

        if (null != homePage) {
            StringBuilder basePath = new StringBuilder()
                    .append(request.getScheme())
                    .append("://")
                    .append(request.getServerName())
                    .append(":")
                    .append(request.getServerPort())
                    .append(request.getContextPath());
            if (homePage.startsWith("/")) {
                basePath.append(homePage);
            } else {
                basePath.append("/")
                        .append(homePage);
            }

            response.sendRedirect(basePath.toString());

            return;
        }

        super.onAuthenticationSuccess(request, response, authentication);
    }

    private void saveLoginHistory(HttpServletRequest request, String username) {
        logger.debug("Execute Method saveLoginHistory...");

        String ip = getIpAddress(request);

        LoginHistorySecDTO loginHistory = new LoginHistorySecDTO();
        loginHistory.setUsername(username);
        loginHistory.setIp(ip);
        loginHistory.setStatus("Passed");
        loginHistory.setCreateDate(new Date());

        securityService.saveLoginHistory(loginHistory);
    }

    private String getIpAddress(HttpServletRequest request) {
        logger.debug("Execute Method getIpAddress...");

        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}
