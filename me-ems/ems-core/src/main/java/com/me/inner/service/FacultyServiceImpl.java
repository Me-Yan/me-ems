package com.me.inner.service;

import com.me.inner.dto.FacultyDTO;
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

    public List<FacultyDTO> listFacultyData(String facultyName) {
        logger.debug("Execute Method listFacultyData...");

        return facultyMapper.listFacultyData(facultyName);
    }
}
