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

    void restoreByProfessionIdIfActiveSubject(Integer professionId);

    void restoreByProfessionIdIfInactiveSubject(Integer professionId);

    void deleteBySubjectIdIfActiveProfessionAndActiveFaculty(Integer subjectId);

    void deleteBySubjectIdIfActiveProfessionAndInactiveFaculty(Integer subjectId);

    void deleteBySubjectIdIfInactiveProfession(Integer subjectId);

    void restoreBySubjectIdIfActiveProfessionAndActiveFaculty(Integer subjectId);

    void restoreBySubjectIdIfActiveProfessionAndInactiveFaculty(Integer subjectId);

    void restoreBySubjectIdIfInactiveProfession(Integer subjectId);

}
