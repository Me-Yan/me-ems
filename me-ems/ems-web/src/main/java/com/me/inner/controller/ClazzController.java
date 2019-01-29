package com.me.inner.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.inner.dto.*;
import com.me.inner.service.ClazzService;
import com.me.inner.service.FacultyService;
import com.me.inner.service.ProfessionService;
import com.me.inner.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.List;
import java.util.Map;


/**
 * Created by yanyanghong on 2019/1/25.
 */
@Controller
@RequestMapping("clazz")
public class ClazzController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(ClazzController.class);

    @Autowired
    private ClazzService clazzService;

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private ProfessionService professionService;

    @RequestMapping("listClazz")
    public ModelAndView listClazz() {
        logger.debug("Execute Method listClazz...");

        Map<String, Object> model = Maps.newHashMap();

        List<FacultyDTO> facultyList = facultyService.listAllFaculty();
        List<String> gradeList = clazzService.listAllGrade();

        String curYear = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
        boolean flag = false; // if true, add the current year
        if (!CollectionUtils.isEmpty(gradeList)) {
            for (String grade : gradeList) {
                if (curYear.equals(grade)) {
                    flag = true;
                    break;
                }
            }
        }

        List<String> clazzList = Lists.newArrayList();
        for (int i=1; i<=10; i++) {
            clazzList.add(Integer.toString(i));
        }

        model.put("facultyList", facultyList);
        model.put("gradeList", gradeList);
        model.put("curYearFlag", flag);
        model.put("curYear", curYear);
        model.put("clazzList", clazzList);

        return new ModelAndView("clazz/listClazz", model);
    }

    @RequestMapping("listClazzData")
    @ResponseBody
    public PaginationDTO listClazzData(@RequestParam(name = "facultyId", required = false) Integer facultyId,
                                       @RequestParam(name = "professionId", required = false) Integer professionId,
                                       @RequestParam(name = "grade", required = false) String grade,
                                       HttpServletRequest request) {
        logger.debug("Execute Method listClazzData...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        return clazzService.listClazzData(facultyId, professionId, grade, pagination);
    }

    @RequestMapping("listProfessionByFacultyId")
    @ResponseBody
    public List<ProfessionDTO> listProfessionByFacultyId(@RequestParam("facultyId") Integer facultyId) {
        logger.debug("Execute Method listProfessionByFacultyId...");

        return professionService.listAllByFacultyId(facultyId);
    }

    @RequestMapping("addClazz")
    @ResponseBody
    public ResponseData addClazz(@ModelAttribute("clazzForm") ClazzDTO clazzForm) {
        logger.debug("Execute Method addClazz...");

        return clazzService.saveClazz(clazzForm);
    }

    @RequestMapping("deleteClazz")
    @ResponseBody
    public ResponseData deleteClazz(@ModelAttribute("clazzId") Integer clazzId) {
        logger.debug("Execute Method deleteClazz...");

        return clazzService.deleteByClazzId(clazzId);
    }
}
