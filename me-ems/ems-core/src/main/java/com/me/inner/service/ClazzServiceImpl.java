package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.mapper.ClazzMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanyanghong on 2019/1/25.
 */
@Service
public class ClazzServiceImpl implements ClazzService {

    private Logger logger = LoggerFactory.getLogger(ClazzServiceImpl.class);

    @Autowired
    private ClazzMapper clazzMapper;

    public List<String> listAllGrade() {
        logger.debug("Execute Method listAllGrade...");

        return clazzMapper.listAllGrade();
    }

    public PaginationDTO listClazzData(Integer facultyId, Integer professionId, String grade, PaginationDTO pagination) {
        logger.debug("Execute Method listClazzData...");

        int total = clazzMapper.countByFacultyId(facultyId, professionId, grade);
        List<ClazzDTO> clazzList = Lists.newArrayList();
        if (total>0) {
            clazzList = clazzMapper.listClazzData(facultyId, professionId, grade, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(clazzList);

        return pagination;
    }
}
