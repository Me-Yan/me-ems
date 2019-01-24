package com.me.inner.mapper;

import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface FacultyMapper {

    int countFaculty(@Param("facultyName") String facultyName);

    List<FacultyDTO> listFacultyData(@Param("facultyName") String facultyName, @Param("pagination") PaginationDTO pagination);

    int countFacultyByName(String name);

    void saveFaculty(FacultyDTO faculty);

    FacultyDTO getByFacultyId(Integer facultyId);

    void updateFaculty(FacultyDTO faculty);

    List<FacultyDTO> listAllActiveFaculty();

    void deleteByFacultyId(Integer facultyId);

    void restoreByFacultyId(Integer facultyId);

    FacultyDTO getBySubjectId(Integer subjectId);
}
