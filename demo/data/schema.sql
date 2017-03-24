drop database if exists sk_dev;
create database sk_dev default character set utf8 collate utf8_general_ci;

use sk_dev;

drop table if exists User;
create table User (
    id varchar(40) not null,
    name varchar(40) not null,
    zoneCode char(2) not null,
    primary key(id)
);

drop table if exists OrderForm_Current;
create table OrderForm_Current (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_Current_userId_gmtCreated on OrderForm_Current(userId, gmtCreated);

drop table if exists OrderForm_Old;
create table OrderForm_Old (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_Old_userId_gmtCreated on OrderForm_Old(userId, gmtCreated, id);

drop table if exists OrderDetail_Current;
create table OrderDetail_Current (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_Current_orderFormId on OrderDetail_Current(orderFormId);

drop table if exists OrderDetail_Old;
create table OrderDetail_Old (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_Old_orderFormId on OrderDetail_Old(orderFormId, id);

drop table if exists Task;
create table Task (
    id varchar(40) not null,
    type varchar(20) not null,
    triggerTime dateTime not null,
    dataMap text,
    createTime timestamp not null,
    primary key(id)
);

create index IX_Task_triggerTime on Task(triggerTime);