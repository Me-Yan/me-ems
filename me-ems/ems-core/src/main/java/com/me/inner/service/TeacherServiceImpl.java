package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constants;
import com.me.inner.dto.*;
import com.me.inner.mapper.CodeMapper;
import com.me.inner.mapper.CurriculumMapper;
import com.me.inner.mapper.SecurityMapper;
import com.me.inner.mapper.TeacherMapper;
import com.me.inner.util.CommonUtil;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2019/1/2.
 */
@Service
public class TeacherServiceImpl implements TeacherService {

    private Logger logger = LoggerFactory.getLogger(TeacherServiceImpl.class);

    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private PKService pkService;
    @Autowired
    private CodeMapper codeMapper;
    @Autowired
    private SecurityMapper securityMapper;
    @Autowired
    private CurriculumMapper curriculumMapper;

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

    public boolean saveTeacher(TeacherDTO teacher) {
        logger.debug("Execute Method saveTeacher...");

        try {
            Date now = new Date();
            String username = SecurityUtil.getUserInfo().getUsername();
            String number = pkService.getNumber(Constants.Role.TEACHER);

            teacher.setNumber(number);
            teacher.setBirthDate(DateUtil.parseDate(teacher.getBirthDateStr(), CommonConstant.Pattern.YYYY_MM_DD));
            teacher.setCreateDate(now);
            teacher.setCreateBy(username);

            teacherMapper.saveTeacher(teacher);

            CodeDTO initPasswordCode = codeMapper.getCodeByTypeAndName(Constants.CodeType.INIT_PASSWORD, Constants.CodeName.TEACHER);

            String password = CommonUtil.encodePassword(initPasswordCode.getValue());

            UserSecDTO user = new UserSecDTO();
            user.setUsername(number);
            user.setPassword(password);
            user.setEnabled(CommonConstant.YES_NO.YES);
            user.setCreateDate(now);
            user.setCreateBy(username);

            securityMapper.saveUser(user);

            RoleSecDTO role = securityMapper.getRoleByName(Constants.Role.TEACHER);

            User2RoleSecDTO user2Role = new User2RoleSecDTO();
            user2Role.setUserId(user.getUserId());
            user2Role.setRoleId(role.getRoleId());
            user2Role.setCreateDate(now);
            user2Role.setCreateBy(username);

            securityMapper.saveUser2Role(user2Role);

            return true;
        } catch (Exception e) {
            logger.error("添加老师发生错误", e);
            return false;
        }
    }

    public TeacherDTO getTeacherById(Integer teacherId) {
        logger.debug("Execute Method getTeacherById...");

        return teacherMapper.getTeacherById(teacherId);
    }

    public boolean updateTeacher(TeacherDTO teacher) {
        logger.debug("Execute Method updateTeacher...");

        try {
            teacher.setBirthDate(DateUtil.parseDate(teacher.getBirthDateStr(), CommonConstant.Pattern.YYYY_MM_DD));
            teacher.setUpdateBy(SecurityUtil.getUserInfo().getUsername());
            teacher.setUpdateDate(new Date());

            teacherMapper.updateTeacher(teacher);

            return true;
        } catch (Exception e) {
            logger.error("修改老师发生错误", e);
            return false;
        }
    }

    public boolean deleteTeacherById(Integer teacherId) {
        logger.debug("Execute Method deleteTeacherById...");

        try {
            // 删除老师
            // 删除课程表
            // 删除用户表
            teacherMapper.deleteTeacherById(teacherId);

            return true;
        } catch (Exception e) {
            logger.error("删除老师发生错误。", e);
            return false;
        }
    }
}
