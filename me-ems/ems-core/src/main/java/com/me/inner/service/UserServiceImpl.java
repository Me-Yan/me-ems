package com.me.inner.service;

import com.me.inner.dto.StudentDTO;
import com.me.inner.dto.TeacherDTO;
import com.me.inner.mapper.UserMapper;
import com.me.inner.util.CommonUtil;
import com.me.inner.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yanyanghong on 2018/12/24.
 */
@Service
public class UserServiceImpl implements UserService {

    private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    public StudentDTO getStudentByNumber(String number) {
        logger.debug("Execute Method getStudentByNumber...");

        return userMapper.getStudentByNumber(number);
    }

    public TeacherDTO getTeacherByNumber(String number) {
        logger.debug("Execute Method getTeacherByNumber...");

        return userMapper.getTeacherByNumber(number);
    }

    public Boolean checkPassword(String password) {
        logger.debug("Execute Method checkPassword...");

        String number = SecurityUtil.getUserInfo().getUsername();

        String presentPassword = userMapper.getPasswordByNumber(number);

        if (CommonUtil.matches(password, presentPassword)) {
            return true;
        }

        return false;
    }

    public void updatePasswordByNumber(String password) {
        logger.debug("Execute Method updatePasswordByNumber...");

        String number = SecurityUtil.getUserInfo().getUsername();
        String encodedPassword = CommonUtil.encodePassword(password);

        userMapper.updatePasswordByNumber(encodedPassword, number);
    }
}
