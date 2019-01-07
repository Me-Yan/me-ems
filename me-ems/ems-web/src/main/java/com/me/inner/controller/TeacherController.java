package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.constant.Constants;
import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.dto.TeacherDTO;
import com.me.inner.service.FacultyService;
import com.me.inner.service.TeacherService;
import com.me.inner.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * Created by Me on 2019/1/2.
 */
@Controller
@RequestMapping("teacher")
public class TeacherController {

    private Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private FacultyService facultyService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("listTeacher")
    public ModelAndView listTeacher() {
        logger.debug("Execute Method listTeacher...");

        Map<String, Object> model = Maps.newHashMap();

        List<FacultyDTO> facultyList = facultyService.listAllFaculty();
        model.put("facultyList", facultyList);

        Map<Integer, String> sexMap = Maps.newHashMap();
        sexMap.put(0, Constants.Sex.FEMALE);
        sexMap.put(1, Constants.Sex.MALE);
        model.put("sexMap", sexMap);

        return new ModelAndView("teacher/listTeacher", model);
    }

    @RequestMapping("listTeacherData")
    @ResponseBody
    public PaginationDTO listTeacherData(@RequestParam(name = "facultyId", required = false) Integer facultyId, HttpServletRequest request) {
        logger.debug("Execute Method listTeacher...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        teacherService.listTeacherByCondition(facultyId, pagination);

        return pagination;
    }

    @RequestMapping("addTeacher")
    @ResponseBody
    public ResponseData addTeacher(@ModelAttribute("teacherForm") TeacherDTO teacherForm) {
        logger.debug("Execute Method addTeacher...");

        return null;
    }
}
