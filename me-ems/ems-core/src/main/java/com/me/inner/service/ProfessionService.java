package com.me.inner.service;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ProfessionDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by yanyanghong on 2018/12/27.
 */
public interface ProfessionService {

    PaginationDTO listProfessionByFacultyId(Integer facultyId, PaginationDTO pagination);

    boolean addProfession(ProfessionDTO profession);

    ProfessionDTO getProfessionById(Integer professionId);

    boolean updateProfession(ProfessionDTO profession);

    void deleteProfessionById(Integer professionId);
}
