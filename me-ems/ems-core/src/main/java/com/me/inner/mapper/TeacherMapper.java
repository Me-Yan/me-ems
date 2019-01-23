package com.me.inner.mapper;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.TeacherDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface TeacherMapper {

    int countTeacherByCondition(@Param("facultyId") Integer facultyId);

    List<TeacherDTO> listTeacherByCondition(@Param("facultyId") Integer facultyId, @Param("pagination")PaginationDTO pagination);

    boolean saveTeacher(TeacherDTO teacher);

    TeacherDTO getByTeacherId(Integer teacherId);

    void updateTeacher(TeacherDTO teacher);

    void deleteByFacultyId(Integer facultyId);

    void deleteByTeacherId(Integer teacherId);

    void deleteLoginByFacultyId(Integer facultyId);

    void restoreLoginByFacultyId(Integer facultyId);

    void restoreByFacultyId(Integer facultyId);

    void restoreLoginByTeacherId(Integer teacherId);

    void restoreByTeacherId(Integer teacherId);

    void resetPassword(@Param("teacherId") Integer teacherId, @Param("password") String password);
}
