create database if not exists sk_dev default character set utf8 collate utf8_general_ci;

use sk_dev;

drop function if exists getTaskZoneCode;

drop table if exists User;
create table User (
    id varchar(40) not null,
    name varchar(40) not null,
    zoneCode char(2) not null,
    primary key(id)
);

drop table if exists OrderForm;
create table OrderForm (
    id int unsigned auto_increment,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_userId_gmtCreated on OrderForm(userId, gmtCreated);

drop table if exists OrderForm_Old;
create table OrderForm_Old (
    id int unsigned auto_increment,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_Old_userId_gmtCreated on OrderForm_Old(userId, gmtCreated, id);

drop table if exists OrderDetail;
create table OrderDetail (
    id int unsigned auto_increment,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_orderFormId on OrderDetail(orderFormId);

drop table if exists OrderDetail_Old;
create table OrderDetail_Old (
    id int unsigned auto_increment,
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