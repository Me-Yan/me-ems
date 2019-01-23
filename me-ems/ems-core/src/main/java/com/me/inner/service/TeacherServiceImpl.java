package com.me.inner.service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.inner.constant.CommonConstant;
import com.me.inner.constant.Constants;
import com.me.inner.dto.*;
import com.me.inner.mapper.*;
import com.me.inner.util.CommonUtil;
import com.me.inner.util.DateUtil;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ScoreMapper scoreMapper;

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
            teacher.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
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

    public TeacherDTO getByTeacherId(Integer teacherId) {
        logger.debug("Execute Method getTeacherById...");

        return teacherMapper.getByTeacherId(teacherId);
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

    public boolean deleteByTeacherId(Integer teacherId) {
        logger.debug("Execute Method deleteTeacherById...");

        boolean valid = false;
        try {
            // 生成学生的成绩
            Map<Integer, List<StudentDTO>> studentMap = Maps.newHashMap(); // clazzId, student list
            List<CurriculumDTO> curriculumList = curriculumMapper.listCurriculumByTeacherId(teacherId);
            List<ScoreDTO> scoreList = Lists.newArrayList();
            if (!CollectionUtils.isEmpty(curriculumList)) {
                Date now = new Date();
                String username = SecurityUtil.getUserInfo().getUsername();
                for (CurriculumDTO curriculum : curriculumList) {

                    List<StudentDTO> studentList = studentMap.get(curriculum.getClazzId());
                    if (CollectionUtils.isEmpty(studentList)) {
                        studentList = studentMapper.listStudentByClazzId(curriculum.getClazzId());
                    }

                    if (!CollectionUtils.isEmpty(studentList)) {
                        for (StudentDTO student : studentList) {
                            ScoreDTO score = new ScoreDTO();
                            score.setResult(0F);
                            score.setUsual(0F);
                            score.setTest(0F);
                            score.setStatus(Constants.ScoreStatus.CANCEL);
                            score.setStudentId(student.getStudentId());
                            score.setSubjectId(curriculum.getSubjectId());
                            score.setTeacherId(curriculum.getTeacherId());
                            score.setCreateBy(username);
                            score.setCreateDate(now);

                            scoreList.add(score);
                        }
                    }
                }
            }
            if (!CollectionUtils.isEmpty(scoreList)) {
                scoreMapper.saveScoreList(scoreList);
            }
            // 删除课程表
            curriculumMapper.deleteCurriculumByTeacherId(teacherId);
            // 删除老师的登录信息
            TeacherDTO teacher = teacherMapper.getByTeacherId(teacherId);
            securityMapper.deleteUserByUsername(teacher.getNumber());
            // 删除老师
            teacherMapper.deleteByTeacherId(teacherId);

            valid = true;
        } catch (Exception e) {
            logger.error("删除老师发生错误。", e);
        }

        return valid;
    }

    public ResponseData restoreTeacher(Integer teacherId) {
        logger.debug("Execute Method restoreTeacher...");

        boolean valid = false;
        String message = "";

        try {
            TeacherDTO teacher = teacherMapper.getByTeacherId(teacherId);
            if (CommonConstant.IN_ACTIVE.ACTIVE.equals(teacher.getFacultyActive())) {
                // 恢复老师登录信息
                teacherMapper.restoreLoginByTeacherId(teacherId);
                // 恢复老师信息
                teacherMapper.restoreByTeacherId(teacherId);

                valid = true;
                message = "恢复成功。";
            } else {
                valid = false;
                message = "学院已被删除，无法恢复。";
            }

        } catch (Exception e) {
            logger.error("恢复老师发生异常.", e);
            message = "恢复异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }

    public ResponseData resetPassword(Integer teacherId) {
        logger.debug("Execute Method resetPassword...");

        boolean valid = false;
        String message = "";

        try {

            CodeDTO code = codeMapper.getCodeByTypeAndName(Constants.CodeType.INIT_PASSWORD, Constants.CodeName.TEACHER);
            String encodedPassword = CommonUtil.encodePassword(code.getValue());

            teacherMapper.resetPassword(teacherId, encodedPassword);

            valid = true;
            message = "重置密码成功，初始密码为" + code.getValue();
        } catch (Exception e) {
            logger.error("重置密码异常。", e);
            message = "重置密码异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }
}
