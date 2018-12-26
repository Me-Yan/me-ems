package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.mapper.*;
import com.me.inner.util.SecurityUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
@Service
public class FacultyServiceImpl implements FacultyService {

    private Logger logger = LoggerFactory.getLogger(FacultyServiceImpl.class);

    @Autowired
    private FacultyMapper facultyMapper;
    @Autowired
    private ScoreMapper scoreMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private CurriculumMapper curriculumMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private Profession2SubjectMapper profession2SubjectMapper;
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private ProfessionMapper professionMapper;

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

    public boolean addFaculty(FacultyDTO faculty) {
        logger.debug("Execute Method addFaculty...");

        int count = facultyMapper.countFacultyByName(StringUtils.trim(faculty.getName()));
        if (count>0) {
            return false;
        }

        faculty.setCreateDate(new Date());
        faculty.setCreateBy(SecurityUtil.getUserInfo().getUsername());

        facultyMapper.saveFaculty(faculty);

        return true;
    }

    public void deleteFaculty(Integer facultyId) {
        logger.debug("Execute Method deleteFaculty...");

        // 删除学生的成绩
        scoreMapper.deleteScoreByFacultyId(facultyId);
        // 删除对应学院的学生
        studentMapper.deleteStudentByFacultyId(facultyId);
        // 删除相应学院的课表
        curriculumMapper.deleteCurriculumByFacultyId(facultyId);
        // 删除相应学院的老师
        teacherMapper.deleteTeacherByFacultyId(facultyId);
        // 删除专业对应的课程
        profession2SubjectMapper.deleteByFacultyId(facultyId);
        // 删除相应的班级
        clazzMapper.deleteClazzByFacultyId(facultyId);
        // 删除相应的专业
        professionMapper.deleteProfessionByFacultyId(facultyId);
        // 删除该学院
        facultyMapper.deleteFacultyById(facultyId);

    }

    public FacultyDTO getFaculty(Integer facultyId) {
        logger.debug("Execute Method getFaculty...");

        return facultyMapper.getFaculty(facultyId);
    }

    public boolean updateFaculty(FacultyDTO faculty) {
        logger.debug("Execute Method updateFaculty...");

        int total = facultyMapper.countFacultyByName(StringUtils.trim(faculty.getName()));
        if (total>0) {
            return false;
        }

        faculty.setUpdateDate(new Date());
        faculty.setUpdateBy(SecurityUtil.getUserInfo().getUsername());

        facultyMapper.updateFaculty(faculty);

        return true;
    }
}
