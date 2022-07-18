create database demo;

create table products(
id int auto_increment primary key,
productCode int unique not null,
productName varchar(50) not null,
productPrice double not null,
productAmount int not null,
productDescription varchar(50),
productStatus bit(1)
); 

select * from products;

insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values 
('1', 'sắt', '10000', '10', 'hàng tốt', '1'),
('2', 'đá', '20000', '20', 'hàng tốt', '0'),
('3', 'nước', '30000', '30', 'hàng tốt', '1'),
('4', 'vải', '40000', '40', 'hàng tốt', '0');

alter table products add index index_productCode(productCode);
alter table products add index index_Composite (productName, productPrice);
explain select * from products where productName = 'vải';

create view products_view as
select productCode, productName, productPrice, productStatus
from products;

select * from products_view;

delimiter //
create procedure findAll()
	begin
		select * from products;
	end //
delimiter ;

call findAll();
