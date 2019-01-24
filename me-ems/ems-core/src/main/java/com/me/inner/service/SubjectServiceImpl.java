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
 * Created by yanyanghong on 2019/1/24.
 */
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;

    @Autowired
    private CurriculumMapper curriculumMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ScoreMapper scoreMapper;

    @Autowired
    private Profession2SubjectMapper profession2SubjectMapper;

    @Autowired
    private ProfessionMapper professionMapper;

    @Autowired
    private FacultyMapper facultyMapper;

    private Logger logger = LoggerFactory.getLogger(SubjectServiceImpl.class);

    public PaginationDTO listSubjectData(String subjectName, PaginationDTO pagination) {
        logger.debug("Execute Method listSubjectData...");

        subjectName = StringUtils.trim(subjectName);

        int total = subjectMapper.countSubjectByName(subjectName);

        List<SubjectDTO> subjectList = Lists.newArrayList();
        if (total>0) {
            subjectList = subjectMapper.listSubjectData(subjectName, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(subjectList);

        return pagination;
    }

    public ResponseData saveSubject(SubjectDTO subject) {
        logger.debug("Execute Method saveSubject...");

        boolean valid = false;
        String message = "";

        try {
            subject.setName(StringUtils.trim(subject.getName()));

            int total = subjectMapper.countSubjectByName(subject.getName());
            if (total>0) {
                message = "课程已存在，请勿重新添加。";
            } else {
                subject.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
                subject.setCreateDate(new Date());
                subject.setCreateBy(SecurityUtil.getUserInfo().getUsername());

                subjectMapper.saveSubject(subject);

                valid = true;
                message = "添加成功。";
            }
        } catch (Exception e) {
            logger.error("添加异常", e);
            valid = false;
            message = "添加异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }

    public SubjectDTO getSubjectById(Integer subjectId) {
        logger.debug("Execute Method getSubjectById...");

        return subjectMapper.getSubjectById(subjectId);
    }

    public ResponseData updateSubject(SubjectDTO subject) {
        logger.debug("Execute Method updateSubject...");

        boolean valid = false;
        String message = "";

        try {
            subject.setName(StringUtils.trim(subject.getName()));
            subject.setUpdateDate(new Date());
            subject.setUpdateBy(SecurityUtil.getUserInfo().getUsername());

            subjectMapper.updateSubject(subject);

            valid = true;
            message = "修改成功。";
        } catch (Exception e) {
            logger.error("修改异常。", e);
            message = "修改异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }

    public ResponseData deleteSubject(Integer subjectId) {
        logger.debug("Execute Method deleteSubject...");

        boolean valid = false;
        String message = "";

        try {
            // 生成学生的成绩
            Map<Integer, List<StudentDTO>> studentMap = Maps.newHashMap(); // clazzId, student list
            List<CurriculumDTO> curriculumList = curriculumMapper.listCurriculumBySubjectId(subjectId);
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
            // 删除课程所在的课表记录
            curriculumMapper.deleteCurriculumBySubjectId(subjectId);
            // 删除专业对应的课程
            profession2SubjectMapper.deleteBySubjectIdIfActiveProfessionAndActiveFaculty(subjectId);
            profession2SubjectMapper.deleteBySubjectIdIfActiveProfessionAndInactiveFaculty(subjectId);
            profession2SubjectMapper.deleteBySubjectIdIfInactiveProfession(subjectId);
            // 删除课程
            subjectMapper.deleteBySubjectId(subjectId);

            valid = true;
            message = "删除成功。";
        } catch (Exception e) {
            logger.error("删除异常。", e);
            message = "删除异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }

    public ResponseData restoreSubject(Integer subjectId) {
        logger.debug("Execute Method restoreSubject...");

        boolean valid = false;
        String message = "";

        try {
            // 恢复专业对应的课程
            profession2SubjectMapper.restoreBySubjectIdIfActiveProfessionAndActiveFaculty(subjectId);
            profession2SubjectMapper.restoreBySubjectIdIfActiveProfessionAndInactiveFaculty(subjectId);
            profession2SubjectMapper.restoreBySubjectIdIfInactiveProfession(subjectId);
            // 恢复课程
            subjectMapper.restoreBySubjectId(subjectId);

            valid = true;
            message = "恢复成功。";
        } catch (Exception e) {
            logger.error("恢复异常。", e);
            message = "恢复异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }
}
