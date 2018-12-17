DROP TABLE IF EXISTS ems_faculty;
CREATE TABLE ems_faculty (
	facultyId_n		INT			AUTO_INCREMENT		NOT NULL,
	name_m			VARCHAR(20)	NOT NULL,
	active_c		CHAR(1)		NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	update_dt		DATETIME	NULL,
	update_m		VARCHAR(4)	NULL,
	PRIMARY KEY(facultyId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_profession;
CREATE TABLE ems_profession (
	professionId_n	INT			AUTO_INCREMENT		NOT NULL,
	facultyId_n		INT 		NOT NULL,
	name_m			VARCHAR(20)	NOT NULL,
	active_c		CHAR(1)		NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	update_dt		DATETIME	NULL,
	update_m		VARCHAR(4)	NULL,
	PRIMARY KEY(professionId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_subject;
CREATE TABLE ems_subject (
	subjectId_n		INT 		AUTO_INCREMENT		NOT NULL,
	name_m			VARCHAR(20)	NOT NULL,
	type_c			CHAR(1)		NOT NULL,
	active_c 		CHAR(1)		NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	PRIMARY KEY(subjectId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_profession2subject;
CREATE TABLE ems_profession2subject (
	id_n			INT 		AUTO_INCREMENT		NOT NULL,
	professionId_n	INT			NOT	NULL,
	subjectId_n		INT			NOT NULL,
	active_c		CHAR(1)		NOT	NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	PRIMARY KEY(id_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_grade;
CREATE TABLE ems_grade (
	gradeId_n		INT 		AUTO_INCREMENT		NOT NULL,
	grade_m			VARCHAR(4)	NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	PRIMARY KEY(gradeId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_class;
CREATE TABLE ems_class (
	classId_n		INT 		AUTO_INCREMENT		NOT NULL,
	class_m			VARCHAR(2)	NOT NULL,
	gradeId_n		INT 		NOT NULL,
	professionId_n	INT 		NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	PRIMARY KEY(classId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_teacher;
CREATE TABLE ems_teacher (
	teacherId_n 	INT 		AUTO_INCREMENT		NOT NULL,
	number_x		VARCHAR(10)	NOT NULL,
	name_m			VARCHAR(4)	NOT NULL,
	facultyId_n		INT			NOT NULL,
	age_n			INT 		NOT NULL,
	sex_n			INT 		NOT NULL,
	birth_dt		DATETIME	NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	update_dt		DATETIME	NULL,
	update_m		VARCHAR(4)	NULL,
	PRIMARY KEY(teacherId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_teacher2subject;
CREATE TABLE ems_teacher2subject (
	id_n			INT 		AUTO_INCREMENT		NOT NULL,
	teacherId_n		INT			NOT NULL,
	subjectId_n		INT			NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	start_dt		DATETIME	NOT NULL,
	end_dt			DATETIME	NOT NULL,
	create_m		VARCHAR(4)	NOT NULL,
	PRIMARY KEY(id_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_student;
CREATE TABLE ems_student (
	studentId_n		INT			AUTO_INCREMENT		NOT NULL,
	number_x		VARCHAR(10)	NOT NULL,
	name_m			VARCHAR(5)	NOT NULL,
	classId_n		INT			NOT NULL,
	from_x			VARCHAR(10)	NOT NULL,
	age_n			INT 		NOT NULL,
	sex_n			INT			NOT NULL,
	birth_dt		DATETIME	NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	update_dt		DATETIME	NULL,
	update_m		VARCHAR(4)	NULL,
	PRIMARY KEY(studentId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_student2optional;
CREATE TABLE ems_student2optional (
	id_n			INT			AUTO_INCREMENT		NOT NULL,
	studentId_n		INT			NOT NULL,
	subjectId_n		INT			NOT NULL,
	active_c		CHAR(1)		NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	PRIMARY KEY(id_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_score;
CREATE TABLE ems_score (
	scoreId_n		INT			AUTO_INCREMENT		NOT NULL,
	result_n		FLOAT		NOT NULL,
	usual_n			FLOAT		NOT NULL,
	test_n			FLOAT 		NOT NULL,
	status_c		VARCHAR(10)	NOT NULL,
	studentId_n		INT			NOT NULL,
	subjectId_n		INT			NOT NULL,
	create_dt		DATETIME	NOT	NULL,
	create_m		VARCHAR(4)	NOT NULL,
	update_dt		DATETIME	NULL,
	update_m		VARCHAR(4)	NULL,
	PRIMARY KEY(scoreId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_sequence;
CREATE TABLE ems_sequence (
	type_c			VARCHAR(10)	NOT NULL,
	lastNumber_x	VARCHAR(10)	NOT NULL,
	nextNumber_x	VARCHAR(10)	NOT NULL,
	nextSeq_n		INT			NOT NULL,
	action_dt		DATETIME	NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ems_code;
CREATE TABLE ems_code (
	codeId_n 		INT UNSIGNED AUTO_INCREMENT 	NOT NULL,
	type_c 			VARCHAR(20) 					NOT NULL,
	name_x 			VARCHAR(50) 					NOT NULL,
	value_x 		VARCHAR(50) 					NOT NULL,
	desc_x 			VARCHAR(200) 					NULL,
	active_c 		CHAR(1) 						NOT NULL DEFAULT 'A',
	create_m	 	VARCHAR(20) 					NOT NULL DEFAULT 'System',
	create_dt 		DATETIME 						NOT NULL DEFAULT NOW(),
	PRIMARY KEY (codeId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_user;
CREATE TABLE ems_user (
	userId_n 		INT	AUTO_INCREMENT				NOT NULL,
	username_m 		VARCHAR(20) 					NOT NULL,
	password_x 		VARCHAR(64) 					NOT NULL,
	enabled_c 		CHAR(1) 						NOT NULL DEFAULT 'Y',
	create_dt 		DATETIME 						NOT NULL DEFAULT NOW(),
	create_m 		VARCHAR(20) 					NOT NULL,
	update_dt 		DATETIME 						NULL DEFAULT NOW(),
	update_m 		VARCHAR(20) 					NULL,
	PRIMARY KEY(userId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_role;
CREATE TABLE ems_role (
	roleId_n 		INT AUTO_INCREMENT 				NOT NULL,
	roleName_m 		VARCHAR(20) 					NOT NULL,
	enabled_c 		CHAR(1) 						NOT NULL DEFAULT 'Y',
	create_dt 		DATETIME 						NOT NULL,
	create_m 		VARCHAR(20) 					NOT NULL,
	PRIMARY KEY(roleId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_resource;
CREATE TABLE ems_resource (
	resId_n 		INT AUTO_INCREMENT 				NOT NULL,
	resType_x 		VARCHAR(20) 					NOT NULL,
	resPath_x 		VARCHAR(20) 					NOT NULL,
	resDesc_x 		VARCHAR(50) 					NULL,
	enabled_c 		CHAR(1) 						NOT NULL DEFAULT 'Y',
	create_dt 		DATETIME 						NOT NULL,
	create_m 		VARCHAR(20) 					NOT NULL,
	PRIMARY KEY(resId_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_user2role;
CREATE TABLE ems_user2role (
	id_n 			INT AUTO_INCREMENT 				NOT NULL,
	userId_n 		INT 							NOT NULL,
	roleId_n 		INT 							NOT NULL,
	create_dt 		DATETIME 						NOT NULL,
	create_m 		VARCHAR(20) 					NOT NULL,
	PRIMARY KEY(id_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_role2res;
CREATE TABLE ems_role2res (
	id_n 			INT AUTO_INCREMENT 				NOT NULL,
	roleId_n 		INT 							NOT NULL,
	resId_n 		INT 							NOT NULL,
	create_dt 		DATETIME 						NOT NULL,
	create_m 		VARCHAR(20) 					NOT NULL,
	PRIMARY KEY(id_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ems_loginHistory;
CREATE TABLE ems_loginHistory (
	id_n 			INT AUTO_INCREMENT 				NOT NULL,
	username_m 		VARCHAR(20) 					NOT NULL,
	ip_x 			VARCHAR(20) 					NOT NULL,
	status_c 		VARCHAR(10) 					NOT NULL,
	create_dt 		DATETIME 						NOT NULL,
	PRIMARY KEY(id_n)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;