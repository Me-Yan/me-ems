package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
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

        profession.setCreateBy(SecurityUtil.getUserInfo().getUsername());
        profession.setCreateDate(new Date());

        professionMapper.saveProfession(profession);

        return true;
    }

    public ProfessionDTO getProfessionById(Integer professionId) {
        logger.debug("Execute Method getProfessionById...");

        return professionMapper.getProfessionById(professionId);
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

    public void deleteProfessionById(Integer professionId) {
        logger.debug("Execute Method deleteProfessionById...");

        // 删除学生的成绩
        scoreMapper.deleteScoreByProfessionId(professionId);
        // 删除对应专业的学生
        studentMapper.deleteStudentByProfessionId(professionId);
        // 删除对应专业的课表
        curriculumMapper.deleteCurriculumByProfessionId(professionId);
        // 删除对应专业的课程
        profession2SubjectMapper.deleteByProfessionId(professionId);
        // 删除对应专业的班级
        clazzMapper.deleteClazzByProfessionId(professionId);
        // 删除专业
        professionMapper.deleteProfessionById(professionId);
    }
}
