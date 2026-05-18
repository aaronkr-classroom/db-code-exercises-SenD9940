TABLE users;

SELECT user_level FROM users;

-- CHECK 유저 레벨 1~100만 가능
ALTER TABLE users
ADD CONSTRAINT chk_user_level
CHECK (user_level >= 1 AND user_level <= 100)

UPDATE users
SET user_level = 100
WHERE user_id = 1;

-- CHECK 유저 상태 online, connecting, offline만 가능
SELECT status FROM users;

ALTER TABLE users
ADD CONSTRAINT chk_user_status
CHECK (status in ('online', 'connecting', 'offline'));

UPDATE users
SET status = 'sleeping'
WHERE user_id = 2;

-- 아이템 가격은 0원 이상이어야 한다
SELECT price FROM items;

ALTER TABLE items
ADD CONSTRAINT chk_item_price
CHECK (price >= 0);

UPDATE items
SET price = -10
WHERE item_id = 1001;

-- 아이템 등급을 정해진 값만 가능하다
SELECT grade FROM items;

ALTER TABLE items
ADD CONSTRAINT chk_item_grade
CHECK (grade in ('S', 'A', 'B', 'C', 'D', 'E', 'F'));

-- 닉 네임은 중복되면 안된다
ALTER TABLE users
ADD CONSTRAINT uq_user_nickname
UNIQUE (nickname);

INSERT INTO users VALUES
(6, '홍길동', 'DragonKing', 10, '2026-05-18', 'home@home.com', 'offline');

SELECT CONSTRAINT_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
AND TABLE_NAME = 'plays';
-- plays_user_id_fkey
-- plays_game_id_fkey

SELECT CONSTRAINT_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
AND TABLE_NAME = 'user_items';
-- user_items_user_id_fkey
-- user_items_item_id_fkey

ALTER TABLE plays
DROP CONSTRAINT plays_user_id_fkey;
ALTER TABLE plays
DROP CONSTRAINT plays_game_id_fkey;
ALTER TABLE user_items
DROP CONSTRAINT user_items_user_id_fkey;
ALTER TABLE user_items
DROP CONSTRAINT user_items_item_id_fkey;
ALTER TABLE user_items
DROP CONSTRAINT fk_user_items_users;

-- 새 FK 추가
-- 1: 유저가 삭제 되면 플레이 기록도 삭제
ALTER TABLE plays
ADD CONSTRAINT fk_plays_users
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE;

-- 2: 게임은 플에이 기록이 있으면 삭제하지 못하게 하기
ALTER TABLE plays
ADD CONSTRAINT fk_plays_game
FOREIGN KEY (game_id)
REFERENCES games(game_id)
ON DELETE RESTRICT;

-- 3: 유저가 삭제 되면 보유 아이템 기록도 삭제되게 하기
ALTER TABLE user_items
ADD CONSTRAINT fk_user_items_users
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE;

-- 4: 아이템을 누군가 보유 중이면 삭제 하지 못하게 하기
ALTER TABLE user_items
ADD CONSTRAINT fk_user_items_items
FOREIGN KEY (item_id)
REFERENCES items(item_id)
ON DELETE RESTRICT;

-- CASCADE 테스트
SELECT * FROM plays WHERE user_id = 1;
SELECT * FROM user_items WHERE user_id = 1;

DELETE FROM users where user_id = 1;

-- RESTRICT 테스트
TABLE games;

DELETE FROM items WHERE item_id = 1004;
DELETE FROM games WHERE game_id = 101;

