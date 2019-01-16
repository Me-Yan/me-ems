package com.me.inner.mapper;

import com.me.inner.dto.StudentDTO;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface StudentMapper {

    List<StudentDTO> listStudentByProfessionId(Integer professionId);

}
