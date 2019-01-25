package com.me.inner.service;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
import com.me.inner.dto.ResponseData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by yanyanghong on 2018/12/27.
 */
public interface ProfessionService {

    PaginationDTO listProfessionByFacultyId(Integer facultyId, PaginationDTO pagination);

    List<ProfessionDTO> listAllByFacultyId(Integer facultyId);

    ResponseData addProfession(ProfessionDTO profession);

    ProfessionDTO getByProfessionId(Integer professionId);

    ResponseData updateProfession(ProfessionDTO profession);

    ResponseData deleteProfessionById(Integer professionId);

    ResponseData restoreByProfessionId(Integer professionId);
}
