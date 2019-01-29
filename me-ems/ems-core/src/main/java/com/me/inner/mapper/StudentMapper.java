package com.me.inner.mapper;

import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.StudentDTO;
import org.apache.ibatis.annotations.Param;

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

    void deleteLoginByClazzId(Integer clazzId);

    void deleteByClazzId(Integer clazzId);

    void restoreLoginByClazzId(Integer clazzId);

    void restoreByClazzId(Integer clazzId);

    int countByCondition(@Param("gradeName") String gradeName, @Param("facultyId") Integer facultyId,
                         @Param("professionId") Integer professionId, @Param("clazzId") Integer clazzId);

    List<StudentDTO> listByCondition(@Param("gradeName") String gradeName, @Param("facultyId") Integer facultyId,
                                     @Param("professionId") Integer professionId, @Param("clazzId") Integer clazzId,
                                     @Param("pagination") PaginationDTO pagination);

}
