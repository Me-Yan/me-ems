package com.me.inner.constant;

/**
 * Created by Me on 2018/12/14.
 */
public class Constants {

    public interface Role {
        String STUDENT = "ROLE_STUDENT";    // 学生 00
        String TEACHER = "ROLE_TEACHER";    // 老师 01
        String ADMIN = "ROLE_ADMIN";        //  辅导员 02
        String SUPER_ADMIN = "ROLE_SUPER_ADMIN";    // 系统管理员 03
    }

    public interface Sex {
        String FEMALE = "女";
        String MALE = "男";
    }
}
