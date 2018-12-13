package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.dto.BaseUserDetails;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by Me on 2018/9/16.
 */
@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping("login")
    public ModelAndView login(@RequestParam(name = "error", required = false) String error, HttpServletRequest request, HttpServletResponse response) {
        logger.debug("Execute Method login");

        Map<String, Object> model = Maps.newHashMap();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication!=null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }

        model.put("error", Boolean.FALSE);
        if (null != error) {
            model.put("error", Boolean.TRUE);
        }

        return new ModelAndView("login", model);
    }

    @RequestMapping("home")
    public ModelAndView home() {
        logger.debug("Execute Method home...");

        String homePage = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication!=null) {
            BaseUserDetails userDetails = (BaseUserDetails) authentication.getPrincipal();
            if (userDetails!=null) {
                homePage = userDetails.getHomePage();
            }
        }

        if (StringUtils.isBlank(homePage)) {
            return new ModelAndView("redirect:/error");
        } else {
            if (homePage.startsWith("/")) {
                return new ModelAndView("redirect:" + homePage);
            } else {
                return new ModelAndView("redirect:/" + homePage);
            }
        }
    }

    @RequestMapping("error")
    public ModelAndView error() {
        logger.debug("Execute Method error...");

        return new ModelAndView("error");
    }

    @RequestMapping("accessDenied")
    public ModelAndView accessDenied() {
        logger.debug("Execute Method accessDenied...");

        return new ModelAndView("accessDenied");
    }

    @RequestMapping("logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        logger.debug("Execute Method logout...");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication!=null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }

        return new ModelAndView("redirect:/login");
    }
}
