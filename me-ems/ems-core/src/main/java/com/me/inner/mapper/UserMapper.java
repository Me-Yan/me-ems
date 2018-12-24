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

    int checkPassword(@Param("number") String number, @Param("password") String password);
}
