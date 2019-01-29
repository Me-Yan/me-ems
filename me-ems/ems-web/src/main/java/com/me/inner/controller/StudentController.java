package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
import com.me.inner.service.ClazzService;
import com.me.inner.service.FacultyService;
import com.me.inner.service.ProfessionService;
import com.me.inner.service.StudentService;
import com.me.inner.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2019/1/29.
 */
@Controller
@RequestMapping("student")
public class StudentController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private ClazzService clazzService;

    @Autowired
    private ProfessionService professionService;

    @RequestMapping("listStudent")
    public ModelAndView listStudent() {
        logger.debug("Execute Method listStudent...");

        Map<String, Object> model = Maps.newHashMap();

        List<FacultyDTO> facultyList = facultyService.listAllFaculty();
        List<String> gradeList = clazzService.listAllGrade();

        model.put("facultyList", facultyList);
        model.put("gradeList", gradeList);

        return new ModelAndView("student/listStudent", model);
    }

    @RequestMapping("listStudentData")
    public PaginationDTO listStudentData(@RequestParam(name = "gradeName", required = false) String gradeName,
                                            @RequestParam(name = "facultyId", required = false) Integer facultyId,
                                            @RequestParam(name = "professionId", required = false) Integer professionId,
                                            @RequestParam(name = "clazzId", required = false) Integer clazzId,
                                            HttpServletRequest request) {
        logger.debug("Execute Method listStudentData...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        return studentService.listByCondition(gradeName, facultyId, professionId, clazzId, pagination);
    }

    @RequestMapping("listProfessionByFacultyId")
    @ResponseBody
    public List<ProfessionDTO> listProfessionByFacultyId(@RequestParam("facultyId") Integer facultyId) {
        logger.debug("Execute Method listProfessionByFacultyId...");

        return professionService.listAllByFacultyId(facultyId);
    }

    @RequestMapping("listClazzByProfessionId")
    @ResponseBody
    public List<ClazzDTO> listClazzByProfessionId(@RequestParam("professionId") Integer professionId) {
        logger.debug("Execute Method listClazzByProfessionId...");

        return clazzService.listByProfessionId(professionId);
    }
}
