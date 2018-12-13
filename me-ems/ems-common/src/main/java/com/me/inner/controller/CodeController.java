package com.me.inner.controller;

import com.me.inner.dto.CodeDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.service.CodeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Me on 2018/8/30.
 */
@Controller
@RequestMapping("code")
public class CodeController {

    private Logger logger = LoggerFactory.getLogger(CodeController.class);

    @Autowired
    private CodeService codeService;

    @RequestMapping("list")
    public ModelAndView listCode() {
        logger.debug("Execute Method listCode...");

        ModelAndView model = new ModelAndView("code/list");

        List<String> codeTypeList = codeService.listType();

        model.addObject("codeTypeList", codeTypeList);

        return model;
    }

    @RequestMapping("listCodeData")
    @ResponseBody
    public List<CodeDTO> listCodeData(@RequestParam(name = "type", required = false) String type) {
        logger.debug("Execute Method listCodeData...");

        return codeService.listCodeByType(type);
    }

    @RequestMapping("new")
    @ResponseBody
    public ResponseData newCode(@ModelAttribute("codeForm") CodeDTO codeForm) {
        logger.debug("Execute Method newCode...");

        try {
            codeService.saveCode(codeForm);
        } catch (Exception e) {
            logger.error("occur a error when new code", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("update")
    @ResponseBody
    public ResponseData updateCode(@ModelAttribute("codeForm") CodeDTO codeForm) {
        logger.debug("Execute Method updateCode...");

        try {
            codeService.updateCode(codeForm);
        } catch (Exception e) {
            logger.error("occur a error when new code", e);
            return new ResponseData(false);
        }

        return new ResponseData(true);
    }

    @RequestMapping("delete")
    @ResponseBody
    public ResponseData deleteCode(@RequestParam(name = "codeId") Integer codeId) {
        logger.debug("Execute Method deleteCode...");

        try {
            codeService.deleteCode(codeId);
        } catch (Exception e) {
            logger.error("occur a error when delete a code", e);

            return new ResponseData(Boolean.FALSE, "occur a error.");
        }

        return new ResponseData(Boolean.TRUE, null);
    }
}
