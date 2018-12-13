package com.me.inner.handle;

import com.me.inner.dto.LoginHistorySecDTO;
import com.me.inner.service.SecurityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Me on 2018/8/18.
 */
public class AuthenticationFailHandler extends SimpleUrlAuthenticationFailureHandler {

    private static Logger logger = LoggerFactory.getLogger(AuthenticationFailHandler.class);

    @Autowired
    private SecurityService securityService;

    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {

        String username = request.getParameter("username");

        saveLoginHistory(request, username);

        logger.error("login error...");

        super.onAuthenticationFailure(request, response, exception);

    }

    private void saveLoginHistory(HttpServletRequest request, String username) {
        logger.debug("save login information ...");

        String ip = getIpAddress(request);

        LoginHistorySecDTO loginHistory = new LoginHistorySecDTO();
        loginHistory.setUsername(username);
        loginHistory.setIp(ip);
        loginHistory.setStatus("Failed");
        loginHistory.setCreateDate(new Date());

        securityService.saveLoginHistory(loginHistory);
    }

    private String getIpAddress(HttpServletRequest request) {
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
