CREATE TABLE club(
	id BIGSERIAL,
	title VARCHAR(100),
	max_participants NUMERIC,
	status VARCHAR(50),
	registered_at DATE,
	un_registered_at DATE
)

CREATE TABLE "user"(
	id BIGSERIAL,
	club_id BIGSERIAL,
	name VARCHAR(50),
	birth DATE,
	status VARCHAR(50),
	registered_at DATE,
	un_registered_at DATE
)

INSERT INTO club (title, max_participants, status, registered_at, un_registered_at)
VALUES
	('축구 동아리', 20, 'ACTIVE', '2024-03-01', NULL),
	('농구 동아리', 15, 'ACTIVE', '2024-03-05', NULL),
	('독서 모임', 10, 'INACTIVE', '2023-12-10', '2024-02-01'),
	('코딩 스터디', 25, 'ACTIVE', '2024-01-15', NULL),
	('등산 동호회', 30, 'INACTIVE', '2023-09-20', '2024-01-10');

INSERT INTO "user" (club_id, name, birth, status, registered_at, un_registered_at)
VALUES
	(1, '김민수', '1998-05-10', 'ACTIVE', '2024-03-02', NULL),
	(1, '이영희', '2000-08-21', 'ACTIVE', '2024-03-03', NULL),
	(2, '박철수', '1997-11-15', 'ACTIVE', '2024-03-06', NULL),
	(2, '최지은', '1999-02-28', 'INACTIVE', '2024-03-07', '2024-03-20'),
	(3, '정우성', '1995-07-12', 'INACTIVE', '2023-12-15', '2024-01-30'),
	(3, '한지민', '1996-04-03', 'ACTIVE', '2023-12-20', NULL),
	(4, '강호동', '1990-06-11', 'ACTIVE', '2024-01-20', NULL),
	(4, '유재석', '1992-09-14', 'ACTIVE', '2024-01-22', NULL),
	(5, '신동엽', '1988-01-05', 'INACTIVE', '2023-09-25', '2024-01-15'),
	(5, '이효리', '1993-03-30', 'ACTIVE', '2023-10-01', NULL);

SELECT * FROM club;
SELECT * FROM "user";

SELECT title, status, registered_at FROM club ORDER BY registered_at ASC;
SELECT title, status, registered_at FROM club ORDER BY registered_at DESC;

SELECT name, status, club_id, registered_at FROM "user" ORDER BY club_id ASC;
SELECT name, status, club_id, registered_at FROM "user" ORDER BY club_id DESC;

SELECT title, status, registered_at FROM club WHERE registered_at < '2024-01-01' ORDER BY registered_at DESC;
SELECT name, status, club_id, registered_at FROM "user" WHERE club_id > 2 ORDER BY club_id ASC;