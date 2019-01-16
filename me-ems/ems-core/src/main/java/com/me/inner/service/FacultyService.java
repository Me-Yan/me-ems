package com.me.inner.service;

import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface FacultyService {

    PaginationDTO listFacultyData(String facultyName, PaginationDTO pagination);

    boolean addFaculty(FacultyDTO faculty);

    boolean deleteByFacultyId(Integer facultyId);

    FacultyDTO getByFacultyId(Integer facultyId);

    boolean updateFaculty(FacultyDTO faculty);

    List<FacultyDTO> listAllFaculty();

    boolean restoreByFacultyId(Integer facultyId);
}
