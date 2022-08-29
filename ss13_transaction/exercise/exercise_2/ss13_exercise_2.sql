CREATE DATABASE if not exists user_management;
USE user_management;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

create table Permision(
id int(11) primary key,
name varchar(50)
);

create table User_Permision(
permision_id int(11),
user_id int(11)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER //
create procedure get_user_by_id(IN user_id int)
begin
select users.name, users.email, users.country
from users
where users.id = user_id;
end //
DELIMITER ;

DELIMITER //
create procedure get_allUsers()
begin
select *
from users;
end //
DELIMITER ;

call get_allUsers();

delimiter //
create procedure insert_user(
in user_name varchar(50),
in user_email varchar(50),
in user_counry varchar(50))
begin
insert into users(name,email,country) value(user_name,user_email,user_country);
end //
delimiter ;

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');