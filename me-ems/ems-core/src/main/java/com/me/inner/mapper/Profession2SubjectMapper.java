package com.me.inner.mapper;

/**
 * Created by Me on 2018/12/25.
 */
public interface Profession2SubjectMapper {

    void deleteByFacultyIdIfActiveSubject(Integer facultyId);

    void deleteByFacultyIdIfInactiveSubject(Integer facultyId);

    void deleteByProfessionIdIfActiveSubject(Integer professionId);

    void deleteByProfessionIdIfInactiveSubject(Integer professionId);

    void restoreByFacultyIdIfActiveSubject(Integer facultyId);

    void restoreByFacultyIdIfInactiveSubject(Integer facultyId);

    void restoreByProfessionIdIfActiveSubjectAndActiveFaculty(Integer professionId);

    void restoreByProfessionIdIfActiveSubjectAndInactiveFaculty(Integer professionId);

    void restoreByProfessionIdIfInactiveSubjectAndActiveFaculty(Integer professionId);

    void restoreByProfessionIdIfInactiveSubjectAndInactiveFaculty(Integer professionId);

}
