package com.me.inner.service;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.ResponseData;
import com.me.inner.dto.SubjectDTO;

import java.util.List;

/**
 * Created by yanyanghong on 2019/1/24.
 */
public interface SubjectService {

    PaginationDTO listSubjectData(String subjectName, PaginationDTO pagination);

    ResponseData saveSubject(SubjectDTO subject);

    SubjectDTO getSubjectById(Integer subjectId);

    ResponseData updateSubject(SubjectDTO subject);

    ResponseData deleteSubject(Integer subjectId);

    ResponseData restoreSubject(Integer subjectId);
}
