package com.me.inner.mapper;

import com.me.inner.dto.ScoreDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2018/12/25.
 */
public interface ScoreMapper {

    void saveScoreList(@Param("scoreList") List<ScoreDTO> scoreList);

}
