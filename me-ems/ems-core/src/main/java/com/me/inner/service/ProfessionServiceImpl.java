package com.me.inner.service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constants;
import com.me.inner.dto.*;
import com.me.inner.mapper.*;
import com.me.inner.util.SecurityUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by yanyanghong on 2018/12/27.
 */
@Service
public class ProfessionServiceImpl implements ProfessionService {

    private Logger logger = LoggerFactory.getLogger(ProfessionServiceImpl.class);

    @Autowired
    private ProfessionMapper professionMapper;
    @Autowired
    private ScoreMapper scoreMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private CurriculumMapper curriculumMapper;
    @Autowired
    private Profession2SubjectMapper profession2SubjectMapper;
    @Autowired
    private ClazzMapper clazzMapper;

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

    public boolean addProfession(ProfessionDTO profession) {
        logger.debug("Execute Method addProfession...");

        profession.setName(StringUtils.trim(profession.getName()));

        int total = professionMapper.countProfessionByCondition(profession);

        if (total>0) {
            return false;
        }

        profession.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
        profession.setCreateBy(SecurityUtil.getUserInfo().getUsername());
        profession.setCreateDate(new Date());

        professionMapper.saveProfession(profession);

        return true;
    }

    public ProfessionDTO getByProfessionId(Integer professionId) {
        logger.debug("Execute Method getProfessionById...");

        return professionMapper.getByProfessionId(professionId);
    }

    public boolean updateProfession(ProfessionDTO profession) {
        logger.debug("Execute Method updateProfession...");

        profession.setName(StringUtils.trim(profession.getName()));

        int total = professionMapper.countProfessionByCondition(profession);

        if (total>0) {
            return false;
        }

        profession.setUpdateDate(new Date());
        profession.setUpdateBy(SecurityUtil.getUserInfo().getUsername());

        professionMapper.updateProfession(profession);

        return true;
    }

    public boolean deleteProfessionById(Integer professionId) {
        logger.debug("Execute Method deleteProfessionById...");

        boolean valid = false;
        try {
            // 删除在线的学生登录信息
            studentMapper.deleteLoginByProfessionId(professionId);
            // 删除在线的学生
            studentMapper.deleteByProfessionId(professionId);
            // 删除课表
            curriculumMapper.deleteCurriculumByProfessionId(professionId);
            // 删除专业的课程
            profession2SubjectMapper.deleteByProfessionIdIfActiveSubject(professionId);
            profession2SubjectMapper.deleteByProfessionIdIfInactiveSubject(professionId);
            // 删除班级
            clazzMapper.deleteByProfessionId(professionId);
            // 删除专业
            professionMapper.deleteByProfessionId(professionId);

            valid = true;
        } catch (Exception e) {
            logger.error("删除专业失败。", e);
        }

        return valid;
    }

    public boolean restoreByProfessionId(Integer professionId) {
        logger.debug("Execute Method restoreByProfessionId...");

        boolean valid = false;
        try {
            // 恢复专业
            professionMapper.restoreByProfessionIdIfActiveFaculty(professionId);
            professionMapper.restoreByProfessionIdIfInactiveFaculty(professionId);
            // 恢复专业的课程
            profession2SubjectMapper.restoreByProfessionIdIfActiveSubjectAndActiveFaculty(professionId);
            profession2SubjectMapper.restoreByProfessionIdIfActiveSubjectAndInactiveFaculty(professionId);
            profession2SubjectMapper.restoreByProfessionIdIfInactiveSubjectAndActiveFaculty(professionId);
            profession2SubjectMapper.restoreByProfessionIdIfInactiveSubjectAndInactiveFaculty(professionId);
            // 恢复班级
            // TODO
            clazzMapper.restoreByProfessionId(professionId);
            // 恢复学生登录信息
            studentMapper.restoreLoginByProfessionId(professionId);
            // 恢复学生
            studentMapper.restoreByProfessionId(professionId);

            valid = true;
        } catch (Exception e) {
            logger.error("恢复专业失败。", e);
        }

        return valid;
    }
}
