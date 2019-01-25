package com.me.inner.controller;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.dto.SubjectDTO;
import com.me.inner.service.SubjectService;
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

/**
 * Created by yanyanghong on 2019/1/24.
 */
@Controller
@RequestMapping("subject")
public class SubjectController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(SubjectController.class);

    @Autowired
    private SubjectService subjectService;

    @RequestMapping("listSubject")
    public ModelAndView listSubject() {
        logger.debug("Execute Method listSubject...");

        return new ModelAndView("subject/listSubject");
    }

    @RequestMapping("listSubjectData")
    @ResponseBody
    public PaginationDTO listSubjectData(@RequestParam(name = "subjectName", required = false) String subjectName,
                                            HttpServletRequest request) {
        logger.debug("Execute Method listSubjectData...");

        PaginationDTO pagination = CommonUtil.packagePagination(request);

        return subjectService.listSubjectData(subjectName, pagination);
    }

    @RequestMapping("addSubject")
    @ResponseBody
    public ResponseData addSubject(@ModelAttribute("subjectForm") SubjectDTO subjectForm) {
        logger.debug("Execute Method listSubjectData...");

        return subjectService.saveSubject(subjectForm);
    }

    @RequestMapping("getSubject")
    @ResponseBody
    public SubjectDTO getSubject(@RequestParam("subjectId") Integer subjectId) {
        logger.debug("Execute Method getSubject...");

        return subjectService.getSubjectById(subjectId);
    }

    @RequestMapping("updateSubject")
    @ResponseBody
    public ResponseData updateSubject(@ModelAttribute("subjectForm") SubjectDTO subjectForm) {
        logger.debug("Execute Method updateSubject...");

        return subjectService.updateSubject(subjectForm);
    }

    @RequestMapping("deleteSubject")
    @ResponseBody
    public ResponseData deleteSubject(@RequestParam("subjectId") Integer subjectId) {
        logger.debug("Execute Method updateSubject...");

        return subjectService.deleteSubject(subjectId);
    }

    @RequestMapping("restoreSubject")
    @ResponseBody
    public ResponseData restoreSubject(@RequestParam("subjectId") Integer subjectId) {
        logger.debug("Execute Method restoreSubject...");

        return subjectService.restoreSubject(subjectId);
    }
}
