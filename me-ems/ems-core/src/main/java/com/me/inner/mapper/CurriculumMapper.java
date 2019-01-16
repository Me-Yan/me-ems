package com.me.inner.mapper;

import com.me.inner.dto.CurriculumDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface CurriculumMapper {

    void deleteCurriculumByFacultyId(Integer facultyId);

    void deleteCurriculumByProfessionId(Integer professionId);

    List<CurriculumDTO> listCurriculumByTeacherId(Integer teacherId);

    void deleteCurriculumByTeacherId(Integer teacherId);
}
