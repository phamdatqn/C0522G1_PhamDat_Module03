create database if not exists case_study_database_2;
use case_study_database_2; 

create table `position`(
id int primary key auto_increment,
`name` varchar(45));

create table education_dgree(
id int primary key auto_increment,
`name` varchar(45));

create table division(
id int primary key auto_increment,
`name` varchar(45));

create table employee(
id int primary key auto_increment,
`name` varchar(45) NOT NULL,
date_of_birth date NOT NULL,
id_card varchar(45) NOT NULL,
salary double NOT NULL,
phone_number varchar(45) NOT NULL,
email varchar(45),
address varchar(45),
position_id int,foreign key(position_id) references `position`(id),
education_degree_id int,foreign key(education_degree_id) references education_dgree(id),
division_id int,foreign key(division_id) references division(id),
username varchar(255));

create table `user`(
username varchar(255) primary key,
`password` varchar(255));

create table `role`(
role_id int primary key auto_increment,
role_name varchar(255));

create table user_role(
role_id int,foreign key(role_id) references `role`(role_id),
username varchar(255),foreign key(username) references `user`(username));

create table customer_type(
id int primary key auto_increment,
`name` varchar(45));

create table customer(
id int primary key auto_increment,
customer_type_id int,foreign key(customer_type_id) references customer_type(id),
`name` varchar(45) not null,
date_of_birth date not null,
gender bit(1) not null,
id_card varchar(45) not null,
phone_number varchar(45) not null,
email varchar(45),
address varchar(45));

create table attach_facility(
id int primary key auto_increment,
`name` varchar(45) not null,
cost double not null,
unit varchar(10) not null,
`status` varchar(45));

create table facility_type(
id int primary key auto_increment,
`name` varchar(45));

create table rent_type(
id int primary key auto_increment,
`name` varchar(45));

create table facility(
id int primary key auto_increment,
`name` varchar(45) not null,
area int,
cost double not null,
max_people int,
rent_type_id int,foreign key(rent_type_id) references rent_type(id),
facility_type_id int, foreign key(facility_type_id) references facility_type(id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text);

create table contract(
id int primary key auto_increment,
start_date datetime not null,
end_date datetime not null,
deposit double not null,
employee_id int,foreign key(employee_id) references employee(id),
customer_id int,foreign key(customer_id) references customer(id),
facility_id int,foreign key(facility_id)  references facility(id));

create table contract_detail(
id int primary key auto_increment,
contract_id int,foreign key(contract_id) references contract(id),
attach_facility_id int,foreign key(attach_facility_id) references attach_facility(id),
quantily int not null);
