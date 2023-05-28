drop table bill;
drop table reservation;
drop table room; 
drop table employee;
drop table customer;



create table employee(
	emp_id number(10) primary key not null , 
	emp_name varchar(20),  
	gender varchar(10),
	emp_email varchar(20),
	designation varchar(30),
	emp_address varchar(25),
	phone_no varchar(15)
);
create table customer (
	cust_id number(10) primary key not null , 
	cust_name varchar(20), 
	cust_email varchar(30),
	NID_no varchar(20),
	cust_address varchar(30), 
	phone_no varchar(15)
);
create table room (
	room_no number(5) primary key not null , 
	price number(5), 
	room_status varchar(15),
    available varchar(12)
);
create table reservation (
	reservation_id varchar(10) primary key not null,
	cust_id number(10) not null , 
	room_no number(5) not null , 
    starting_date varchar(12),
	ending_date varchar(12), 
	foreign key (cust_id) references customer (cust_id) on DELETE cascade,
	foreign key (room_no) references room (room_no) on DELETE cascade
);
create table bill (
	bill_id varchar(20) primary key not null , 
	reservation_id varchar(10) not null,
	cust_id number(10) not null ,
	billing_date varchar(12),
	amount number(5),
	method varchar(12),
	foreign key (reservation_id) references reservation  (reservation_id) on DELETE cascade,
	foreign key (cust_id) references customer (cust_id) on DELETE cascade
);


--DESCRIPTION
desc bill;
desc reservation;
desc room; 
desc employee;
desc customer;

--ADD Column
alter table reservation add total_days_stayed number(1);
alter table reservation add total_amount number(5);
desc reservation;
select * from reservation;
insert into reservation (reservation_id, cust_id, room_no, starting_date, ending_date, total_days_stayed  ) values ('R11', 09, 2006 , '2022-06-04' , '2022-06-08', 5);
insert into reservation (reservation_id, cust_id, room_no, starting_date, ending_date, total_days_stayed ) values ('R12', 10, 2009 , '2022-06-10' , '2022-06-12',3);
select * from reservation;

--MODIFY Column
--insert into reservation (reservation_id, cust_id, room_no, starting_date, ending_date, total_days_stayed  ) values ('R13', 09, 2006 , '2022-06-04' , '2022-06-5', 1);
alter table reservation MODIFY total_days_stayed number(3);
desc reservation;
select * from reservation;
insert into reservation (reservation_id, cust_id, room_no, starting_date, ending_date, total_days_stayed  ) values ('R14', 09, 2006 , '2022-06-04' , '2022-06-15', 13);
select * from reservation;

--UPDATE Data
select * from room;
update room set available = 'booked' where room_no = 2010;
select * from room;
