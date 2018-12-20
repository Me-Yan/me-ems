package com.me.inner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Me on 2018/12/18.
 * 系统管理员功能界面
 */
@Controller
@RequestMapping("super")
public class SuperController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SuperController.class);

    @RequestMapping("index")
    public ModelAndView index() {
        logger.debug("Execute Method index...");

        return new ModelAndView("superAdmin/index");
    }
}
