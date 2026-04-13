-- customer table
create table Customer(
	customer_id INT PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(13),
	address VARCHAR(100)
);

-- restaurant table
create table Restaurant(
	restaurant_id INT PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(13),
	address VARCHAR(100)
);


-- orders table
create table Orders(
	order_id INT PRIMARY KEY,
	customer_id INT,
	restaurant_id INT,
	date TIMESTAMP,
	total NUMERIC,
	FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
	FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);


-- delivery table
create table Delivery(
	delivery_id INT PRIMARY KEY,
	order_id INT,
	driver_name VARCHAR(100),
	status INT,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Data Insert
insert into Customer VALUES
(1, 'Alice', '010-1111-2222', '충주'),
(2, '김수민', '010-2222-3333', '청주');

insert into Restaurant VALUES
(1, 'Pizza Place', '010-1234-5678', '세종'),
(2, '김밥천국', '063-9876-5432', '전주');

insert into Orders VALUES
(1, 1, 1, '2026-04-13 15:17:00', 24000),
(2, 2, 2, '2026-04-13 12:17:00', 8000);

insert into Delivery VALUES -- status 0:수락됨, 1:조리중, 2:배달중, 3:배달완료, 4:취소됨
(1, 1, '지석준', 1),
(2, 2, '송지현', 2);

-- DB Query
SELECT * FROM Orders;
SELECT * FROM Orders ORDER BY total DESC;
SELECT * FROM Orders WHERE total >= 10000;
SELECT * FROM Delivery WHERE status = 3;

