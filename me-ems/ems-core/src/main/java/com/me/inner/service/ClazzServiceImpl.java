package com.me.inner.service;

import com.google.common.collect.Lists;
import com.me.inner.constant.CommonConstant;
import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.mapper.ClazzMapper;
import com.me.inner.mapper.CurriculumMapper;
import com.me.inner.mapper.StudentMapper;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by yanyanghong on 2019/1/25.
 */
@Service
public class ClazzServiceImpl implements ClazzService {

    private Logger logger = LoggerFactory.getLogger(ClazzServiceImpl.class);

    @Autowired
    private ClazzMapper clazzMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private CurriculumMapper curriculumMapper;

    public List<String> listAllGrade() {
        logger.debug("Execute Method listAllGrade...");

        return clazzMapper.listAllGrade();
    }

    public PaginationDTO listClazzData(Integer facultyId, Integer professionId, String grade, PaginationDTO pagination) {
        logger.debug("Execute Method listClazzData...");

        int total = clazzMapper.countByFacultyId(facultyId, professionId, grade);
        List<ClazzDTO> clazzList = Lists.newArrayList();
        if (total>0) {
            clazzList = clazzMapper.listClazzData(facultyId, professionId, grade, pagination);
        }

        pagination.setTotal(total);
        pagination.setRows(clazzList);

        return pagination;
    }

    public ResponseData saveClazz(ClazzDTO clazz) {
        logger.debug("Execute Method saveClazz...");

        boolean valid = false;
        String message = "";

        try {
            int total = clazzMapper.countClazzByCondition(clazz.getProfessionId(), clazz.getGradeName(), null);
            if ((total+clazz.getClazzCount())>20) {
                valid = false;
                message = "该专业已有"+total+"个班级，还可添加"+(20-total)+"个班级。";
            } else {
                Date curDate = new Date();
                String username = SecurityUtil.getUserInfo().getUsername();
                List<ClazzDTO> clazzList = Lists.newArrayList();
                for (int i=1; i<=clazz.getClazzCount(); i++) {
                    ClazzDTO temp = new ClazzDTO();
                    temp.setGradeName(clazz.getGradeName());
                    temp.setClazzName(Integer.toString(total+i));
                    temp.setProfessionId(clazz.getProfessionId());
                    temp.setActive(CommonConstant.IN_ACTIVE.ACTIVE);
                    temp.setCreateDate(curDate);
                    temp.setCreateBy(username);

                    clazzList.add(temp);
                }

                clazzMapper.saveClazz(clazzList);

                valid = true;
                message = "添加成功。";
            }
        } catch (Exception e) {
            logger.error("添加班级异常", e);
            message = "添加异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }

    public ResponseData deleteByClazzId(Integer clazzId) {
        logger.debug("Execute Method deleteByClazzId...");

        boolean valid = false;
        String message = "";

        try {
            // 删除学生登录信息
            studentMapper.deleteLoginByClazzId(clazzId);
            // 删除学生信息
            studentMapper.deleteByClazzId(clazzId);
            // 删除课表
            curriculumMapper.deleteByClazzId(clazzId);
            // 删除班级
            clazzMapper.deleteByClazzId(clazzId);

            valid = true;
            message = "删除成功。";
        } catch (Exception e) {
            logger.error("删除异常", e);
            message = "删除异常，请重新操作。";
        }

        return new ResponseData(valid, message);
    }
}
