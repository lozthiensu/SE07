

create database QLPT1


use QLPT1
go


--Tạo bảng tỉnh và thêm dữ liệu mẫu
create table Province
(
	provinceId smallint identity(1,1),
	name nvarchar(50),
	constraint pk_Province primary key (provinceId)
)
--DBCC CHECKIDENT (Province, RESEED, 0);  --Đưa chỉ số provinceId về 1
INSERT INTO Province(name) VALUES(N'Quảng Ngãi');
INSERT INTO Province(name) VALUES(N'Đà Nẵng');


--Tạo bảng huyện và thêm dữ liệu mẫu
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


--Tạo bảng xã và thêm dữ liệu mẫu
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
INSERT INTO Village(districtId, name) VALUES(1, N'Tịnh Trà');
INSERT INTO Village(districtId, name) VALUES(2, N'Trà Bình');
INSERT INTO Village(districtId, name) VALUES(3, N'Hoà Quý');
INSERT INTO Village(districtId, name) VALUES(3, N'Hoà Hải');


--Tạo bảng loại tin và thêm dữ liệu mẫu
Create table Category
(
	categoryId smallint identity(1,1) ,
	name nvarchar(50),
	constraint pk_Category primary key (categoryId)
)
--DBCC CHECKIDENT (Category, RESEED, 0); 
INSERT INTO Category(name) VALUES(N'Nhà trọ');
INSERT INTO Category(name) VALUES(N'Căn hộ');
INSERT INTO Category(name) VALUES(N'Mặt bằng');
INSERT INTO Category(name) VALUES(N'Tìm người ở ghép');


--Tạo bảng account và thêm dữ liệu mẫu
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
	CONSTRAINT uc_Account UNIQUE (email) --Tạo unique email(ràng buộc không được trùng dữ liệu)
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
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User', 'user1@gmail.com', '123', 'phone 7', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user2@gmail.com', '123', 'phone 8', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user3@gmail.com', '123', 'phone 9', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user4@gmail.com', '123', 'phone 10', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user5@gmail.com', '123', 'phone 11', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user6@gmail.com', '123', 'phone 12', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user7@gmail.com', '123', 'phone 13', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user8@gmail.com', '123', 'phone 14', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user9@gmail.com', '123', 'phone 15', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user10@gmail.com', '123', 'phone 16', 1);
INSERT INTO Account(level, categoryId, name, email, password, phone, status) VALUES('3', NULL, 'User 2', 'user11@gmail.com', '123', 'phone 17', 1);




create table Thread
(
	threadId int IDENTITY(1,1) ,
	categoryId smallint,
	accountId int,
	name nvarchar(250),
	address nvarchar(50),
	latitude decimal(10,8),
	longitude decimal(11,8),
	content nvarchar(4000), -- mô tả
	price money, --giá phòng
	electricFee money, -- phí điện
	waterFee money, -- phí nước
	otherFee money, -- phụ phí
	area int, --diện tích
	wifi bit,
	waterHeater bit, -- máy nước nóng
	conditioner bit, -- điều hòa
	fridge bit, --tủ lạnh
	attic bit, -- gác xếp
	camera bit,
	waterSource nvarchar(50), -- nguồn nước
	direction nvarchar(100),
	numOfToilets smallint, -- số toilet
	numOfPeople smallint, -- số người cho phép
	object tinyint, -- đối tượng (nam, nữ, ..)
	villageId int, -- mã xã
	created date, 
	viewed int,
	status tinyint,
	imageThumb nvarchar(200),
	constraint pk_Thread primary key (threadId),
	CONSTRAINT fk_Category_Thread FOREIGN KEY (CategoryId)
	REFERENCES Category(CategoryId),
	CONSTRAINT fk_Account_Thread FOREIGN KEY (accountId)
	REFERENCES Account(accountId), 
	CONSTRAINT fk_Village_Thread FOREIGN KEY (villageId)
	REFERENCES Village(villageId)
)

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb) VALUES(1, 7, N'Cho thuê căn hộ siêu cấp tuyệt vời 100 m2', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/1.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(2, 8, N'Cho thuê ktx Việt Hàn 100000 m2', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/2.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(3, 9, N'Cho thuê văn phòng đập đá', N'Trụ sở tại núi Ngũ Hành Sơn', 15.9712827, 108.2631494, N'Liên hệ Mr.Stone', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước giếng', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/3.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(4, 10, N'Cho thuê nhà để xe', N'Trụ sở tại cầu Rồng', 16.0776665, 108.210492, N'Liên hệ Mr.Lộc 05535135', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/4.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(1, 1, N'Cho thuê phòng trọ 50 tầng', N'Cầu thuận phước', 15.9782827, 108.2631494, N'Liên hệ Mr.Hoàng', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/5.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(2, 2, N'Cho thuê phòng trọ ở ghép', N'Bánh xèo bà Dưỡng', 16.0776665, 108.210492, N'248 Nguyễn Hoàng', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/6.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(3, 3, N'1 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/7.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(4, 4, N'2 Cho thuê ktx Việt Hàn 100000 m2', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/8.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(1, 5, N'3 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2 lần hai', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/9.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(2, 6, N'4 Cho thuê ktx Việt Hàn 100000 m2 lần hai', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/10.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(3, 7, N'5 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2 lần ba', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/11.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(4, 8, N'6 Cho thuê ktx Việt Hàn 100000 m2 lần ba', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/12.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(1, 9, N'7 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/13.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(2, 10, N'8 Cho thuê ktx Việt Hàn 100000 m2', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/14.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(3, 1, N'9 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2 lần hai', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/15.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(4, 2, N'10 Cho thuê ktx Việt Hàn 100000 m2 lần hai', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/16.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(1, 3, N'11 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2 lần ba', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/17.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(2, 4, N'12 Cho thuê ktx Việt Hàn 100000 m2 lần ba', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/18.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(3, 5, N'13 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/19.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(4, 6, N'14 Cho thuê ktx Việt Hàn 100000 m2', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/20.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(1, 7, N'15 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2 lần hai', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/21.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(2, 8, N'16 Cho thuê ktx Việt Hàn 100000 m2 lần hai', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/22.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(3, 9, N'17 Cho thuê căn hộ siêu cấp tuyệt vời 10000 m2 lần ba', N'Trụ sở FPT Complex tại Đà Nẵng', 15.9782827, 108.2631494, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Bão', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Tây Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/23.jpg');

INSERT INTO Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status, imageThumb ) VALUES(4, 10, N'18 Cho thuê ktx Việt Hàn 100000 m2 lần ba', N'Trụ sở Ngũ Hành Sơn Đà Nẵng', 16.0776665, 108.210492, N'Cho thuê căn hộ, chi tiết liên hệ Mr.Phương', 1000000000, 3000, 2000, 100000, 10000, 1, 1, 1, 1, 1, 1, N'Nước máy', N'Đông Nam', 100, 3000, 1, 6, '2017-03-08 20:16:00', 1, 0, 'image/24.jpg');

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
DBCC CHECKIDENT (Image, RESEED, 0); 

INSERT INTO Image(threadId, src, content, image360) VALUES(1, 'image/1.jpg',N'Hình ảnh về căn hộ cao cấp 1', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(2, 'image/2.jpg',N'Hình ảnh về căn hộ cao cấp 2', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(3, 'image/3.jpg',N'Hình ảnh về căn hộ cao cấp 3', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(4, 'image/4.jpg',N'Hình ảnh về căn hộ cao cấp 4', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(5, 'image/5.jpg',N'Hình ảnh về căn hộ cao cấp 5', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(6, 'image/6.jpg',N'Hình ảnh về căn hộ cao cấp 6', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(7, 'image/7.jpg',N'Hình ảnh về căn hộ cao cấp 7', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(8, 'image/8.jpg',N'Hình ảnh về căn hộ cao cấp 8', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(9, 'image/9.jpg',N'Hình ảnh về căn hộ cao cấp 9', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(10, 'image/10.jpg',N'Hình ảnh về căn hộ cao cấp 10', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(11, 'image/11.jpg',N'Hình ảnh về căn hộ cao cấp 11', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(12, 'image/12.jpg',N'Hình ảnh về căn hộ cao cấp 12', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(13, 'image/13.jpg',N'Hình ảnh về căn hộ cao cấp 13', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(14, 'image/14.jpg',N'Hình ảnh về căn hộ cao cấp 14', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(15, 'image/15.jpg',N'Hình ảnh về căn hộ cao cấp 15', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(16, 'image/16.jpg',N'Hình ảnh về căn hộ cao cấp 16', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(17, 'image/17.jpg',N'Hình ảnh về căn hộ cao cấp 17', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(18, 'image/18.jpg',N'Hình ảnh về căn hộ cao cấp 18', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(19, 'image/19.jpg',N'Hình ảnh về căn hộ cao cấp 19', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(20, 'image/20.jpg',N'Hình ảnh về căn hộ cao cấp 20', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(21, 'image/21.jpg',N'Hình ảnh về căn hộ cao cấp 21', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(22, 'image/22.jpg',N'Hình ảnh về căn hộ cao cấp 22', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(23, 'image/23.jpg',N'Hình ảnh về căn hộ cao cấp 23', 0);
INSERT INTO Image(threadId, src, content, image360) VALUES(24, 'image/24.jpg',N'Hình ảnh về căn hộ cao cấp 24', 0);

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
 
--TIMPHONG
--Người muốn thuê phòng trọ vào tìm kiếm, mà không có kết quả, sẽ đăng 1 tin lên trang web.
--Khi người cho thuê oho thuê phòng vào đăng phòng nếu điều kiện giống với điều kiện người cần thuê sẽ liên hệ với người đó.
--select * from Account order by accountId 
--select * from Account order by accountId offset 2 rows fetch next 2 row only;


 select * from Thread offset 0 rows fetch next 4 rows only

SELECT top 4 * FROM Thread  
ORDER BY viewed DESC
