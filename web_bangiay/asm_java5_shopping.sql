use master
go

drop database sof3021_asm
go

CREATE DATABASE sof3021_asm
go

use sof3021_asm
go

CREATE TABLE account (
  id int primary key NOT NULL,
  fullname nvarchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  avatar varchar(255) NOT NULL,
  admin int NOT NULL,
  actived int NOT NULL,
  email varchar(255) NOT NULL
)

CREATE TABLE categories (
  id int primary key NOT NULL,
  name varchar(255) NOT NULL,
  descriptions nvarchar(255) NOT NULL
)

CREATE TABLE orders (
  id int primary key NOT NULL,
  account_id int references account(id) NOT NULL,
  shipping_address nvarchar(255) NOT NULL,
  order_date varchar(255) NOT NULL,
  order_status int NOT NULL
)

CREATE TABLE order_detail (
  id int primary key NOT NULL,
  order_id int references orders(id) NOT NULL,
  product_id int references product(id) NOT NULL,
  price float NOT NULL,
  quantity int NOT NULL
)

CREATE TABLE payment (
  id int primary key NOT NULL,
  name nvarchar(255) NOT NULL,
  descriptions nvarchar(255) NOT NULL,
  account_id int references account(id) NOT NULL
)

CREATE TABLE product (
  id int primary key NOT NULL,
  category_id int references categories(id) NOT NULL,
  name nvarchar(255) NOT NULL,
  price float NOT NULL,
  image varchar(255) NOT NULL,
  available int NOT NULL,
  size varchar(10) NOT NULL,
  brand varchar(255) NOT NULL,
  descriptions nvarchar(255) NOT NULL
)

CREATE TABLE sale_off (
  id int primary key NOT NULL,
  product_id int references product(id) NOT NULL,
  descriptions nvarchar(255) NOT NULL
)

INSERT INTO account (id, fullname, username, password, avatar, admin, actived, email) VALUES
(34,'adminNNT', 'admin_1', '123', 'admin.png', 1, 0, 'josdatnguyen0@gmail.com'),
(35,'datnt', 'datntps25196@fpt.edu.vn', '123', 'datnt.png', 1, 0, 'datntps25196@fpt.edu.vn'),
(36,'final2', 'final@gmail.com', '$2a$10$cT34cLfUroxU3vlt0ZcV..vYKyMlwDa4UZPyxSL3YCS8HRnbZn.8i', 'placeholder.png', 1, 0, 'final@gmail.com'),
(37,'filanlx2', 'finalx2', '$2a$10$OuiNg6PZ/xApZv2dZFwhDumJn02umUcZ0nFcoYdRexqxrCUAajQda', 'finalx2', 1, 0, 'finalx2@gmail.com'),
(38,'thanhyou00', 'security@gmail.com', '$2a$10$hf8naCY8LaWbhvNNN6eNbuLLgN9v7e8tF.w49f1wmWDaSdxfcFOXm', 'security.png', 0, 0, 'security@gmail.com'),
(39,N'Nguyễn Nam', 'truc06082000@gmail.com', '$2a$10$XOMRHWxtwSpqgpIKy2Vtceo.xZmaOgL/9OfyzWldmrFjYzjxSLZ7q', 'avt.png', 0, 0, 'truc06082000@gmail.com'),
(40,N'Nguyễn Tam', 'tam@gmail.com', '$2a$10$Z/fbsmPyeiiSajxovBVuW.dWniIkuBAXyddH5u2JAyzbJ8YlRp5eG', 'avt.png', 0, 0, 'tam@gmail.com');

INSERT INTO categories (id, name, descriptions) VALUES
(1, 'Nike', 'Hight quality'),
(2, 'Bitis', N'Giày thể thao chất lượng cao'),
(3, 'Postgresq', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(4, 'Adidas', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.');

INSERT INTO orders (id, account_id, shipping_address, order_date, order_status) VALUES
(26, 37, N'Phu Tho 20', '2023-06-09', 1),
(27, 37, N'Phu Tho 20', '2023-06-09', 1),
(28, 37, N'Phu Tho 10', '2023-06-10', 1),
(29, 37, N'HANOI', '2022-06-11', 1),
(30, 37, N'HANOI', '2022-06-11', 2),
(31, 37, N'Phu Tho 20', '2022-06-12', 1),
(32, 37, N'HANOI', '2022-06-12', 2),
(33, 37, N'HANOI', '2022-06-12', 2),
(34, 37, N'Security', '2022-06-16', 1),
(35, 37, N'Security', '2022-06-17', 1),
(36, 37, N'HANOI', '2022-06-17', 2),
(37, 37, N'Security', '2022-06-17', 1),
(38, 37, N'Đà Nẵng', '2022-06-17', 1),
(39, 37, N'Đà Nẵng', '2022-06-17', 1),
(40, 40, N'FPT Poytechnic', '2022-06-17', 1),
(41, 37, N'HANOI', '2022-06-17', 1),
(42, 37, N'HANOI', '2022-06-18', 2),
(43, 37, N'FPT Poytechnic', '2022-06-18', 1),
(44, 37, N'HANOI', '2022-06-18', 2),
(45, 37, N'HANOI', '2022-06-24', 2),
(46, 37, N'FPT Poytechnic', '2022-06-24', 1);

INSERT INTO order_detail (id, order_id, product_id, price, quantity) VALUES
(21, 26, 13, 6, 6),
(22, 27, 2, 300000, 8),
(23, 28, 5, 99, 3),
(24, 29, 7, 500000, 1),
(25, 31, 7, 500000, 4),
(26, 32, 6, 450000, 8),
(27, 33, 10, 500000, 6),
(28, 34, 3, 1000000, 2),
(29, 35, 12, 580000, 6),
(30, 36, 3, 1000000, 4),
(31, 37, 5, 99, 6),
(32, 38, 3, 1000000, 4),
(33, 39, 13, 6, 5),
(34, 40, 3, 1000000, 3),
(35, 41, 11, 550000, 1),
(36, 42, 3, 1000000, 2),
(37, 43, 5, 99, 8),
(38, 44, 1, 1000000, 1),
(39, 45, 10, 500000, 8),
(40, 46, 11, 580000, 5),
(41, 47, 11, 580000, 10);

INSERT INTO product (id, category_id, name, price, image, available, size, brand, descriptions) VALUES
(1, 1, N'Giày Thể Thao XSPORT Ni.ke Jordan Low REP', 1000000, 'https://giayxshop.vn/wp-content/uploads/2021/06/z2534504627240_d3adc7bb9b0862ec11832aadfeac58cb-scaled.jpg', 1, 'M', 'Nike', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(2, 4, N'Giày Thể Thao XSPORT Adi.das Alpha.bounce beyond Rep', 300000, 'https://giayxshop.vn/wp-content/uploads/2019/02/MG_4978.jpg', 1, 'S', 'Adidas', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(3, 4, N'Giày Thể Thao XSPORT Van.s Old Skool Vải trắng kẻ xanh', 1000000, 'https://giayxshop.vn/wp-content/uploads/2022/03/xoa-phong-186.jpg', 1, 'L', 'Vans', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(4, 3, N'Vans Old Skool Vải Đỏ', 99, 'https://giayxshop.vn/wp-content/uploads/2018/12/MG_2143.jpg', 1, 'L', 'Xsport', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(5, 1, N'Adidas Yeezy 350 V2 Supreme Đen Đỏ REP', 450000, 'https://giayxshop.vn/wp-content/uploads/2022/03/z3283722481121_c77048964b3e28672c945b33479d8900-scaled.jpg', 1, 'M', 'Converse', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(6, 1, N'Nike Air Force 1 Hồng Đỏ REP 1:1', 500000, 'https://giayxshop.vn/wp-content/uploads/2021/12/z3052461965660_7732653be70f474e620111b564103ae8-scaled.jpg', 0, 'L', 'BALENCIAGA', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(7, 1, N'Giày Thể Thao XSPORT New BaLance 574 Rep 1:1', 600000, 'https://giayxshop.vn/wp-content/uploads/2021/10/z2868209469779_2fffbd116de63bac14fc11dc82a11939-scaled.jpg', 0, 'M', 'Xsport', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(8, 3, N'Giày MLB LA DODGERS Trắng REP', 600000, 'https://giayxshop.vn/wp-content/uploads/2021/12/z3009996165908_bfa6477fa04b9cccb1351ff137a1ab42.jpg', 1, 'S', 'MLB LA DODGERS', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(9, 4, N'Giày Thể Thao XSPORT Ni.ke air shadow Rep 1:1', 500000, 'https://giayxshop.vn/wp-content/uploads/2021/02/z2344034623842_cd86893e88409c15989bfec0989fc717-scaled.jpg', 1, 'L', 'Xsport', N'Thiết kế đẹp mắt, gọn gàng, màu sắc đẹp, trang nhã.'),
(10, 3, N'Ni.ke Jor.dan 1 Low Đen Cam REP', 550000, 'https://giayxshop.vn/wp-content/uploads/2022/01/z3070433981648_02de2f3154c48f5315f49460ea774c1f-scaled.jpg', 1, 'S', 'Nike', N'Thiết kế đẹp mắt, gọn gàng, màu sắc đẹp, trang nhã.'),
(11, 4, N'Adidas EQ 21 Run Trắng Viền Đen REP 1:1', 700000, 'https://giayxshop.vn/wp-content/uploads/2022/05/z3448971946431_59d81075aa0ba6c568ff3d263a557f1c.jpg', 1, 'S', 'Adidas', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(12, 4, N'Giày XSPORT ADD Alphabounce Beyond REP', 6, 'https://giayxshop.vn/wp-content/uploads/2021/01/z2291635574804_53cb4f79d5300da1f852db4ba55d65d9-scaled.jpg', 1, 'S', 'Xsport', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.'),
(13, 1, N'Giày Thể Thao XSPORT MLB', 580000, 'https://giayxshop.vn/wp-content/uploads/2019/11/MG_8528.jpg', 1, 'M', 'Xsport', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.');

select * from account
go
select * from categories
go
select * from product
go
select * from orders
go
select * from order_detail
go
drop table order_detail