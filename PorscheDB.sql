drop database PorscheDB;
CREATE database PorscheDB;

use PorscheDB;

CREATE TABLE users (
  id INT IDENTITY(1,1) PRIMARY KEY,
  fullname NVARCHAR(250) NOT NULL,
  email NVARCHAR(250) NOT NULL UNIQUE,
  password NVARCHAR(250) NOT NULL,
  roleid INT NOT NULL,
  phone NVARCHAR(20)
);

CREATE TABLE products (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(450) NOT NULL,
  description NVARCHAR(450) NOT NULL, 
  category NVARCHAR(450) NOT NULL,
  price FLOAT NOT NULL,
  stock INT NOT NULL,
  image NVARCHAR(450) NOT NULL
);

CREATE TABLE orders (
  oid INT IDENTITY(1,1) PRIMARY KEY,
  totalprice FLOAT NOT NULL,
  address VARCHAR(450) NOT NULL,
  note VARCHAR(450) NOT NULL,
  date VARCHAR(450) NOT NULL,
  uid INT NOT NULL,
  CONSTRAINT fk_user FOREIGN KEY (uid) REFERENCES users(id)
);

CREATE TABLE orders_details (
  oid INT NOT NULL,
  pid INT NOT NULL,
  price FLOAT NOT NULL, 
  quantity INT NOT NULL,
  CONSTRAINT fk_order FOREIGN KEY (oid) REFERENCES orders(oid),
  CONSTRAINT fk_product FOREIGN KEY (pid) REFERENCES products(id)  
);

CREATE TABLE CarSpec ( 
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT UNIQUE NOT NULL,
	horsepower NVARCHAR(100) NOT NULL, --công suất động cơ
    engine_capacity NVARCHAR(100) NOT NULL, -- Dung tích động cơ
    max_torque NVARCHAR(100) NOT NULL, -- Mô-men xoắn cực đại
    acceleration NVARCHAR(100) NOT NULL, -- Khả năng tăng tốc (0-100 km/h)
    max_speed NVARCHAR(100) NOT NULL, -- Tốc độ tối đa
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

INSERT INTO products (name, description, category, price, stock, image)
VALUES
('Porsche 718 Cayman', N'Mẫu coupe thể thao sang trọng từ Porsche', '718', 6500000000, 10, 'image1.jpg'),
('Porsche 718 Boxster', N'Mẫu xe mui trần hiệu suất cao từ Porsche', '718', 7000000000, 10, 'image2.jpg'),
('Porsche 718 Style Edition', N'Phiên bản đặc biệt của Porsche 718', '718', 7200000000, 10, 'image3.jpg'),
('Porsche 911 Carrera', N'Biểu tượng xe thể thao đến từ Porsche', '911', 10500000000, 10, 'image4.jpg'),
('Porsche 911 Carrera S', N'Phiên bản nâng cấp hiệu suất cao của 911 Carrera', '911', 12000000000, 10, 'image5.jpg'),
('Porsche 911 Targa', N'Thiết kế Targa cổ điển với hiệu suất hiện đại', '911', 13000000000, 10, 'image6.jpg'),
('Porsche 911 Turbo', N'Dòng xe thể thao tăng áp mạnh mẽ', '911', 18000000000, 10, 'image7.jpg'),
('Porsche 911 Sport Classic', N'Phiên bản giới hạn lấy cảm hứng từ quá khứ', '911', 25000000000, 5, 'image8.jpg'),
('Porsche 911 Dakar', N'Phiên bản 911 có khả năng off-road', '911', 22000000000, 5, 'image9.jpg'),
('Porsche Taycan', N'Mẫu xe điện thể thao cao cấp', 'Taycan', 8900000000, 15, 'image10.jpg'),
('Porsche Taycan Cross Turismo', N'Phiên bản Taycan với thiết kế wagon tiện dụng', 'Taycan', 9500000000, 15, 'image11.jpg'),
('Porsche Panamera', N'Mẫu sedan thể thao cao cấp với hiệu suất vượt trội', 'Panamera', 9000000000, 15, 'image12.jpg'),
('Porsche Macan', N'Mẫu SUV cỡ nhỏ sang trọng mang DNA Porsche', 'Macan', 6000000000, 20, 'image13.jpg'),
('Porsche Macan Electric', N'Phiên bản chạy điện hoàn toàn của Macan', 'Macan', 8000000000, 20, 'image14.jpg'),
('Porsche Cayenne', N'Mẫu SUV hạng sang với hiệu suất mạnh mẽ', 'Cayenne', 8500000000, 20, 'image15.jpg');
INSERT INTO users (fullname, email, password, roleid, phone)
VALUES
('User 1', 'user1@gmail.com', '123', 0, '0123456789'),
('Admin 1', 'admin1@gmail.com', '123', 1, '0123456789');
INSERT INTO CarSpec (product_id, horsepower, engine_capacity, max_torque, acceleration, max_speed)
VALUES
(1, '300 HP', '2.0L Turbo', '380 Nm', '5.1s', '275 km/h'),
(2, '350 HP', '2.5L Turbo', '420 Nm', '4.7s', '285 km/h'),
(3, '300 HP', '2.0L Turbo', '380 Nm', '5.1s', '275 km/h'),
(4, '400 HP', '3.0L Turbo', '450 Nm', '4.2s', '293 km/h'),
(5, '450 HP', '3.0L Turbo', '530 Nm', '3.7s', '308 km/h'),
(6, '440 HP', '3.0L Turbo', '530 Nm', '3.9s', '306 km/h'),
(7, '640 HP', '3.8L Turbo', '750 Nm', '2.7s', '330 km/h'),
(8, '580 HP', '3.7L Turbo', '600 Nm', '3.5s', '320 km/h'),
(9, '520 HP', '3.0L Turbo', '570 Nm', '3.4s', '290 km/h'),
(10, '750 HP', 'Electric', '850 Nm', '2.8s', '260 km/h'),
(11, '680 HP', 'Electric', '850 Nm', '3.2s', '250 km/h'),
(12, '650 HP', '4.0L V8', '770 Nm', '3.6s', '315 km/h'),
(13, '320 HP', '2.0L Turbo', '400 Nm', '5.0s', '270 km/h'),
(14, '530 HP', 'Electric', '700 Nm', '4.8s', '220 km/h'),
(15, '720 HP', '4.0L Turbo', '900 Nm', '3.8s', '305 km/h');


