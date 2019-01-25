package com.me.inner.mapper;

import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface ClazzMapper {

    void deleteByFacultyId(Integer facultyId);

    void deleteByProfessionId(Integer professionId);

    void restoreByFacultyId(Integer facultyId);

    void restoreByProfessionId(Integer professionId);

    int countByFacultyId(@Param("facultyId") Integer facultyId, @Param("professionId") Integer professionId, @Param("grade") String grade);

    List<ClazzDTO> listClazzData(@Param("facultyId") Integer facultyId, @Param("professionId") Integer professionId,
                                 @Param("grade") String grade, @Param("pagination") PaginationDTO pagination);

    List<String> listAllGrade();

}
