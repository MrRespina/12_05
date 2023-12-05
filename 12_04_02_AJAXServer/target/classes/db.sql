CREATE TABLE dec04_error(
	e_what VARCHAR2(20 char) PRIMARY KEY,
	e_where VARCHAR2(30 char) not null
);

INSERT INTO dec04_error VALUES('빼먹음','DAO, Controller');
INSERT INTO dec04_error VALUES('Mapper입력안함','servlet-context.xml');
INSERT INTO dec04_error VALUES('세미콜론(;)넣음','Mapper.xml');
INSERT INTO dec04_error VALUES('파일 위치 틀림','프로젝트 전체');

SELECT * FROM dec04_error;

SELECT *  FROM dec04_error;

SELECT * FROM dec04_error WHERE e_what like '%음%' ORDER BY e_where;