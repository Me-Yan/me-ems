package com.me.inner.service;

import com.me.inner.dto.StudentDTO;
import com.me.inner.dto.TeacherDTO;

/**
 * Created by yanyanghong on 2018/12/24.
 */
public interface UserService {

    StudentDTO getStudentByNumber(String number);

    TeacherDTO getTeacherByNumber(String number);

    Boolean checkPassword(String password);

    void updatePasswordByNumber(String password);
}
