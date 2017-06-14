drop database if exists sk_dev;
create database sk_dev default character set utf8 collate utf8_general_ci;

use sk_dev;

drop table if exists TUser;
create table TUser (
    id varchar(40) not null,
    name varchar(40) not null,
    zoneCode char(2) not null,
    primary key(id)
);

drop table if exists TOrderForm_Current;
create table TOrderForm_Current (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_Current_userId_gmtCreated on TOrderForm_Current(userId, gmtCreated);

drop table if exists TOrderForm_Old;
create table TOrderForm_Old (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_Old_userId_gmtCreated on TOrderForm_Old(userId, gmtCreated, id);

drop table if exists TOrderDetail_Current;
create table TOrderDetail_Current (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_Current_orderFormId on TOrderDetail_Current(orderFormId);

drop table if exists TOrderDetail_Old;
create table TOrderDetail_Old (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_Old_orderFormId on TOrderDetail_Old(orderFormId, id);

drop table if exists TTask;
create table TTask (
    id varchar(40) not null,
    type varchar(20) not null,
    triggerTime dateTime not null,
    dataMap text,
    createTime timestamp not null,
    primary key(id)
);

create index IX_Task_triggerTime on TTask(triggerTime);