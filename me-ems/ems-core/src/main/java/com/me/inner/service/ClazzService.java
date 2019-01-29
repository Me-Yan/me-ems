package com.me.inner.service;

import com.me.inner.dto.ClazzDTO;
import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;

import java.util.List;

/**
 * Created by yanyanghong on 2019/1/25.
 */
public interface ClazzService {

    PaginationDTO listClazzData(Integer facultyId, Integer professionId, String grade, PaginationDTO pagination);

    List<String> listAllGrade();

    ResponseData saveClazz(ClazzDTO clazz);

    ResponseData deleteByClazzId(Integer clazzId);

    ResponseData restoreClazz(Integer clazzId);

    List<ClazzDTO> listByProfessionId(Integer professionId);
}
