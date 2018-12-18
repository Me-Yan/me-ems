INSERT INTO ems_user(userId_n, username_m, password_x, enabled_c, create_dt, create_m, update_dt, update_m)
VALUES(1, 'admin', '$2a$11$T3jH8viintncquUCIsA8pO5UkfMCYE8XqJctBv/bjz40Xx5RzN9Uy', 'Y', NOW(), 'System', NOW(), 'System');

INSERT INTO ems_role(roleId_n, roleName_m, enabled_c, create_dt, create_m)
VALUES(1, 'ROLE_STUDENT', 'Y', NOW(), 'System');
INSERT INTO ems_role(roleId_n, roleName_m, enabled_c, create_dt, create_m)
VALUES(2, 'ROLE_TEACHER', 'Y', NOW(), 'System');
INSERT INTO ems_role(roleId_n, roleName_m, enabled_c, create_dt, create_m)
VALUES(3, 'ROLE_ADMIN', 'Y', NOW(), 'System');
INSERT INTO ems_role(roleId_n, roleName_m, enabled_c, create_dt, create_m)
VALUES(4, 'ROLE_SUPER_ADMIN', 'Y', NOW(), 'System');

INSERT INTO ems_resource(resId_n, resType_x, resPath_x, resDesc_x, enabled_c, create_dt, create_m)
VALUES(1, 'HOME', '/sutent/index', '学生的首页', 'Y', NOW(), 'System');
INSERT INTO ems_resource(resId_n, resType_x, resPath_x, resDesc_x, enabled_c, create_dt, create_m)
VALUES(2, 'HOME', '/teacher/index', '老师的首页', 'Y', NOW(), 'System');
INSERT INTO ems_resource(resId_n, resType_x, resPath_x, resDesc_x, enabled_c, create_dt, create_m)
VALUES(3, 'HOME', '/admin/index', '管理员的首页', 'Y', NOW(), 'System');
INSERT INTO ems_resource(resId_n, resType_x, resPath_x, resDesc_x, enabled_c, create_dt, create_m)
VALUES(4, 'HOME', '/super/index', '超级管理员的首页', 'Y', NOW(), 'System');

INSERT INTO ems_role2res(id_n, roleId_n, resId_n, create_dt, create_m)
VALUES(1, 1, 1, NOW(), 'System');
INSERT INTO ems_role2res(id_n, roleId_n, resId_n, create_dt, create_m)
VALUES(2, 2, 2, NOW(), 'System');
INSERT INTO ems_role2res(id_n, roleId_n, resId_n, create_dt, create_m)
VALUES(3, 3, 3, NOW(), 'System');
INSERT INTO ems_role2res(id_n, roleId_n, resId_n, create_dt, create_m)
VALUES(4, 4, 4, NOW(), 'System');

INSERT INTO ems_user2role(id_n, userId_n, roleId_n, create_dt, create_m)
VALUES(1, 1, 4, NOW(), 'System');