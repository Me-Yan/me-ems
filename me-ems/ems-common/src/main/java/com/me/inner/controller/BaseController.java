package com.me.inner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Me on 2018/9/14.
 */
@Controller
@RequestMapping("/")
public class BaseController {

    Logger logger = LoggerFactory.getLogger(BaseController.class);

    @ExceptionHandler
    public ModelAndView exceptionHandler(HttpServletRequest request, Exception ex) {
        logger.error("exception:", ex);

        return new ModelAndView("redirect:/error");
    }
}
