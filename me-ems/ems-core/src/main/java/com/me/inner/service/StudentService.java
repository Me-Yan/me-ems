package com.me.inner.service;

import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface StudentService {

    PaginationDTO listByCondition(String gradeName, Integer facultyId, Integer professionId, Integer clazzId, PaginationDTO pagination);

    List<ClazzDTO> listByProfessionId(Integer professionId);
}
