package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.constant.Constants;
import com.me.inner.dto.PasswordVO;
import com.me.inner.service.UserService;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by yanyanghong on 2018/12/24.
 */
@Controller
@RequestMapping("user")
public class UserController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("getInfo")
    public ModelAndView getUserInfo() {
        logger.debug("Execute Method getUserInfo...");
        Map model = Maps.newHashMap();

        String number = SecurityUtil.getUserInfo().getUsername();

        String roleName = SecurityUtil.listUserAuthority().get(0);
        if (Constants.Role.STUDENT.equals(roleName)) {
            model.put("studentObj", userService.getStudentByNumber(number));
        } else {
            model.put("teacherObj", userService.getTeacherByNumber(number));
        }

        return new ModelAndView("user/detail", model);
    }

    @RequestMapping("editPassword")
    public ModelAndView editPassword(@ModelAttribute("passwordForm") PasswordVO passwordForm) {
        logger.debug("Execute Method editPassword...");

        return new ModelAndView("user/editPassword");
    }

    @RequestMapping("checkPassword")
    @ResponseBody
    public Map<String, Boolean> checkPassword(@RequestParam("oldPassword") String oldPassword) {
        logger.debug("Execute Method checkPassword...");

        Boolean valid = userService.checkPassword(oldPassword);

        Map<String, Boolean> model = Maps.newHashMap();
        model.put("valid", valid);

        return model;
    }
}
