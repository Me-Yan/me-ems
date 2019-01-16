package com.me.inner.mapper;

/**
 * Created by Me on 2018/12/25.
 */
public interface Profession2SubjectMapper {

    void deleteByFacultyId(Integer facultyId);

    void deleteByProfessionId(Integer professionId);

    void deleteByProfessionIdIfActiveSubject(Integer professionId);

    void deleteByProfessionIdIfInactiveSubject(Integer professionId);

    void restoreByFacultyId(Integer facultyId);

    void restoreByProfessionId(Integer professionId);
}
