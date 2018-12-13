package com.me.inner.service;

import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.CodeDTO;
import com.me.inner.mapper.CodeMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by yanyanghong on 2018/8/23.
 */
@Service
public class CodeServiceImpl implements CodeService {

    private Logger logger = LoggerFactory.getLogger(CodeServiceImpl.class);

    @Autowired
    private CodeMapper codeMapper;

    public List<String> listType() {
        logger.debug("Execute Method listType...");

        return codeMapper.listType();
    }

    public List<CodeDTO> listCodeByType(String type) {
        logger.debug("Execute Method listCodeByType...");

        return codeMapper.listCodeByType(type);
    }

    public CodeDTO getCodeByTypeAndName(String type, String name) {
        logger.debug("Execute Method getCodeByTypeAndName...");

        return codeMapper.getCodeByTypeAndName(type, name);
    }

    public void saveCode(CodeDTO code) {
        logger.debug("Execute Method saveCode...");

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        code.setActive(CommonConstant.CodeStatus.ACTIVE);
        code.setCreateDate(new Date());
        code.setCreateBy(userDetails.getUsername());

        codeMapper.saveCode(code);
    }

    public void updateCode(CodeDTO code) {
        logger.debug("Execute Method updateCode");

        codeMapper.updateCode(code);
    }

    public void deleteCode(Integer codeId) {
        logger.debug("Execute Method deleteCode...");

        codeMapper.deleteCode(codeId);
    }
}
