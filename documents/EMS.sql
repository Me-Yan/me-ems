系
	ems_faculty
		faculty_id		INT			AUTO_INCREMENT		PRIMARY KEY,
		name_m			VARCHAR(20)	NOT NULL,
		active_c		CHAR(1)		NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL,
		update_dt		DATETIME	NULL,
		update_m		VARCHAR(4)	NULL
		
专业
	ems_profession
		profession_id	INT			AUTO_INCREMENT		PRIMARY	KEY,
		faculty_id		INT 		NOT NULL,
		name_m			VARCHAR(20)	NOT NULL,
		active_c		CHAR(1)		NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL,
		update_dt		DATETIME	NULL,
		update_m		VARCHAR(4)	NULL
		
		
课程
	ems_subject
		subject_id		INT 		AUTO_INCREMENT		PRIMARY KEY,
		name_m			VARCHAR(20)	NOT NULL,
		type_c			CHAR(1)		NOT NULL,
		active_c 		CHAR(1)		NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL
		
专业对应的课程
	ems_profession2subject
		id_n			INT 		AUTO_INCREMENT		PRIMARY KEY,
		profession_id	INT			NOT	NULL,
		subject_id		INT			NOT NULL,
		active_c		CHAR(1)		NOT	NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL

年级
	ems_grade
		grade_id		INT 		AUTO_INCREMENT		PRIMARY	KEY,
		grade_m			VARCHAR(4)	NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL
		
班级
	ems_calss
		class_id		INT 		AUTO_INCREMENT		PRIMARY KEY,
		class_m			VARCHAR(2)	NOT NULL,
		grade_id		INT 		NOT NULL,
		profession_id	INT 		NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL		

教师信息
	ems_teacher
		teacher_id 		INT 		AUTO_INCREMENT		PRIMARY KEY,
		number_x		VARCHAR(10)	NOT NULL,
		password_x		VARCHAR(64)	NOT NULL,
		name_m			VARCHAR(4)	NOT NULL,
		faculty_id		INT			NOT NULL,
		age_n			INT 		NOT NULL,
		sex_n			INT 		NOT NULL,
		birth_dt		DATETIME	NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL,
		update_dt		DATETIME	NULL,
		update_m		VARCHAR(4)	NULL
		
教师的授课表
	ems_teacher2subject
		id_n			INT 		AUTO_INCREMENT		PRIMARY KEY,
		teacher_id		INT			NOT NULL,
		subject_id		INT			NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		start_dt		DATETIME	NOT NULL,
		end_dt			DATETIME	NOT NULL,
		create_m		VARCHAR(4)	NOT NULL
		
学生信息
	ems_student
		student_id		INT			AUTO_INCREMENT		PRIMARY KEY,
		number_x		VARCHAR(10)	NOT NULL,
		password_x		VARCHAR(64)	NOT NULL,
		name_m			VARCHAR(5)	NOT NULL,
		class_id		INT			NOT NULL,
		from_x			VARCHAR(10)	NOT NULL,
		age_n			INT 		NOT NULL,
		sex_n			INT			NOT NULL,
		birth_dt		DATETIME	NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL,
		update_dt		DATETIME	NULL,
		update_m		VARCHAR(4)	NULL
		
学生的选修课表
	ems_student2optional
		id_n			INT			AUTO_INCREMENT		PRIMARY KEY,
		student_id		INT			NOT NULL,
		subject_id		INT			NOT NULL,
		active_c		CHAR(1)		NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL
		
成绩
	ems_score
		score_id		INT			AUTO_INCREMENT		PRIMARY KEY,
		result_n		FLOAT		NOT NULL,
		usual_n			FLOAT		NOT NULL,
		test_n			FLOAT 		NOT NULL,
		status_c		VARCHAR(10)	NOT NULL,
		student_id		INT			NOT NULL,
		subject_id		INT			NOT NULL,
		create_dt		DATETIME	NOT	NULL,
		create_m		VARCHAR(4)	NOT NULL,
		update_dt		DATETIME	NULL,
		update_m		VARCHAR(4)	NULL
