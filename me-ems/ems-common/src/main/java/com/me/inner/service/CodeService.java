package com.me.inner.service;


import com.me.inner.dto.CodeDTO;

import java.util.List;

/**
 * Created by yanyanghong on 2018/8/23.
 */
public interface CodeService {

    List<String> listType();

    List<CodeDTO> listCodeByType(String type);

    CodeDTO getCodeByTypeAndName(String type, String name);

    void saveCode(CodeDTO code);

    void updateCode(CodeDTO code);

    void deleteCode(Integer codeId);

}
