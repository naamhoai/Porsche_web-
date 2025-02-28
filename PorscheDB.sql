-- Tạo database
USE master
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name='PorscheDB')
BEGIN
    ALTER DATABASE PorscheDB SET OFFLINE WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE PorscheDB SET ONLINE;
    DROP DATABASE PorscheDB;
END
GO

CREATE DATABASE PorscheDB
GO

USE PorscheDB
GO

-- Tạo bảng lưu thông tin xe
CREATE TABLE Cars (
    id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    capacity VARCHAR(50),
    max_torque VARCHAR(50),
    acceleration VARCHAR(50),
    max_speed VARCHAR(50),
    price VARCHAR(50)
);
GO

CREATE TABLE Dealer (
    id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    location VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Car_Dealer (
    car_id INT NOT NULL,
    dealer_id INT NOT NULL,
    CONSTRAINT PK_Car_Dealer PRIMARY KEY CLUSTERED (car_id ASC, dealer_id ASC)
);
GO

-- Thêm một số xe vào database
INSERT INTO Cars (id, name, capacity, max_torque, acceleration, max_speed, price) VALUES
(1, 'Porsche 718 Boxster', '300hp (220 kW)', '380 Nm', '4.9s (4.7s với Sport Chrono Package)', '275 km/h', '4.380.000.000 VNĐ'),
(2, 'Porsche 911 Carrera', '379hp (283 kW)', '450 Nm', '4.2s', '293 km/h', '8.240.000.000 VNĐ'),
(3, 'Porsche Taycan', '408hp (300 kW)', '345 Nm', '5.4s', '230 km/h', '4.040.000.000 VNĐ'),
(4, 'Porsche Macan', '265hp (195 kW)', '400 Nm', '6.4s', '232 km/h', '3.280.000.000 VNĐ'),
(5, 'Porsche Cayenne', '353hp (260 kW)', '500 Nm', '5.9s', '248 km/h', '5.430.000.000 VNĐ'),
(6, 'Porsche Panamera', '330hp (243 kW)', '450 Nm', '5.6s', '270 km/h', '5.550.000.000 VNĐ');
GO

-- Thêm đại lý phân phối
INSERT INTO Dealer (id, name, location) VALUES
(1, 'Porsche Sai Gon', 'Tan Thuan Dong, District 7, Ho Chi Minh City'),
(2, 'Porsche Ha Noi', 'Gia Thuy Ward, Long Bien District, Ha Noi');
GO

-- Gán xe cho đại lý
INSERT INTO Car_Dealer (car_id, dealer_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 2);
GO

-- Thêm khóa ngoại
ALTER TABLE Car_Dealer WITH CHECK ADD CONSTRAINT FK_Car_Dealer_Cars FOREIGN KEY (car_id)
REFERENCES Cars (id);
GO
ALTER TABLE Car_Dealer CHECK CONSTRAINT FK_Car_Dealer_Cars;
GO
ALTER TABLE Car_Dealer WITH CHECK ADD CONSTRAINT FK_Car_Dealer_Dealer FOREIGN KEY (dealer_id)
REFERENCES Dealer (id);
GO
ALTER TABLE Car_Dealer CHECK CONSTRAINT FK_Car_Dealer_Dealer;
GO

-- Truy vấn để xem danh sách xe
SELECT * FROM Cars;
GO

-- Thêm xe mới
INSERT INTO Cars (id, name, capacity, max_torque, acceleration, max_speed, price)
VALUES (7, 'Tên xe', 'Công suất', 'Mô-men xoắn', 'Thời gian tăng tốc', 'Tốc độ tối đa', 'Giá xe');
GO

-- Xóa xe theo tên, đảm bảo xóa trong Car_Dealer trước
DELETE FROM Car_Dealer WHERE car_id = (SELECT id FROM Cars WHERE name = 'Porsche 718 Boxster');
DELETE FROM Cars WHERE name = 'Porsche 718 Boxster';
GO
