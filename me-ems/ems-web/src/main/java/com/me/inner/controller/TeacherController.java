package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.constant.Constants;
import com.me.inner.dto.*;
import com.me.inner.service.CodeService;
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
public class TeacherController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private FacultyService facultyService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private CodeService codeService;

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

        CodeDTO initPasswordCode = codeService.getCodeByTypeAndName(Constants.CodeType.INIT_PASSWORD, Constants.CodeName.TEACHER);
        model.put("initPassword", initPasswordCode.getValue());

        return new ModelAndView("teacher/listTeacher", model);
    }

    @RequestMapping("listTeacherData")
    @ResponseBody
    public PaginationDTO listTeacherData(@RequestParam(name = "facultyId", required = false) Integer facultyId, HttpServletRequest request) {
        logger.debug("Execute Method listTeacher...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        return teacherService.listTeacherByCondition(facultyId, pagination);
    }

    @RequestMapping("addTeacher")
    @ResponseBody
    public ResponseData addTeacher(@ModelAttribute("teacherForm") TeacherDTO teacherForm) {
        logger.debug("Execute Method addTeacher...");

        return teacherService.saveTeacher(teacherForm);
    }

    @RequestMapping("getTeacher")
    @ResponseBody
    public TeacherDTO getTeacher(@RequestParam("teacherId") Integer teacherId) {
        logger.debug("Execute Method getTeacher...");

        return teacherService.getByTeacherId(teacherId);
    }

    @RequestMapping("updateTeacher")
    @ResponseBody
    public ResponseData updateTeacher(@ModelAttribute("teacherForm") TeacherDTO teacherForm) {
        logger.debug("Execute Method updateTeacher...");

        return teacherService.updateTeacher(teacherForm);
    }

    @RequestMapping("deleteTeacher")
    @ResponseBody
    public ResponseData deleteTeacher(@RequestParam("teacherId") Integer teacherId) {
        logger.debug("Execute Method deleteTeacher...");

        return teacherService.deleteByTeacherId(teacherId);
    }

    @RequestMapping("restoreTeacher")
    @ResponseBody
    public ResponseData restoreTeacher(@RequestParam("teacherId") Integer teacherId) {
        logger.debug("Execute Method restoreTeacher...");

        return teacherService.restoreTeacher(teacherId);
    }

    @RequestMapping("resetPassword")
    @ResponseBody
    public ResponseData resetPassword(@RequestParam("teacherId") Integer teacherId) {
        logger.debug("Execute Method resetPassword...");

        return teacherService.resetPassword(teacherId);
    }

}
