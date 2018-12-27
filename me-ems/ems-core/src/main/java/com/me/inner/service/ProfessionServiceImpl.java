package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
import com.me.inner.mapper.ProfessionMapper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanyanghong on 2018/12/27.
 */
@Service
public class ProfessionServiceImpl implements ProfessionService {

    private Logger logger = LoggerFactory.getLogger(ProfessionServiceImpl.class);

    @Autowired
    private ProfessionMapper professionMapper;

    public PaginationDTO listProfessionByFacultyId(Integer facultyId, PaginationDTO pagination) {
        logger.debug("Execute Method listProfessionByFacultyName...");

        int total = professionMapper.countProfessionByFacultyId(facultyId);

        List<ProfessionDTO> professionList = Lists.newArrayList();
        if (total>0) {
            professionList = professionMapper.listProfessionByFacultyId(facultyId, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(professionList);

        return pagination;
    }
}
