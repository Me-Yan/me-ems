package com.me.inner.service;

import com.me.inner.dto.FacultyDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface FacultyService {

    PaginationDTO listFacultyData(String facultyName, PaginationDTO pagination);

    ResponseData addFaculty(FacultyDTO faculty);

    ResponseData deleteByFacultyId(Integer facultyId);

    FacultyDTO getByFacultyId(Integer facultyId);

    ResponseData updateFaculty(FacultyDTO faculty);

    List<FacultyDTO> listAllFaculty();

    ResponseData restoreByFacultyId(Integer facultyId);
}
