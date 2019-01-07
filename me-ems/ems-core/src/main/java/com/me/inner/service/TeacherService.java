package com.me.inner.service;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.TeacherDTO;

/**
 * Created by Me on 2019/1/2.
 */
public interface TeacherService {

    PaginationDTO listTeacherByCondition(Integer facultyId, PaginationDTO pagination);

    boolean saveTeacher(TeacherDTO teacher);
}
