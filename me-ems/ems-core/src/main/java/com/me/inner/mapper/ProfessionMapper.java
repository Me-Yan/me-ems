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

    void deleteProfessionByFacultyId(Integer facultyId);

    int countProfessionByCondition(ProfessionDTO profession);

    void saveProfession(ProfessionDTO profession);

    ProfessionDTO getProfessionById(Integer professionId);

    void updateProfession(ProfessionDTO profession);

    void deleteProfessionById(Integer professionId);
}
