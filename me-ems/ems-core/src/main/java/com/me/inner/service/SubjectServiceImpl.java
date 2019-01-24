package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.dto.SubjectDTO;
import com.me.inner.mapper.SubjectMapper;
import com.me.inner.util.SecurityUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by yanyanghong on 2019/1/24.
 */
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;

    private Logger logger = LoggerFactory.getLogger(SubjectServiceImpl.class);

    public PaginationDTO listSubjectData(String subjectName, PaginationDTO pagination) {
        logger.debug("Execute Method listSubjectData...");

        subjectName = StringUtils.trim(subjectName);

        int total = subjectMapper.countSubjectByName(subjectName);

        List<SubjectDTO> subjectList = Lists.newArrayList();
        if (total>0) {
            subjectList = subjectMapper.listSubjectData(subjectName, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(subjectList);

        return pagination;
    }

    public ResponseData saveSubject(SubjectDTO subject) {
        logger.debug("Execute Method saveSubject...");

        boolean valid = false;
        String message = "";

        try {
            subject.setName(StringUtils.trim(subject.getName()));

            int total = subjectMapper.countSubjectByName(subject.getName());
            if (total>0) {
                message = "课程已存在，请勿重新添加。";
            } else {
                subject.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
                subject.setCreateDate(new Date());
                subject.setCreateBy(SecurityUtil.getUserInfo().getUsername());

                subjectMapper.saveSubject(subject);

                valid = true;
                message = "添加成功。";
            }
        } catch (Exception e) {
            logger.error("添加异常", e);
            valid = false;
            message = "添加异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }
}
