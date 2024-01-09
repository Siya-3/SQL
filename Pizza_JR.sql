DROP DATABASE PIZZA_DB;
CREATE DATABASE PIZZA_DB;
USE PIZZA_DB;
drop table orders;
CREATE TABLE orders(
row_id INT NOT NULL PRIMARY KEY,
order_id VARCHAR(10) NOT NULL,
created_at DATETIME NOT NULL,
item_id VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
cust_id INT NOT NULL,
delivery BOOLEAN NOT NULL,
add_id INT NOT NULL,
CONSTRAINT orders_fk1 FOREIGN KEY(cust_id) REFERENCES customers(cust_id),
CONSTRAINT orders_fk2 FOREIGN KEY(add_id) REFERENCES address(add_id),
CONSTRAINT orders_fk3 FOREIGN KEY(item_id) REFERENCES item(item_id));
-- CONSTRAINT orders_fk4 FOREIGN KEY(created_at) REFERENCES rota(date)--

INSERT INTO ORDERS (row_id,order_id,created_at,item_id,quantity,cust_id,delivery,add_id)
VALUES
(1,'109','2023-08-10 13:22:00','it_001',2,1,1,1),
(2,'110','2023-08-10 13:22:00','it_003',1,2,1,2),
(3,'111','2023-08-10 13:22:00','it_001',1,3,1,3),
(4,'111','2023-08-10 19:29:00','it_003',1,3,1,3),
(5,'112','2023-08-10 19:19:00','it_019',3,4,0,4),
(6,'112','2023-08-10 19:22:00','it_008',5,4,0,4),
(7,'112','2023-08-10 19:22:00','it_020',5,4,0,4),
(8,'112','2023-08-10 19:22:00','it_023',1,4,0,4),
(9,'112','2023-08-10 13:22:00','it_004',1,4,0,4),
(10,'113','2023-08-10 13:22:05','it_008',1,5,1,5),
(11,'113','2023-08-10 13:22:05','it_009',1,5,1,5),
(12,'113','2023-08-10 13:22:05','it_022',2,5,1,5),
(13,'113','2023-08-10 13:22:03','it_023',1,5,1,5),
(14,'113','2023-08-10 13:22:03','it_025',3,5,1,5),
(15,'114','2023-08-10 13:22:03','it_003',1,6,1,6),
(16,'114','2023-08-10 13:22:03','it_002',1,6,1,6),
(17,'114','2023-08-10 13:22:00','it_010',1,6,1,6),
(18,'114','2023-08-10 13:22:09','it_018',1,6,1,6),
(19,'114','2023-08-10 13:22:09','it_020',1,6,1,6),
(20,'114','2023-08-10 13:22:01','it_025',1,6,1,6),
(21,'114','2023-08-10 13:22:01','it_026',1,6,1,6),
(22,'114','2023-08-10 13:22:01','it_021',1,6,1,6),
(23,'114','2023-08-10 13:22:08','it_029',1,6,1,7),
(24,'115','2023-08-10 13:22:08','it_001',2,7,1,7),
(25,'115','2023-08-10 13:22:08','it_003',4,7,1,7),
(26,'115','2023-08-10 13:22:08','it_005',2,7,1,7),
(27,'115','2023-08-10 13:22:08','it_027',3,1,1,7),
(28,'115','2023-08-10 13:22:01','it_028',3,1,1,7),
(29,'109','2023-08-10 13:22:08','it_029',3,2,1,7),
(30,'109','2023-08-10 13:22:01','it_030',3,2,1,7),
(31,'110','2023-08-10 13:22:01','it_031',5,1,1,7);


CREATE TABLE customers(
cust_id INT NOT NULL PRIMARY KEY,
cust_firstname VARCHAR(50) NOT NULL,
cust_lastname VARCHAR(50) NOT NULL
);
INSERT INTO customers(cust_id,cust_firstname,cust_lastname)
VALUES
(1,'Emily','Johnson'),
(2,'Daniel','Martinez'),
(3,'Olivia','Anderson'),
(4,'Liam','Wilson'),
(5,'Sophia','Davis'),
(6,'Noah','Thompson'),
(7,'Ava','Clark'),
(8,'Ethan','Miller'),
(9,'Mia','Turner'),
(10,'Jackson','Mitchell'),
(11,'Harper','Parker'),
(12,'Aiden','Admas'),
(13,'Isabella','Harris'),
(14,'Lucas','Wright'),
(15,'Grace','Lewis'),
(16,'Oliver','Walker'),
(17,'Amelia','Scott'),
(18,'Benjamin','Hill'),
(19,'Charlotte','White'),
(20,'Henry','Carter');

CREATE TABLE address(
add_id INT NOT NULL PRIMARY KEY,
delivery_address1 VARCHAR(200) NOT NULL,
delivery_address2 VARCHAR(200) NULL,
delivery_city VARCHAR(50) NOT NULL,
delivery_zipcode VARCHAR(20) NOT NULL
);

INSERT INTO address(add_id, delivery_address1, delivery_address2,delivery_city,delivery_zipcode)
VALUES
(1,'607 Trails End Road',NULL,'Manchester','6042'),
(2,'105 Robinson Lane',NULL,'Manchester','6042'),
(3,'75 Valley Road',NULL,'Manchester','6042'),
(4,'56 Real Lambridge Park',NULL,'Manchester','6042'),
(5,'711 Markcob Valley',NULL,'Manchester','6042'),
(6,'94 Slater Street',NULL,'Manchester','6042'),
(7,'159 Adams Street',NULL,'Manchester','6042'),
(8,'26 Pine Street',NULL,'Manchester','6042'),
(9,'99 Downey Valley',NULL,'Manchester','6042'),
(10,'187 Timroad Drive',NULL,'Manchester','6042'),
(11,'15 Cambridge Hill',NULL,'Manchester','6042'),
(12,'612 Valley View',NULL,'Manchester','6042'),
(13,'333 The Original Street',NULL,'Manchester','6042'),
(14,'21 Bunney Store Street',NULL,'Manchester','6042'),
(15,'298 Nexsus Lane',NULL,'Manchester','6042'),
(16,'546 Sidney Road',NULL,'Manchester','6042'),
(17,'989 Downey Street',NULL,'Manchester','6042'),
(18,'73 Mary Road',NULL,'Manchester','6042'),
(19,'154 Cliffside Drive',NULL,'Manchester','6042'),
(20,'25 Concord Road',NULL,'Manchester','6042');

CREATE TABLE item(
item_id VARCHAR(10) NOT NULL PRIMARY KEY,
sku VARCHAR(20) NOT NULL,
item_name VARCHAR(50) NOT NULL,
item_cat VARCHAR(20) NOT NULL,
item_size VARCHAR(20) NOT NULL,
item_price DECIMAL (10,2) NOT NULL
);
-- ALTER TABLE item ADD CONSTRAINT item_fk FOREIGN KEY(sku) REFERENCES recipe(recipe_id);

INSERT INTO item(item_id,sku,item_name,item_cat,item_size,item_price)
VALUES
('it_001','PIZZ-MARG-R','Pizza-Margherita-Reg','Pizza','Regular',12),
('it_002','PIZZ-MARG-L','Pizza-Margherita-Large','Pizza','Large',14),
('it_003','PIZZ-DIAV-R','Pizza-Diavola-(hot)-Reg','Pizza','Regular',16),
('it_004','PIZZ-DIAV-L','Pizza-Diavola-(hot)-Large','Pizza','Large',19),
('it_005','PIZZ-PARM-R','Pizza-Parmiginana-Reg','Pizza','Regular',15),
('it_006','PIZZ-PARM-L','Pizza-Parmiginana-Large','Pizza','Large',18),
('it_007','PIZZ-QUAT-R','Pizza-Quattro-Formaggi-Reg','Pizza','Regular',16),
('it_008','PIZZ-QUAT-L','Pizza-Quattro-Formaggi-Large','Pizza','Large',19),
('it_009','PIZZ-NAPO-R','Pizza-Napolitana-Reg','Pizza','Regular',16),
('it_010','PIZZ-NAPO-L','Pizza-Napolitana-Large','Pizza','Large',18),
('it_011','PIZZ-PEPP-R','Pizza-Pepperoni-Reg','Pizza','Regular',15),
('it_012','PIZZ-PEPP-L','Pizza-Pepperoni-Large','Pizza','Large',17),
('it_013','PIZZ-SEAF-R','Pizza-Seafood-Reg','Pizza','Regular',17),
('it_014','PIZZ-SEAF-L','Pizza-Seafood-Large','Pizza','Large',20),
('it_015','PIZZ-HAWA-R','Pizza-Hawalian-Reg','Pizza','Regular',15),
('it_016','PIZZ-HAWA-L','Pizza-Hawalian-Large','Pizza','Large',17),
('it_017','SIDE-GARL-Bread','Side-Garlic-Bread','Side','Regular',6),
('it_018','SIDE-CHIC-Wings','Side-Chicken-Wings','Side','Regular',7),
('it_019','SIDE-BREA','Side-Breadsticks','Side','Regular',5),
('it_020','SIDE-CAES-Salad','Side-Caesar-Salad','Side','Regular',7),
('it_021','DESS-ICE-CHOC','Dessert-Chocolate-Ice-cream','Dessert','Regular',6),
('it_022','DESS-ICE-VANI','Dessert-Vanilla-Ice-cream','Dessert','Regular',6),
('it_023','DESS-ICE-STRA','Dessert-Strawberry-Ice-cream','Dessert','Regular',6),
('it_024','DESS-ICE-PIST','Dessert-Pistachio-Ice-cream','Dessert','Regular',6),
('it_025','DESS-CHOC-BROW','Dessert-Chocolate-Brownie','Dessert','Regular',5),
('it_026','DESS-BANO-PIE','Dessert-Banoffee-Pie','Dessert','Regular',7),
('it_027','DESS-FRUI-SALA','Dessert-Fruit-Salad','Dessert','Regular',5),
('it_028','BEVA-CC-REG33','Beverage-Coca-Cola','Beverage','33cl',3),
('it_029','BEVA-CC-BEG1500','Beverage-Coca-Cola','Beverage','1.5cl',6),
('it_030','BEVA-CC-DIE33','Beverage-Diet-Coke','Beverage','33cl',3),
('it_031','BEVA-CC-DIE1500','Beverage-Diet-Coke','Beverage','1.5l',6),
('it_032','BEVA-7U-REG33','Beverage-7-Up','Beverage','33cl',3),
('it_033','BEVA-7U-REG1500','Beverage-7-Up','Beverage','1.5l',6);


CREATE TABLE ingredient(
ing_id VARCHAR(10) NOT NULL PRIMARY KEY,
ing_name VARCHAR(200) NOT NULL,
ing_weight INT NOT NULL,
ing_meas VARCHAR(20) NOT NULL,
ing_price DECIMAL(5,2) NOT NULL
);

INSERT INTO ingredient(ing_id,ing_name,ing_weight,ing_meas,ing_price)
VALUES
('ING001','Pizza dough ball(10 pack)',2000,'grams',19.3),
('ING002','Tomato sauce',4500,'grams',4.22),
('ING003','Mozzarella cheese',2500,'grams',3.89),
('ING004','Dried oregano',500,'grams',14.45),
('ING005','Spicy salami',3500,'grams',5.99),
('ING006','Chilli pepper',1000,'grams',37.64),
('ING007','Eggplant',1000,'grams',6.49),
('ING008','Parmesan cheese',2500,'grams',1.9),
('ING009','Gorgonzola cheese',3500,'grams',18.75),
('ING010','Ricotta cheese',1500,'grams',27.64),
('ING011','Anchovies',1000,'grams',3.99),
('ING012','Capers',1000,'grams',10.99),
('ING013','Pepperoni',2500,'grams',4.16),
('ING014','Shrimp',1000,'grams',24.18),
('ING015','Tuna',2000,'grams',8.98),
('ING016','Calamari',2500,'grams',7.66),
('ING017','Ham',5000,'grams',28.77),
('ING018','Pineapple',5000,'grams',32.45),
('ING019','Garlic and Parsley butter',3000,'grams',6.23),
('ING020','Chicken WINGs',6000,'grams',52.1),
('ING021','Rotisserie chicken pieces',5000,'grams',69.83),
('ING022','Croutons',1250,'grams',34.45),
('ING023','Romain lettuce',7500,'grams',5.25),
('ING024','Caesar dress',3800,'grams',13.72),
('ING025','Vanilla ice cream',4500,'grams',17.98),
('ING026','Chocolate ice cream',4500,'grams',15.45),
('ING027','Strawberry ice cream',4500,'grams',15.45),
('ING028','Pistachiao ice cream',4500,'grams',15.45),
('ING029','Chocolate browine',2500,'grams',4.45),
('ING030','Banoffee pie',1200,'grams',1.15),
('ING031','Fruit salad',5000,'grams',7.12);

drop table recipe;
CREATE TABLE recipe(
row_id INT NOT NULL PRIMARY KEY,
recipe_id VARCHAR(20) NOT NULL,
ing_id VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
CONSTRAINT recipe_fk1 FOREIGN KEY(ing_id) REFERENCES ingredient(ing_id)
-- CONSTRAINT recipe_fk2 FOREIGN KEY(ing_id) REFERENCES inventory(item_id)--
);

INSERT INTO recipe(row_id,recipe_id,ing_id,quantity)
VALUES
(1,'PIZZ-MARG-R','ING001',250),
(2,'PIZZ-MARG-R','ING002',80),
(3,'PIZZ-MARG-R','ING003',170),
(4,'PIZZ-MARG-R','ING004',5),
(5,'PIZZ-MARG-L','ING001',300),
(6,'PIZZ-MARG-L','ING002',100),
(7,'PIZZ-MARG-L','ING003',200),
(8,'PIZZ-MARG-L','ING005',8),
(9,'PIZZ-DIAV-R','ING006',250),
(10,'PIZZ-DIAV-R','ING001',80),
(11,'PIZZ-DIAV-R','ING002',170),
(12,'PIZZ-DIAV-R','ING003',50),
(13,'PIZZ-DIAV-L','ING005',10),
(14,'PIZZ-DIAV-L','ING006',300),
(15,'PIZZ-DIAV-L','ING001',100),
(16,'PIZZ-DIAV-L','ING002',200),
(17,'PIZZ-DIAV-L','ING019',70),
(18,'PIZZ-PARM-R','ING007',15),
(19,'PIZZ-PARM-R','ING008',250),
(20,'PIZZ-PARM-R','ING001',80),
(21,'PIZZ-PARM-R','ING002',170),
(22,'PIZZ-PARM-R','ING019',120),
(23,'PIZZ-PARM-L','ING007',170),
(24,'PIZZ-PARM-L','ING008',300),
(25,'PIZZ-PARM-L','ING020',100),
(26,'PIZZ-PARM-L','ING021',200),
(27,'PIZZ-PARM-L','ING003',150),
(28,'PIZZ-QUAT-R','ING008',200),
(29,'PIZZ-QUAT-R','ING009',250),
(30,'PIZZ-QUAT-R','ING020',80),
(31,'PIZZ-QUAT-R','ING021',170),
(32,'PIZZ-QUAT-R','ING003',150),
(33,'PIZZ-QUAT-L','ING007',150),
(34,'PIZZ-QUAT-L','ING008',150),
(35,'PIZZ-QUAT-L','ING020',300),
(36,'SIDE-CHIC-Wings','ING010',300),
(37,'SIDE-CHIC-Wings','ING010',150),
(38,'SIDE-CHIC-Wings','ING011',90),
(39,'SIDE-CHIC-Wings','ING012',170),
(40,'SIDE-CHIC-Wings','ING012',165),
(41,'SIDE-CHIC-Wings','ING013',250),
(42,'SIDE-CHIC-Wings','ING014',430),
(43,'SIDE-CHIC-Wings','ING014',15),
(44,'SIDE-BREA','ING014',30),
(45,'SIDE-BREA','ING015',75),
(46,'SIDE-BREA','ING015',155),
(47,'SIDE-CAES-Salad','ING015',137),
(48,'SIDE-CAES-Salad','ING016',15),
(49,'SIDE-CAES-Salad','ING016',65),
(50,'DESS-ICE-CHOC','ING017',85),
(51,'DESS-ICE-CHOC','ING017',45),
(52,'DESS-ICE-CHOC','ING018',45),
(53,'DESS-ICE-VANI','ING022',75),
(54,'DESS-ICE-VANI','ING022',155),
(55,'DESS-ICE-STRA','ING023',137),
(56,'DESS-ICE-STRA','ING023',15),
(57,'DESS-ICE-PIST','ING024',675),
(58,'DESS-ICE-PIST','ING024',85),
(59,'DESS-CHOC-BROW','ING025',45),
(60,'DESS-CHOC-BROW','ING025',45),
(61,'DESS-BANO-PIE','ING026',200),
(62,'DESS-BANO-PIE','ING026',150),
(63,'DESS-FRUI-SALA','ING027',200),
(64,'DESS-FRUI-SALA','ING028',250),
(65,'BEVA-CC-REG33','ING027',80),
(66,'BEVA-CC-REG33','ING028',170),
(67,'BEVA-CC-BEG1500','ING029',150),
(68,'BEVA-CC-BEG1500','ING029',150),
(69,'BEVA-CC-DIE33','ING030',150),
(70,'BEVA-CC-DIE33','ING030',300),
(71,'BEVA-CC-DIE1500','ING027',80),
(72,'BEVA-CC-DIE1500','ING028',170),
(73,'BEVA-7U-REG33','ING029',150),
(74,'BEVA-7U-REG33','ING029',150),
(75,'BEVA-7U-REG1500','ING031',150),
(76,'BEVA-7U-REG1500','ING031',300),
(77,'PIZZ-NAPO-R','ING010',300),
(78,'PIZZ-NAPO-R','ING010',300),
(79,'PIZZ-NAPO-R','ING010',300);


CREATE TABLE inventory(
inv_id INT  NOT NULL PRIMARY KEY,
item_id VARCHAR(10) NOT NULL ,
quantity INT NOT NULL
);
ALTER TABLE inventory ADD CONSTRAINT inventory_fk FOREIGN KEY(item_id) REFERENCES item(item_id);

INSERT INTO inventory(inv_id,item_id,quantity)
VALUES
(1,'it_001',3),
(2,'it_002',4),
(3,'it_003',3),
(4,'it_004',4),
(5,'it_005',6),
(6,'it_006',1),
(7,'it_007',1),
(8,'it_008',1),
(9,'it_009',8),
(10,'it_010',2),
(11,'it_011',1),
(12,'it_012',3),
(13,'it_013',3),
(14,'it_014',3),
(15,'it_015',2),
(16,'it_016',2),
(17,'it_017',2),
(18,'it_018',10),
(19,'it_019',9),
(20,'it_020',1),
(21,'it_021',3),
(22,'it_022',3),
(23,'it_023',1),
(24,'it_024',1),
(25,'it_025',1),
(26,'it_026',2),
(27,'it_027',2),
(28,'it_028',2),
(29,'it_029',1),
(30,'it_030',1),
(31,'it_031',1),
(32,'it_032',3),
(33,'it_033',3);

CREATE TABLE rota(
row_id INT NOT NULL PRIMARY KEY,
rota_id VARCHAR(20) NOT NULL,
date DATETIME NOT NULL,
shift_id VARCHAR(20) NOT NULL,
staff_id VARCHAR(20) NOT NULL,
CONSTRAINT rota_fk1 FOREIGN KEY(shift_id) REFERENCES shift(shift_id),
CONSTRAINT rota_fk2 FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

INSERT INTO rota(row_id,rota_id,date,shift_id,staff_id)
VALUES
(1,'ro001','2022-02-16','sh005','st001'),
(2,'ro001','2022-02-16','sh005','st002'),
(3,'ro001','2022-02-16','sh005','st009'),
(4,'ro001','2022-02-16','sh005','st010'),
(5,'ro001','2022-02-16','sh006','st001'),
(6,'ro001','2022-02-16','sh006','st002'),
(7,'ro001','2022-02-16','sh006','st009'),
(8,'ro001','2022-02-16','sh006','st010'),
(9,'ro002','2022-02-16','sh007','st001'),
(10,'ro002','2022-02-17','sh007','st002'),
(11,'ro002','2022-02-17','sh007','st009'),
(12,'ro002','2022-02-17','sh007','st010'),
(13,'ro002','2022-02-17','sh008','st001'),
(14,'ro002','2022-02-17','sh008','st002'),
(15,'ro002','2022-02-17','sh008','st009'),
(16,'ro002','2022-02-17','sh008','st010'),
(17,'ro003','2022-02-18','sh009','st001'),
(18,'ro003','2022-02-18','sh009','st002'),
(19,'ro003','2022-02-18','sh009','st009'),
(20,'ro003','2022-02-18','sh009','st010'),
(21,'ro003','2022-02-18','sh010','st001'),
(22,'ro003','2022-02-18','sh010','st002'),
(23,'ro003','2022-02-18','sh010','st009'),
(24,'ro003','2022-02-18','sh010','st010'),
(25,'ro004','2022-02-19','sh011','st001'),
(26,'ro004','2022-02-19','sh011','st002'),
(27,'ro004','2022-02-19','sh011','st009'),
(28,'ro004','2022-02-19','sh011','st010'),
(29,'ro004','2022-02-19','sh011','st001'),
(30,'ro004','2022-02-19','sh011','st002'),
(31,'ro004','2022-02-19','sh011','st003'),
(32,'ro004','2022-02-19','sh011','st004');

CREATE TABLE shift(
shift_id VARCHAR(20) NOT NULL PRIMARY KEY,
day_of_week VARCHAR(10) NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL
);

INSERT INTO shift(shift_id,day_of_week,start_time,end_time)
VALUES
('sh001','Monday','10:30:00','14:00:00'),
('sh002','Monday','18:30:00','23:00:00'),
('sh003','Tuesday','10:30:00','14:00:00'),
('sh004','Tuesday','18:30:00','23:00:00'),
('sh005','Wednesday','10:30:00','14:00:00'),
('sh006','Wednesday','18:30:00','23:00:00'),
('sh007','Thursday','10:30:00','14:00:00'),
('sh008','Thursday','18:30:00','23:00:00'),
('sh009','Friday','10:30:00','14:00:00'),
('sh010','Friday','18:30:00','23:00:00'),
('sh011','Saturday','10:30:00','14:00:00'),
('sh012','Saturday','18:30:00','23:00:00'),
('sh013','Sunday','10:30:00','14:00:00'),
('sh014','Sunday','18:30:00','23:00:00');

CREATE TABLE staff(
staff_id VARCHAR(20) NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
position VARCHAR(20) NOT NULL,
hourly_rate DECIMAL(5,2) NOT NULL
);

INSERT INTO staff(staff_id,first_name,last_name,position,hourly_rate)
VALUES
('st001','Mindy','Sloan','Chef',17.25),
('st002','Luqman','Cantu','Head_Chef',21.5),
('st003','Seren','Lindey','Chef',17.25),
('st004','Arran','Hodgson','Head_Chef',21.5),
('st005','Talha','Portillo','Chef',17.25),
('st006','Sana','Black','Head_Chef',21.5),
('st007','Zachery','Robins','Chef',17.25),
('st008','Faraz','Peck','Head_Chef',21.5),
('st009','Lilly-Rose','Vaughn','Delivery_rider',14.5),
('st010','Desiree','Gardner','Delivery_rider',14.5),
('st011','Ivan','English','Delivery_rider',14.5),
('st012','Johnathon','Bradford','Delivery_rider',14.5),
('st013','Matilda','Maccarty','Delivery_rider',14.5),
('st014','Areeb','Vasquez','Delivery_rider',14.5),
('st015','Amiyah','Lambert','Delivery_rider',14.5),
('st016','Amrit','Greaves','Delivery_rider',14.5);





CREATE TABLE address(
add_id INT NOT NULL PRIMARY KEY,
delievry_address1 VARCHAR(200) NOT NULL,
delievry_address2 VARCHAR(200) NULL,
delivery_city VARCHAR(50) NOT NULL,
delivery_zipcode VARCHAR(20) NOT NULL
);

INSERT INTO address(add_id, delivery_address1, delivery_address2,delivery_city,delivery_zipcode)
VALUES
(1,'607 Trails End Road',NULL,'Manchester','6042'),
(2,'105 Robinson Lane',NULL,'Manchester','6042'),
(3,'75 Valley Road',NULL,'Manchester','6042'),
(4,'56 Real Lambridge Park',NULL,'Manchester','6042'),
(5,'711 Markcob Valley',NULL,'Manchester','6042'),
(6,'94 Slater Street',NULL,'Manchester','6042'),
(7,'159 Adams Street',NULL,'Manchester','6042'),
(8,'26 Pine Street',NULL,'Manchester','6042'),
(9,'99 Downey Valley',NULL,'Manchester','6042'),
(10,'187 Timroad Drive',NULL,'Manchester','6042'),
(11,'15 Cambridge Hill',NULL,'Manchester','6042'),
(12,'612 Valley View',NULL,'Manchester','6042'),
(13,'333 The Original Street',NULL,'Manchester','6042'),
(14,'21 Bunney Store Street',NULL,'Manchester','6042'),
(15,'298 Nexsus Lane',NULL,'Manchester','6042'),
(16,'546 Sidney Road',NULL,'Manchester','6042'),
(17,'989 Downey Street',NULL,'Manchester','6042'),
(18,'73 Mary Road',NULL,'Manchester','6042'),
(19,'154 Cliffside Drive',NULL,'Manchester','6042'),
(20,'25 Concord Road',NULL,'Manchester','6042');

DROP DATABASE PIZZA_DB;
CREATE DATABASE PIZZA_DB;
USE PIZZA_DB;
drop table orders;
CREATE TABLE orders(
row_id INT NOT NULL PRIMARY KEY,
order_id VARCHAR(10) NOT NULL,
created_at DATETIME NOT NULL,
item_id VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
cust_id INT NOT NULL,
delivery BOOLEAN NOT NULL,
add_id INT NOT NULL,
CONSTRAINT orders_fk1 FOREIGN KEY(cust_id) REFERENCES customers(cust_id),
CONSTRAINT orders_fk2 FOREIGN KEY(add_id) REFERENCES address(add_id),
CONSTRAINT orders_fk3 FOREIGN KEY(item_id) REFERENCES item(item_id));
-- CONSTRAINT orders_fk4 FOREIGN KEY(created_at) REFERENCES rota(date)--

INSERT INTO ORDERS (row_id,order_id,created_at,item_id,quantity,cust_id,delivery,add_id)
VALUES
(1,'109','2023-08-10 13:22:00','it_001',2,1,1,1),
(2,'110','2023-08-10 13:22:00','it_003',1,2,1,2),
(3,'111','2023-08-10 13:22:00','it_001',1,3,1,3),
(4,'111','2023-08-10 19:29:00','it_003',1,3,1,3),
(5,'112','2023-08-10 19:19:00','it_019',3,4,0,4),
(6,'112','2023-08-10 19:22:00','it_008',5,4,0,4),
(7,'112','2023-08-10 19:22:00','it_020',5,4,0,4),
(8,'112','2023-08-10 19:22:00','it_023',1,4,0,4),
(9,'112','2023-08-10 13:22:00','it_004',1,4,0,4),
(10,'113','2023-08-10 13:22:05','it_008',1,5,1,5),
(11,'113','2023-08-10 13:22:05','it_009',1,5,1,5),
(12,'113','2023-08-10 13:22:05','it_022',2,5,1,5),
(13,'113','2023-08-10 13:22:03','it_023',1,5,1,5),
(14,'113','2023-08-10 13:22:03','it_025',3,5,1,5),
(15,'114','2023-08-10 13:22:03','it_003',1,6,1,6),
(16,'114','2023-08-10 13:22:03','it_002',1,6,1,6),
(17,'114','2023-08-10 13:22:00','it_010',1,6,1,6),
(18,'114','2023-08-10 13:22:09','it_018',1,6,1,6),
(19,'114','2023-08-10 13:22:09','it_020',1,6,1,6),
(20,'114','2023-08-10 13:22:01','it_025',1,6,1,6),
(21,'114','2023-08-10 13:22:01','it_026',1,6,1,6),
(22,'114','2023-08-10 13:22:01','it_021',1,6,1,6),
(23,'114','2023-08-10 13:22:08','it_029',1,6,1,7),
(24,'115','2023-08-10 13:22:08','it_001',2,7,1,7),
(25,'115','2023-08-10 13:22:08','it_003',4,7,1,7),
(26,'115','2023-08-10 13:22:08','it_005',2,7,1,7),
(27,'115','2023-08-10 13:22:08','it_027',3,1,1,7),
(28,'115','2023-08-10 13:22:01','it_028',3,1,1,7),
(29,'109','2023-08-10 13:22:08','it_029',3,2,1,7),
(30,'109','2023-08-10 13:22:01','it_030',3,2,1,7),
(31,'110','2023-08-10 13:22:01','it_031',5,1,1,7);


CREATE TABLE customers(
cust_id INT NOT NULL PRIMARY KEY,
cust_firstname VARCHAR(50) NOT NULL,
cust_lastname VARCHAR(50) NOT NULL
);
INSERT INTO customers(cust_id,cust_firstname,cust_lastname)
VALUES
(1,'Emily','Johnson'),
(2,'Daniel','Martinez'),
(3,'Olivia','Anderson'),
(4,'Liam','Wilson'),
(5,'Sophia','Davis'),
(6,'Noah','Thompson'),
(7,'Ava','Clark'),
(8,'Ethan','Miller'),
(9,'Mia','Turner'),
(10,'Jackson','Mitchell'),
(11,'Harper','Parker'),
(12,'Aiden','Admas'),
(13,'Isabella','Harris'),
(14,'Lucas','Wright'),
(15,'Grace','Lewis'),
(16,'Oliver','Walker'),
(17,'Amelia','Scott'),
(18,'Benjamin','Hill'),
(19,'Charlotte','White'),
(20,'Henry','Carter');

CREATE TABLE address(
add_id INT NOT NULL PRIMARY KEY,
delivery_address1 VARCHAR(200) NOT NULL,
delivery_address2 VARCHAR(200) NULL,
delivery_city VARCHAR(50) NOT NULL,
delivery_zipcode VARCHAR(20) NOT NULL
);

INSERT INTO address(add_id, delivery_address1, delivery_address2,delivery_city,delivery_zipcode)
VALUES
(1,'607 Trails End Road',NULL,'Manchester','6042'),
(2,'105 Robinson Lane',NULL,'Manchester','6042'),
(3,'75 Valley Road',NULL,'Manchester','6042'),
(4,'56 Real Lambridge Park',NULL,'Manchester','6042'),
(5,'711 Markcob Valley',NULL,'Manchester','6042'),
(6,'94 Slater Street',NULL,'Manchester','6042'),
(7,'159 Adams Street',NULL,'Manchester','6042'),
(8,'26 Pine Street',NULL,'Manchester','6042'),
(9,'99 Downey Valley',NULL,'Manchester','6042'),
(10,'187 Timroad Drive',NULL,'Manchester','6042'),
(11,'15 Cambridge Hill',NULL,'Manchester','6042'),
(12,'612 Valley View',NULL,'Manchester','6042'),
(13,'333 The Original Street',NULL,'Manchester','6042'),
(14,'21 Bunney Store Street',NULL,'Manchester','6042'),
(15,'298 Nexsus Lane',NULL,'Manchester','6042'),
(16,'546 Sidney Road',NULL,'Manchester','6042'),
(17,'989 Downey Street',NULL,'Manchester','6042'),
(18,'73 Mary Road',NULL,'Manchester','6042'),
(19,'154 Cliffside Drive',NULL,'Manchester','6042'),
(20,'25 Concord Road',NULL,'Manchester','6042');

CREATE TABLE item(
item_id VARCHAR(10) NOT NULL PRIMARY KEY,
sku VARCHAR(20) NOT NULL,
item_name VARCHAR(50) NOT NULL,
item_cat VARCHAR(20) NOT NULL,
item_size VARCHAR(20) NOT NULL,
item_price DECIMAL (10,2) NOT NULL
);
-- ALTER TABLE item ADD CONSTRAINT item_fk FOREIGN KEY(sku) REFERENCES recipe(recipe_id);

INSERT INTO item(item_id,sku,item_name,item_cat,item_size,item_price)
VALUES
('it_001','PIZZ-MARG-R','Pizza-Margherita-Reg','Pizza','Regular',12),
('it_002','PIZZ-MARG-L','Pizza-Margherita-Large','Pizza','Large',14),
('it_003','PIZZ-DIAV-R','Pizza-Diavola-(hot)-Reg','Pizza','Regular',16),
('it_004','PIZZ-DIAV-L','Pizza-Diavola-(hot)-Large','Pizza','Large',19),
('it_005','PIZZ-PARM-R','Pizza-Parmiginana-Reg','Pizza','Regular',15),
('it_006','PIZZ-PARM-L','Pizza-Parmiginana-Large','Pizza','Large',18),
('it_007','PIZZ-QUAT-R','Pizza-Quattro-Formaggi-Reg','Pizza','Regular',16),
('it_008','PIZZ-QUAT-L','Pizza-Quattro-Formaggi-Large','Pizza','Large',19),
('it_009','PIZZ-NAPO-R','Pizza-Napolitana-Reg','Pizza','Regular',16),
('it_010','PIZZ-NAPO-L','Pizza-Napolitana-Large','Pizza','Large',18),
('it_011','PIZZ-PEPP-R','Pizza-Pepperoni-Reg','Pizza','Regular',15),
('it_012','PIZZ-PEPP-L','Pizza-Pepperoni-Large','Pizza','Large',17),
('it_013','PIZZ-SEAF-R','Pizza-Seafood-Reg','Pizza','Regular',17),
('it_014','PIZZ-SEAF-L','Pizza-Seafood-Large','Pizza','Large',20),
('it_015','PIZZ-HAWA-R','Pizza-Hawalian-Reg','Pizza','Regular',15),
('it_016','PIZZ-HAWA-L','Pizza-Hawalian-Large','Pizza','Large',17),
('it_017','SIDE-GARL-Bread','Side-Garlic-Bread','Side','Regular',6),
('it_018','SIDE-CHIC-Wings','Side-Chicken-Wings','Side','Regular',7),
('it_019','SIDE-BREA','Side-Breadsticks','Side','Regular',5),
('it_020','SIDE-CAES-Salad','Side-Caesar-Salad','Side','Regular',7),
('it_021','DESS-ICE-CHOC','Dessert-Chocolate-Ice-cream','Dessert','Regular',6),
('it_022','DESS-ICE-VANI','Dessert-Vanilla-Ice-cream','Dessert','Regular',6),
('it_023','DESS-ICE-STRA','Dessert-Strawberry-Ice-cream','Dessert','Regular',6),
('it_024','DESS-ICE-PIST','Dessert-Pistachio-Ice-cream','Dessert','Regular',6),
('it_025','DESS-CHOC-BROW','Dessert-Chocolate-Brownie','Dessert','Regular',5),
('it_026','DESS-BANO-PIE','Dessert-Banoffee-Pie','Dessert','Regular',7),
('it_027','DESS-FRUI-SALA','Dessert-Fruit-Salad','Dessert','Regular',5),
('it_028','BEVA-CC-REG33','Beverage-Coca-Cola','Beverage','33cl',3),
('it_029','BEVA-CC-BEG1500','Beverage-Coca-Cola','Beverage','1.5cl',6),
('it_030','BEVA-CC-DIE33','Beverage-Diet-Coke','Beverage','33cl',3),
('it_031','BEVA-CC-DIE1500','Beverage-Diet-Coke','Beverage','1.5l',6),
('it_032','BEVA-7U-REG33','Beverage-7-Up','Beverage','33cl',3),
('it_033','BEVA-7U-REG1500','Beverage-7-Up','Beverage','1.5l',6);


CREATE TABLE ingredient(
ing_id VARCHAR(10) NOT NULL PRIMARY KEY,
ing_name VARCHAR(200) NOT NULL,
ing_weight INT NOT NULL,
ing_meas VARCHAR(20) NOT NULL,
ing_price DECIMAL(5,2) NOT NULL
);

INSERT INTO ingredient(ing_id,ing_name,ing_weight,ing_meas,ing_price)
VALUES
('ING001','Pizza dough ball(10 pack)',2000,'grams',19.3),
('ING002','Tomato sauce',4500,'grams',4.22),
('ING003','Mozzarella cheese',2500,'grams',3.89),
('ING004','Dried oregano',500,'grams',14.45),
('ING005','Spicy salami',3500,'grams',5.99),
('ING006','Chilli pepper',1000,'grams',37.64),
('ING007','Eggplant',1000,'grams',6.49),
('ING008','Parmesan cheese',2500,'grams',1.9),
('ING009','Gorgonzola cheese',3500,'grams',18.75),
('ING010','Ricotta cheese',1500,'grams',27.64),
('ING011','Anchovies',1000,'grams',3.99),
('ING012','Capers',1000,'grams',10.99),
('ING013','Pepperoni',2500,'grams',4.16),
('ING014','Shrimp',1000,'grams',24.18),
('ING015','Tuna',2000,'grams',8.98),
('ING016','Calamari',2500,'grams',7.66),
('ING017','Ham',5000,'grams',28.77),
('ING018','Pineapple',5000,'grams',32.45),
('ING019','Garlic and Parsley butter',3000,'grams',6.23),
('ING020','Chicken WINGs',6000,'grams',52.1),
('ING021','Rotisserie chicken pieces',5000,'grams',69.83),
('ING022','Croutons',1250,'grams',34.45),
('ING023','Romain lettuce',7500,'grams',5.25),
('ING024','Caesar dress',3800,'grams',13.72),
('ING025','Vanilla ice cream',4500,'grams',17.98),
('ING026','Chocolate ice cream',4500,'grams',15.45),
('ING027','Strawberry ice cream',4500,'grams',15.45),
('ING028','Pistachiao ice cream',4500,'grams',15.45),
('ING029','Chocolate browine',2500,'grams',4.45),
('ING030','Banoffee pie',1200,'grams',1.15),
('ING031','Fruit salad',5000,'grams',7.12);

drop table recipe;
CREATE TABLE recipe(
row_id INT NOT NULL PRIMARY KEY,
recipe_id VARCHAR(20) NOT NULL,
ing_id VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
CONSTRAINT recipe_fk1 FOREIGN KEY(ing_id) REFERENCES ingredient(ing_id)
-- CONSTRAINT recipe_fk2 FOREIGN KEY(ing_id) REFERENCES inventory(item_id)--
);

INSERT INTO recipe(row_id,recipe_id,ing_id,quantity)
VALUES
(1,'PIZZ-MARG-R','ING001',250),
(2,'PIZZ-MARG-R','ING002',80),
(3,'PIZZ-MARG-R','ING003',170),
(4,'PIZZ-MARG-R','ING004',5),
(5,'PIZZ-MARG-L','ING001',300),
(6,'PIZZ-MARG-L','ING002',100),
(7,'PIZZ-MARG-L','ING003',200),
(8,'PIZZ-MARG-L','ING005',8),
(9,'PIZZ-DIAV-R','ING006',250),
(10,'PIZZ-DIAV-R','ING001',80),
(11,'PIZZ-DIAV-R','ING002',170),
(12,'PIZZ-DIAV-R','ING003',50),
(13,'PIZZ-DIAV-L','ING005',10),
(14,'PIZZ-DIAV-L','ING006',300),
(15,'PIZZ-DIAV-L','ING001',100),
(16,'PIZZ-DIAV-L','ING002',200),
(17,'PIZZ-DIAV-L','ING019',70),
(18,'PIZZ-PARM-R','ING007',15),
(19,'PIZZ-PARM-R','ING008',250),
(20,'PIZZ-PARM-R','ING001',80),
(21,'PIZZ-PARM-R','ING002',170),
(22,'PIZZ-PARM-R','ING019',120),
(23,'PIZZ-PARM-L','ING007',170),
(24,'PIZZ-PARM-L','ING008',300),
(25,'PIZZ-PARM-L','ING020',100),
(26,'PIZZ-PARM-L','ING021',200),
(27,'PIZZ-PARM-L','ING003',150),
(28,'PIZZ-QUAT-R','ING008',200),
(29,'PIZZ-QUAT-R','ING009',250),
(30,'PIZZ-QUAT-R','ING020',80),
(31,'PIZZ-QUAT-R','ING021',170),
(32,'PIZZ-QUAT-R','ING003',150),
(33,'PIZZ-QUAT-L','ING007',150),
(34,'PIZZ-QUAT-L','ING008',150),
(35,'PIZZ-QUAT-L','ING020',300),
(36,'SIDE-CHIC-Wings','ING010',300),
(37,'SIDE-CHIC-Wings','ING010',150),
(38,'SIDE-CHIC-Wings','ING011',90),
(39,'SIDE-CHIC-Wings','ING012',170),
(40,'SIDE-CHIC-Wings','ING012',165),
(41,'SIDE-CHIC-Wings','ING013',250),
(42,'SIDE-CHIC-Wings','ING014',430),
(43,'SIDE-CHIC-Wings','ING014',15),
(44,'SIDE-BREA','ING014',30),
(45,'SIDE-BREA','ING015',75),
(46,'SIDE-BREA','ING015',155),
(47,'SIDE-CAES-Salad','ING015',137),
(48,'SIDE-CAES-Salad','ING016',15),
(49,'SIDE-CAES-Salad','ING016',65),
(50,'DESS-ICE-CHOC','ING017',85),
(51,'DESS-ICE-CHOC','ING017',45),
(52,'DESS-ICE-CHOC','ING018',45),
(53,'DESS-ICE-VANI','ING022',75),
(54,'DESS-ICE-VANI','ING022',155),
(55,'DESS-ICE-STRA','ING023',137),
(56,'DESS-ICE-STRA','ING023',15),
(57,'DESS-ICE-PIST','ING024',675),
(58,'DESS-ICE-PIST','ING024',85),
(59,'DESS-CHOC-BROW','ING025',45),
(60,'DESS-CHOC-BROW','ING025',45),
(61,'DESS-BANO-PIE','ING026',200),
(62,'DESS-BANO-PIE','ING026',150),
(63,'DESS-FRUI-SALA','ING027',200),
(64,'DESS-FRUI-SALA','ING028',250),
(65,'BEVA-CC-REG33','ING027',80),
(66,'BEVA-CC-REG33','ING028',170),
(67,'BEVA-CC-BEG1500','ING029',150),
(68,'BEVA-CC-BEG1500','ING029',150),
(69,'BEVA-CC-DIE33','ING030',150),
(70,'BEVA-CC-DIE33','ING030',300),
(71,'BEVA-CC-DIE1500','ING027',80),
(72,'BEVA-CC-DIE1500','ING028',170),
(73,'BEVA-7U-REG33','ING029',150),
(74,'BEVA-7U-REG33','ING029',150),
(75,'BEVA-7U-REG1500','ING031',150),
(76,'BEVA-7U-REG1500','ING031',300),
(77,'PIZZ-NAPO-R','ING010',300),
(78,'PIZZ-NAPO-R','ING010',300),
(79,'PIZZ-NAPO-R','ING010',300);


CREATE TABLE inventory(
inv_id INT  NOT NULL PRIMARY KEY,
item_id VARCHAR(10) NOT NULL ,
quantity INT NOT NULL
);
ALTER TABLE inventory ADD CONSTRAINT inventory_fk FOREIGN KEY(item_id) REFERENCES item(item_id);

INSERT INTO inventory(inv_id,item_id,quantity)
VALUES
(1,'it_001',3),
(2,'it_002',4),
(3,'it_003',3),
(4,'it_004',4),
(5,'it_005',6),
(6,'it_006',1),
(7,'it_007',1),
(8,'it_008',1),
(9,'it_009',8),
(10,'it_010',2),
(11,'it_011',1),
(12,'it_012',3),
(13,'it_013',3),
(14,'it_014',3),
(15,'it_015',2),
(16,'it_016',2),
(17,'it_017',2),
(18,'it_018',10),
(19,'it_019',9),
(20,'it_020',1),
(21,'it_021',3),
(22,'it_022',3),
(23,'it_023',1),
(24,'it_024',1),
(25,'it_025',1),
(26,'it_026',2),
(27,'it_027',2),
(28,'it_028',2),
(29,'it_029',1),
(30,'it_030',1),
(31,'it_031',1),
(32,'it_032',3),
(33,'it_033',3);

CREATE TABLE rota(
row_id INT NOT NULL PRIMARY KEY,
rota_id VARCHAR(20) NOT NULL,
date DATETIME NOT NULL,
shift_id VARCHAR(20) NOT NULL,
staff_id VARCHAR(20) NOT NULL,
CONSTRAINT rota_fk1 FOREIGN KEY(shift_id) REFERENCES shift(shift_id),
CONSTRAINT rota_fk2 FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

INSERT INTO rota(row_id,rota_id,date,shift_id,staff_id)
VALUES
(1,'ro001','2022-02-16','sh005','st001'),
(2,'ro001','2022-02-16','sh005','st002'),
(3,'ro001','2022-02-16','sh005','st009'),
(4,'ro001','2022-02-16','sh005','st010'),
(5,'ro001','2022-02-16','sh006','st001'),
(6,'ro001','2022-02-16','sh006','st002'),
(7,'ro001','2022-02-16','sh006','st009'),
(8,'ro001','2022-02-16','sh006','st010'),
(9,'ro002','2022-02-16','sh007','st001'),
(10,'ro002','2022-02-17','sh007','st002'),
(11,'ro002','2022-02-17','sh007','st009'),
(12,'ro002','2022-02-17','sh007','st010'),
(13,'ro002','2022-02-17','sh008','st001'),
(14,'ro002','2022-02-17','sh008','st002'),
(15,'ro002','2022-02-17','sh008','st009'),
(16,'ro002','2022-02-17','sh008','st010'),
(17,'ro003','2022-02-18','sh009','st001'),
(18,'ro003','2022-02-18','sh009','st002'),
(19,'ro003','2022-02-18','sh009','st009'),
(20,'ro003','2022-02-18','sh009','st010'),
(21,'ro003','2022-02-18','sh010','st001'),
(22,'ro003','2022-02-18','sh010','st002'),
(23,'ro003','2022-02-18','sh010','st009'),
(24,'ro003','2022-02-18','sh010','st010'),
(25,'ro004','2022-02-19','sh011','st001'),
(26,'ro004','2022-02-19','sh011','st002'),
(27,'ro004','2022-02-19','sh011','st009'),
(28,'ro004','2022-02-19','sh011','st010'),
(29,'ro004','2022-02-19','sh011','st001'),
(30,'ro004','2022-02-19','sh011','st002'),
(31,'ro004','2022-02-19','sh011','st003'),
(32,'ro004','2022-02-19','sh011','st004');

CREATE TABLE shift(
shift_id VARCHAR(20) NOT NULL PRIMARY KEY,
day_of_week VARCHAR(10) NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL
);

INSERT INTO shift(shift_id,day_of_week,start_time,end_time)
VALUES
('sh001','Monday','10:30:00','14:00:00'),
('sh002','Monday','18:30:00','23:00:00'),
('sh003','Tuesday','10:30:00','14:00:00'),
('sh004','Tuesday','18:30:00','23:00:00'),
('sh005','Wednesday','10:30:00','14:00:00'),
('sh006','Wednesday','18:30:00','23:00:00'),
('sh007','Thursday','10:30:00','14:00:00'),
('sh008','Thursday','18:30:00','23:00:00'),
('sh009','Friday','10:30:00','14:00:00'),
('sh010','Friday','18:30:00','23:00:00'),
('sh011','Saturday','10:30:00','14:00:00'),
('sh012','Saturday','18:30:00','23:00:00'),
('sh013','Sunday','10:30:00','14:00:00'),
('sh014','Sunday','18:30:00','23:00:00');

CREATE TABLE staff(
staff_id VARCHAR(20) NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
position VARCHAR(20) NOT NULL,
hourly_rate DECIMAL(5,2) NOT NULL
);

INSERT INTO staff(staff_id,first_name,last_name,position,hourly_rate)
VALUES
('st001','Mindy','Sloan','Chef',17.25),
('st002','Luqman','Cantu','Head_Chef',21.5),
('st003','Seren','Lindey','Chef',17.25),
('st004','Arran','Hodgson','Head_Chef',21.5),
('st005','Talha','Portillo','Chef',17.25),
('st006','Sana','Black','Head_Chef',21.5),
('st007','Zachery','Robins','Chef',17.25),
('st008','Faraz','Peck','Head_Chef',21.5),
('st009','Lilly-Rose','Vaughn','Delivery_rider',14.5),
('st010','Desiree','Gardner','Delivery_rider',14.5),
('st011','Ivan','English','Delivery_rider',14.5),
('st012','Johnathon','Bradford','Delivery_rider',14.5),
('st013','Matilda','Maccarty','Delivery_rider',14.5),
('st014','Areeb','Vasquez','Delivery_rider',14.5),
('st015','Amiyah','Lambert','Delivery_rider',14.5),
('st016','Amrit','Greaves','Delivery_rider',14.5);