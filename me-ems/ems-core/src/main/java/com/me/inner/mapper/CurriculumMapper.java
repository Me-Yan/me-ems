package com.me.inner.mapper;

import com.me.inner.dto.CurriculumDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface CurriculumMapper {

    void deleteByFacultyId(Integer facultyId);

    void deleteByProfessionId(Integer professionId);

    List<CurriculumDTO> listByTeacherId(Integer teacherId);

    void deleteByTeacherId(Integer teacherId);

    List<CurriculumDTO> listBySubjectId(Integer subjectId);

    void deleteBySubjectId(Integer subjectId);

    void deleteByClazzId(Integer clazzId);
}
