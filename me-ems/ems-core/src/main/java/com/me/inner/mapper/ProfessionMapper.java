package com.me.inner.mapper;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface ProfessionMapper {

    int countProfessionByFacultyId(@Param("facultyId") Integer facultyId);

    List<ProfessionDTO> listProfessionByFacultyId(@Param("facultyId") Integer facultyId, @Param("pagination") PaginationDTO pagination);

    int countProfessionByCondition(ProfessionDTO profession);

    void saveProfession(ProfessionDTO profession);

    ProfessionDTO getByProfessionId(Integer professionId);

    void updateProfession(ProfessionDTO profession);

    void deleteByFacultyId(Integer facultyId);

    void deleteByProfessionId(Integer professionId);

    void restoreByFacultyId(Integer facultyId);

    void restoreByProfessionId(Integer professionId);

    ProfessionDTO getBySubjectId(Integer subjectId);

}
