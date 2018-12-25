package com.me.inner.controller;

import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.service.FacultyService;
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

/**
 * Created by Me on 2018/12/25.
 */
@Controller
@RequestMapping("faculty")
public class FacultyController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(FacultyController.class);

    @Autowired
    private FacultyService facultyService;

    @RequestMapping("listFaculty")
    public ModelAndView listFaculty() {
        logger.debug("Execute Method listFaculty...");

        return new ModelAndView("faculty/listFaculty");
    }

    @RequestMapping("listFacultyData")
    @ResponseBody
    public PaginationDTO listFacultyData(@RequestParam(name = "facultyName", required = false) String facultyName,
                                         HttpServletRequest request) {
        logger.debug("Execute Method listFacultyData...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        return facultyService.listFacultyData(facultyName, pagination);
    }
}
