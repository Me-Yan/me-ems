package com.me.inner.mapper;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.TeacherDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface TeacherMapper {

    void deleteTeacherByFacultyId(Integer facultyId);

    int countTeacherByCondition(@Param("facultyId") Integer facultyId);

    List<TeacherDTO> listTeacherByCondition(@Param("facultyId") Integer facultyId, @Param("pagination")PaginationDTO pagination);

    boolean saveTeacher(TeacherDTO teacher);

    TeacherDTO getTeacherById(Integer teacherId);

    void updateTeacher(TeacherDTO teacher);

    void deleteTeacherById(Integer teacherId);
}
