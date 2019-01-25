package com.me.inner.service;

import com.me.inner.dto.PaginationDTO;

import java.util.List;

/**
 * Created by yanyanghong on 2019/1/25.
 */
public interface ClazzService {

    PaginationDTO listClazzData(Integer facultyId, Integer professionId, String grade, PaginationDTO pagination);

    List<String> listAllGrade();
}
