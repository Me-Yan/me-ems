package com.me.inner.controller;

import com.google.common.collect.Maps;
import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
import com.me.inner.service.FacultyService;
import com.me.inner.service.ProfessionService;
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
 * Created by yanyanghong on 2018/12/27.
 */
@Controller
@RequestMapping("profession")
public class ProfessionController {

    private Logger logger = LoggerFactory.getLogger(ProfessionController.class);

    @Autowired
    private ProfessionService professionService;
    @Autowired
    private FacultyService facultyService;

    @RequestMapping("listProfession")
    public ModelAndView listProfession() {
        logger.debug("Execute Method listProfession...");

        Map<String, Object> model = Maps.newHashMap();

        List<FacultyDTO> facultyList = facultyService.listAllFaculty();
        model.put("facultyList", facultyList);

        return new ModelAndView("profession/listProfession", model);
    }

    @RequestMapping("listProfessionData")
    @ResponseBody
    public PaginationDTO listProfessionData(@RequestParam(name = "facultyId", required = false) Integer facultyId,
                                                  HttpServletRequest request) {
        logger.debug("Execute Method listProfessionData...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        return professionService.listProfessionByFacultyId(facultyId, pagination);
    }
}
