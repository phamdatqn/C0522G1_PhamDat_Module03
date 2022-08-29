CREATE DATABASE if not exists user_management;
USE user_management;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
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


delimiter //
create procedure insert_user(
in user_name varchar(50),
in user_email varchar(50),
in user_counry varchar(50))
begin
insert into users(name,email,country) value(user_name,user_email,user_country);
end //
delimiter ;
