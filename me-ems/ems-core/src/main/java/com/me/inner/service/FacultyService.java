package com.me.inner.service;

import com.me.inner.dto.FacultyDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface FacultyService {

    List<FacultyDTO> listFacultyData(String facultyName);
}
