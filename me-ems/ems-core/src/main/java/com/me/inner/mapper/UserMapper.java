package com.me.inner.mapper;

import com.me.inner.dto.StudentDTO;
import com.me.inner.dto.TeacherDTO;
import org.apache.ibatis.annotations.Param;

/**
 * Created by yanyanghong on 2018/12/24.
 */
public interface UserMapper {

    StudentDTO getStudentByNumber(String number);

    TeacherDTO getTeacherByNumber(String number);

    String getPasswordByNumber(String number);

    void updatePasswordByNumber(@Param("password") String password, @Param("number") String number);
}
