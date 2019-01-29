package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.StudentDTO;
import com.me.inner.mapper.ClazzMapper;
import com.me.inner.mapper.StudentMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
@Service
public class StudentServiceImpl implements StudentService {

    private Logger logger = LoggerFactory.getLogger(StudentServiceImpl.class);

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ClazzMapper clazzMapper;

    public PaginationDTO listByCondition(String gradeName, Integer facultyId, Integer professionId, Integer clazzId, PaginationDTO pagination) {
        logger.debug("Execute Method listByCondition...");

        int total = studentMapper.countByCondition(gradeName, facultyId, professionId, clazzId);

        List<StudentDTO> studentList = Lists.newArrayList();
        if (total>0) {
            studentList = studentMapper.listByCondition(gradeName, facultyId, professionId, clazzId, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(studentList);

        return pagination;
    }

    public List<ClazzDTO> listByProfessionId(Integer professionId) {
        logger.debug("Execute Method listByProfessionId...");

        return clazzMapper.listByProfessionId(professionId);
    }
}
