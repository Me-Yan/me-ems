package com.me.inner.mapper;

import com.me.inner.dto.StudentDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface StudentMapper {

    List<StudentDTO> listStudentByClazzId(Integer clazzId);

    void deleteByFacultyId(Integer facultyId);

    void deleteLoginByFacultyId(Integer facultyId);

    void deleteLoginByProfessionId(Integer professionId);

    void deleteByProfessionId(Integer professionId);

    void restoreLoginByFacultyId(Integer facultyId);

    void restoreByFacultyId(Integer facultyId);

    void restoreLoginByProfessionId(Integer professionId);

    void restoreByProfessionId(Integer professionId);

}
