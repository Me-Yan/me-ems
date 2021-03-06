package com.me.inner.service;

import com.me.inner.constant.Constants;
import com.me.inner.dto.SequenceDTO;
import com.me.inner.mapper.SequenceMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by yanyanghong on 2018/12/24.
 */
@Service
public class PKServiceImpl implements PKService {

    private Logger logger = LoggerFactory.getLogger(PKServiceImpl.class);

    @Autowired
    private SequenceMapper sequenceMapper;

    /**
     * the rule of generating number is year[yyyy]+type(00,01,02,03)+xxxxxx(000001+)
     * @return
     */
    public String getNumber(String roleName) {
        logger.debug("Execute Method generateNumber...");

        String typeCode = null;
        if (Constants.Role.STUDENT.equals(roleName)) {
            typeCode = "00";
        } else if (Constants.Role.TEACHER.equals(roleName)) {
            typeCode = "01";
        } else if (Constants.Role.ADMIN.equals(roleName)) {
            typeCode = "02";
        } else if (Constants.Role.SUPER_ADMIN.equals(roleName)) {
            typeCode = "03";
        }

        SequenceDTO sequenceObj = sequenceMapper.getNextSequenceObj(roleName);

        String lastNumber = null;
        if (null == sequenceObj) {
            String year = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
            int index = 1;
            String suffix = generateSuffix(index);
            lastNumber = year + typeCode + suffix;

            String nextNumber = year + typeCode + generateSuffix(index+1);
            sequenceObj = new SequenceDTO(roleName, lastNumber, nextNumber, index+1, new Date());

            sequenceMapper.saveSequence(sequenceObj);
        } else {
            String year = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
            int index = sequenceObj.getNextSequence() + 1;
            String suffix = generateSuffix(index);
            String nextNumber = year + typeCode + suffix;

            lastNumber = sequenceObj.getNextNumber();
            sequenceObj = new SequenceDTO(roleName, lastNumber, nextNumber, index, new Date());

            sequenceMapper.updateSequence(sequenceObj);
        }

        return lastNumber;
    }

    private String generateSuffix(Integer seqIndex) {
        logger.debug("Execute Method generatePrefix...");

        if (seqIndex<10) {
            return "00000"+seqIndex;
        } else if (seqIndex<100){
            return "0000"+ seqIndex;
        } else if (seqIndex<1000) {
            return "000"+seqIndex;
        } else if (seqIndex<10000) {
            return "00"+seqIndex;
        } else if (seqIndex<100000) {
            return "0"+seqIndex;
        } else {
            return ""+seqIndex;
        }
    }
}
