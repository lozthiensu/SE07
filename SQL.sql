

create database QLPT1


use QLPT1
go


--Tao bang tanh và them
create table Province
(
	provinceId smallint identity(1,1),
	name nvarchar(50),
	constraint pk_Province primary key (provinceId)
)
--DBCC CHECKIDENT (Province, RESEED, 0);  --Reset id ve 1
INSERT INTO Province(name) VALUES(N'Quảng Ngãi');
INSERT INTO Province(name) VALUES(N'Ðà Nẵng');


--Tao bang huyen
create table District
(
	districtId smallint identity(1,1),
	provinceId smallint,
	name nvarchar(50),
	constraint pk_District primary key (districtId),
	CONSTRAINT fk_Province_District FOREIGN KEY (provinceId)
	REFERENCES Province(provinceId)
)
--DBCC CHECKIDENT (District, RESEED, 0); 
INSERT INTO District(provinceId, name) VALUES(1, N'Sơn Tịnh');
INSERT INTO District(provinceId, name) VALUES(1, N'Trà Bồng');
INSERT INTO District(provinceId, name) VALUES(2, N'Ngũ Hành Sơn');


--Tao bang xa
create table Village
(
	villageId int identity(1,1),
	districtId smallint,
	name nvarchar(50),
	constraint pk_Village primary key (villageId),
	CONSTRAINT fk_District_Village FOREIGN KEY (districtId)
	REFERENCES District(districtId)
)
--DBCC CHECKIDENT (Village, RESEED, 0); 
INSERT INTO Village(districtId, name) VALUES(1, N'Tịnh Bình');
INSERT INTO Village(districtId, name) VALUES(1, N'Tịnh Sơn');
INSERT INTO Village(districtId, name) VALUES(1, N'Tịnh Sơn');
INSERT INTO Village(districtId, name) VALUES(1, N'Tịnh Thiện');
INSERT INTO Village(districtId, name) VALUES(2, N'Trà Bình');
INSERT INTO Village(districtId, name) VALUES(2, N'Trà Xuân');
INSERT INTO Village(districtId, name) VALUES(2, N'Trà Ðú');
INSERT INTO Village(districtId, name) VALUES(3, N'Khuê Mỹ');
INSERT INTO Village(districtId, name) VALUES(3, N'Mỹ An');
INSERT INTO Village(districtId, name) VALUES(3, N'Hoà Hải');
INSERT INTO Village(districtId, name) VALUES(3, N'Hoà Quý');
INSERT INTO Village(districtId, name) VALUES(4, N'An Hải Bắc');
INSERT INTO Village(districtId, name) VALUES(4, N'An Hải Đông');
INSERT INTO Village(districtId, name) VALUES(4, N'An Hải Tây');
INSERT INTO Village(districtId, name) VALUES(4, N'Mân Thái');
INSERT INTO Village(districtId, name) VALUES(4, N'Nại Hiên Đông');


--Tao bang loai tin
Create table Category
(
	categoryId smallint identity(1,1) ,
	name nvarchar(50),
	constraint pk_Category primary key (categoryId)
)
--DBCC CHECKIDENT (Category, RESEED, 4); 
INSERT INTO Category(name) VALUES(N'Cho thuê phòng trọ');
INSERT INTO Category(name) VALUES(N'Nhà cho thuê');
INSERT INTO Category(name) VALUES(N'Cho thuê căn hộ');
INSERT INTO Category(name) VALUES(N'Cho thuê mặt bằng');
INSERT INTO Category(name) VALUES(N'Tìm người ở ghép');


--Tao bang account
Create table Account
(
	accountId int identity(1,1),
	level smallint,
	categoryId smallint,
	name nvarchar(50),
	email nvarchar(40),
	password nvarchar(32),
	phone nvarchar(11),
	status tinyint,
	constraint pk_Account primary key (accountId),
	CONSTRAINT fk_Category_Account FOREIGN KEY (categoryId)
	REFERENCES Category(categoryId),
	CONSTRAINT uc_Account UNIQUE (email) --Tao unique email(rang buoc email khong duoc trung du lieu)
)
--DBCC CHECKIDENT (Account, RESEED, 0); 
--Insert admin account
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('1', NULL, 'Admin 1', 'admin1@gmail.com', '123', 'phone 1', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('1', NULL, 'Admin 2', 'admin2@gmail.com', '123', 'phone 2', 1);
--Insert moderator account
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('2', '1', 'Mod 1', 'mod1@gmail.com', '123', 'phone 3', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('2', '2', 'Mod 2', 'mod2@gmail.com', '123', 'phone 4', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('2', '3', 'Mod 3', 'mod3@gmail.com', '123', 'phone 5', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('2', '4', 'Mod 4', 'mod4@gmail.com', '123', 'phone 5', 1);
--Insert user account
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 1', 'user1@gmail.com', '123', 'phone 7', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user2@gmail.com', '123', 'phone 8', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 3', 'user3@gmail.com', '123', 'phone 9', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 4', 'user4@gmail.com', '123', 'phone 10', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 5', 'user5@gmail.com', '123', 'phone 11', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 6', 'user6@gmail.com', '123', 'phone 12', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 7', 'user7@gmail.com', '123', 'phone 13', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 8', 'user8@gmail.com', '123', 'phone 14', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 9', 'user9@gmail.com', '123', 'phone 15', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 10', 'user10@gmail.com', '123', 'phone 16', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 11', 'user11@gmail.com', '123', 'phone 17', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 12', 'user12@gmail.com', '123', 'phone 18', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 13', 'user13@gmail.com', '123', 'phone 19', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 14', 'user14@gmail.com', '123', 'phone 20', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 15', 'user15@gmail.com', '123', 'phone 21', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 16', 'user16@gmail.com', '123', 'phone 22', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 17', 'user17@gmail.com', '123', 'phone 23', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 18', 'user18@gmail.com', '123', 'phone 24', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 19', 'user19@gmail.com', '123', 'phone 25', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 20', 'user20@gmail.com', '123', 'phone 26', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 21', 'user21@gmail.com', '123', 'phone 27', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 22', 'user22@gmail.com', '123', 'phone 28', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 23', 'user23@gmail.com', '123', 'phone 29', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 24', 'user24@gmail.com', '123', 'phone 30', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 25', 'user25@gmail.com', '123', 'phone 31', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 26', 'user26@gmail.com', '123', 'phone 32', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 27', 'user27@gmail.com', '123', 'phone 33', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 28', 'user28@gmail.com', '123', 'phone 34', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 29', 'user29@gmail.com', '123', 'phone 35', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 30', 'user30@gmail.com', '123', 'phone 36', 1);




create table Thread
(
	threadId int IDENTITY(1,1) ,
	categoryId smallint,
	accountId int,
	name nvarchar(500),
	address nvarchar(500),
	latitude decimal(10,8),
	longitude decimal(11,8),
	content nvarchar(4000), -- mo ta
	price money, --gia phong
	electricFee money, -- phi dien
	waterFee money, -- phi nuoc
	otherFee money, -- phu phi
	area int, --dien tich
	wifi bit,
	waterHeater bit, -- may nuoc nong
	conditioner bit, -- dieu hoa
	fridge bit, --tu lanh
	attic bit, -- gac xep
	camera bit,
	waterSource tinyint, -- nguon nuoc
	direction nvarchar(100), -- huong phong
	numOfToilets smallint, -- so toilet
	numOfPeople smallint, -- so nguoi cho phep
	object tinyint, -- doi tuong
	villageId int, -- ma xa
	created date, 
	viewed int,
	status tinyint,
	kindOf bit,
	imageThumb nvarchar(200),
	constraint pk_Thread primary key (threadId),
	CONSTRAINT fk_Category_Thread FOREIGN KEY (CategoryId)
	REFERENCES Category(CategoryId),
	CONSTRAINT fk_Account_Thread FOREIGN KEY (accountId)
	REFERENCES Account(accountId), 
	CONSTRAINT fk_Village_Thread FOREIGN KEY (villageId)
	REFERENCES Village(villageId)
)
DBCC CHECKIDENT (Thread, RESEED, 0);
DBCC CHECKIDENT (Notification, RESEED, 0); 

create table Image
(
	imageId int IDENTITY(1,1) ,
	threadId int,
	src nvarchar(200),
	content nvarchar(200),
	image360 bit,
	constraint pk_Image primary key (imageId),
	CONSTRAINT fk_Thread_Image FOREIGN KEY (threadId)
	REFERENCES Thread(threadId)
)
  

create table Rate
(
	rateId int IDENTITY(1,1),
	threadId int,
	accountId int,
	content nvarchar(200),
	score tinyint,
	constraint pk_Rate primary key (rateId),
	CONSTRAINT fk_Thread_Rate FOREIGN KEY (threadId)
	REFERENCES Thread(threadId),
	CONSTRAINT fk_Account_Rate FOREIGN KEY (accountId)
	REFERENCES Account(accountId)
)
DBCC CHECKIDENT (Rate, RESEED, 0); 








