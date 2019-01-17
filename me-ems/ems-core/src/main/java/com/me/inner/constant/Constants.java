package com.me.inner.constant;

/**
 * Created by Me on 2018/12/14.
 */
public class Constants {

    public interface InvalidStatus {
        String DELETE_ITSELF = "I";
        String DELETE_FACULTY = "F";
        String DELETE_PROFESSION = "P";
        String DELETE_SUBJECT = "S";
        String DELETE_CLAZZ = "C";
        String DELETE_PROFESSION_SUBJECT = "B";
        String DELETE_FACULTY_PROFESSION_SUBJECT = "T";
    }

    public interface Role {
        String STUDENT = "ROLE_STUDENT";    // 学生 00
        String TEACHER = "ROLE_TEACHER";    // 老师 01
        String ADMIN = "ROLE_ADMIN";        //  辅导员 02
        String SUPER_ADMIN = "ROLE_SUPER_ADMIN";    // 系统管理员 03
    }

    public interface CodeName {
        String TEACHER = "TEACHER";
    }

    public interface CodeType {
        String INIT_PASSWORD = "INITPASSWORD";
    }

    public interface Sex {
        String FEMALE = "女";
        String MALE = "男";
    }

    public interface ScoreStatus {
        String CANCEL = "CANCEL";
        String INVALID = "INVALID";
        String VALID = "VALID";
    }

}
