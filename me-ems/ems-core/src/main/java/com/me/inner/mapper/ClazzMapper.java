package com.me.inner.mapper;

/**
 * Created by Me on 2018/12/25.
 */
public interface ClazzMapper {

    void deleteByFacultyId(Integer facultyId);

    void deleteByProfessionId(Integer professionId);

    void restoreByFacultyId(Integer facultyId);

    void restoreByProfessionId(Integer professionId);

}
