package com.me.inner.mapper;

import com.me.inner.dto.FacultyDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface FacultyMapper {

    List<FacultyDTO> listFacultyData(String facultyName);
}
