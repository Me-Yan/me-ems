package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.TeacherDTO;
import com.me.inner.mapper.TeacherMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2019/1/2.
 */
@Service
public class TeacherServiceImpl implements TeacherService {

    private Logger logger = LoggerFactory.getLogger(TeacherServiceImpl.class);

    @Autowired
    private TeacherMapper teacherMapper;

    public PaginationDTO listTeacherByCondition(Integer facultyId, PaginationDTO pagination) {
        logger.debug("Execute Method listTeacherByCondition...");

        int total = teacherMapper.countTeacherByCondition(facultyId);

        List<TeacherDTO> teacherList = Lists.newArrayList();
        if (total>0) {
            teacherList = teacherMapper.listTeacherByCondition(facultyId, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(teacherList);

        return pagination;
    }
}
