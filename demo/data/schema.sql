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
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_userId_gmtCreated on OrderForm(userId, gmtCreated);

drop table if exists OrderForm_A;
create table OrderForm_A (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_A_userId_gmtCreated on OrderForm_A(userId, gmtCreated);

drop table if exists OrderForm_B;
create table OrderForm_B (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_B_userId_gmtCreated on OrderForm_B(userId, gmtCreated);

drop table if exists OrderDetail;
create table OrderDetail (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_orderFormId on OrderDetail(orderFormId);

drop table if exists OrderDetail_A;
create table OrderDetail_A (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_A_orderFormId on OrderDetail_A(orderFormId);

drop table if exists OrderDetail_B;
create table OrderDetail_B (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    itemName varchar(100) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_B_orderFormId on OrderDetail_B(orderFormId);

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

drop table if exists IndexCommand;
create table IndexCommand (
    id varchar(40) not null,
    type varchar(20) not null,
    indexName varchar(20) not null,
    op smallint not null,
    dataMap text,
    priority smallint not null default 0,
    sn int unsigned auto_increment,
    createTime timestamp not null,
    primary key(sn)
);

create unique index IX_IndexCommand_id on IndexCommand(id);
create index IX_IndexCommand_createTime on IndexCommand(createTime, priority, sn);