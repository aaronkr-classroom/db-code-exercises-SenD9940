/*

[Entities / 개체]
- Professor

[Properties / 속성]
- id (BIGSERIAL) -- auto incresement
- name (VARCHAR(30))
- department (VARCHAR(50))
- salary (NUMERIC)
- salary_level (NUMERIC)
- hire_date (DATE) -- YYYY-MM-DD
*/
CREATE TABLE prof(
	id BIGSERIAL,
	name VARCHAR(30),
	dept VARCHAR(50),
	salary NUMERIC,
	salary_level NUMERIC,
	hire_date DATE
);

TABLE prof;


-- Insert Data --
INSERT INTO prof(name, dept, salary, salary_level, hire_date) 
VALUES 
	('김정운', '컴퓨터공학', 100000, 2, '1998-12-31'),
	('박지성', 'AI공학', 70000, 1, '2011-3-1'),
	('이재삭', '정보통신공학', 80000, 1, '2003-4-1'),
	('류현지', '간호학', 90000, 1, '2004-4-14'),
	('양정호', '소프트웨어학', 1000000, 9, '1998-12-31');


-- Search Data --
SELECT * FROM prof;

SELECT name, salary FROM prof;
SELECT name, salary FROM prof ORDER BY salary DESC;
SELECT name, salary FROM prof ORDER BY salary ASC;
SELECT name, salary FROM prof WHERE salary > 90000;
SELECT name, salary FROM prof WHERE salary > 90000 ORDER BY salary DESC;
SELECT name, salary FROM prof WHERE name LIKE '김%'; -- PostgresSQL ILIKE 사용시 대소문자 구분 X
SELECT name, dept FROM prof WHERE dept LIKE '%공%' ORDER BY dept DESC;
SELECT name, dept FROM prof WHERE dept LIKE '%공%' ORDER BY dept ASC;
SELECT name, salary FROM prof WHERE salary BETWEEN 70000 AND 90000;
