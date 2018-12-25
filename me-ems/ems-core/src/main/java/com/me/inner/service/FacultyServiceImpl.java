package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.mapper.FacultyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
@Service
public class FacultyServiceImpl implements FacultyService {

    private Logger logger = LoggerFactory.getLogger(FacultyServiceImpl.class);

    @Autowired
    private FacultyMapper facultyMapper;

    public PaginationDTO listFacultyData(String facultyName, PaginationDTO pagination) {
        logger.debug("Execute Method listFacultyData...");

        int total = facultyMapper.countFaculty(facultyName);

        List<FacultyDTO> facultyList = Lists.newArrayList();
        if (total>0) {
            facultyList = facultyMapper.listFacultyData(facultyName, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(facultyList);

        return pagination;
    }
}
