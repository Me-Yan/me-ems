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

        faculty.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
        faculty.setCreateDate(new Date());
        faculty.setCreateBy(SecurityUtil.getUserInfo().getUsername());

        facultyMapper.saveFaculty(faculty);

        return true;
    }

    public boolean deleteByFacultyId(Integer facultyId) {
        logger.debug("Execute Method deleteFaculty...");

        boolean valid = false;
        try {
            // 学生相应的课程成绩取消
            Map<Integer, List<StudentDTO>> studentMap = Maps.newHashMap(); // professionId, student list
            List<CurriculumDTO> curriculumList = curriculumMapper.listCurriculumByFacultyId(facultyId);
            List<ScoreDTO> scoreList = Lists.newArrayList();
            if (!CollectionUtils.isEmpty(curriculumList)) {
                Date now = new Date();
                String username = SecurityUtil.getUserInfo().getUsername();

                for (CurriculumDTO curriculum : curriculumList) {

                    List<StudentDTO> studentList = studentMap.get(curriculum.getProfessionId());
                    if (!CollectionUtils.isEmpty(studentList)) {
                        studentList = studentMapper.listStudentByProfessionId(curriculum.getProfessionId());
                    }
                    if (!CollectionUtils.isEmpty(studentList)) {

                        studentMap.put(curriculum.getProfessionId(), studentList);
                        for (StudentDTO student : studentList) {
                            ScoreDTO score = new ScoreDTO();
                            score.setResult(0F);
                            score.setUsual(0F);
                            score.setTest(0F);
                            score.setStatus(Constants.ScoreStatus.CANCEL);
                            score.setStudentId(student.getStudentId());
                            score.setSubjectId(curriculum.getSubjectId());
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
            // 删除相应学院的课表
            curriculumMapper.deleteCurriculumByFacultyId(facultyId);
            // 删除专业对应的课程
            profession2SubjectMapper.deleteByFacultyId(facultyId);
            // 删除班级
            clazzMapper.deleteByFacultyId(facultyId);
            // 删除相关专业
            professionMapper.deleteByFacultyId(facultyId);
            // 删除学院
            facultyMapper.deleteByFacultyId(facultyId);

            valid = true;
        } catch (Exception e) {
            logger.error("删除学院失败。", e);
        }

        return valid;
    }

    public FacultyDTO getByFacultyId(Integer facultyId) {
        logger.debug("Execute Method getByFacultyId...");

        return facultyMapper.getByFacultyId(facultyId);
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

    public List<FacultyDTO> listAllFaculty() {
        logger.debug("Execute Method listAllFaculty...");

        return facultyMapper.listAllActiveFaculty();
    }

    public boolean restoreByFacultyId(Integer facultyId) {
        logger.debug("Execute Method restoreByFacultyId...");

        boolean valid = false;

        try {

            // 恢复学院
            facultyMapper.restoreByFacultyId(facultyId);
            // 恢复专业
            professionMapper.restoreByFacultyId(facultyId);
            // 恢复专业的课程
            profession2SubjectMapper.restoreByFacultyId(facultyId);
            // 恢复班级
            clazzMapper.restoreByFacultyId(facultyId);

            valid = true;
        } catch (Exception e) {
            logger.error("恢复学院失败。", e);
        }

        return  valid;
    }
}
