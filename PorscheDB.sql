CREATE database PorscheDB;
drop database PorscheDB;

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

CREATE TABLE CarSpecifications (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    power NVARCHAR(50),
    torque NVARCHAR(50),
    acceleration NVARCHAR(50),
    max_speed NVARCHAR(50),
    fuel_consumption NVARCHAR(50),
    co2_emission NVARCHAR(50),
    price FLOAT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
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
