package com.me.inner.mapper;

import com.me.inner.dto.SequenceDTO;

/**
 * Created by yanyanghong on 2018/12/24.
 */
public interface SequenceMapper {

    void saveSequence(SequenceDTO sequenceObj);

    SequenceDTO getNextSequenceObj(String type);

    void updateSequence(SequenceDTO sequenceObj);
}
