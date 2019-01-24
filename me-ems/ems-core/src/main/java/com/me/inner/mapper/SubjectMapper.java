package com.me.inner.mapper;

import com.me.inner.dto.PaginationDTO;
import com.me.inner.dto.SubjectDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by yanyanghong on 2019/1/24.
 */
public interface SubjectMapper {

    int countSubjectByName(@Param("subjectName") String subjectName);

    List<SubjectDTO> listSubjectData(@Param("subjectName") String subjectName, @Param("pagination") PaginationDTO pagination);

    void saveSubject(SubjectDTO subject);

    SubjectDTO getSubjectById(Integer subjectId);

    void updateSubject(SubjectDTO subject);

    void deleteBySubjectId(Integer subjectId);

    void restoreBySubjectId(Integer subjectId);

}
