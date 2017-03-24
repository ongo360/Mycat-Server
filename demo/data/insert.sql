
/*!mycat:dataNode=dn1*/ drop function if exists getTaskZoneCode;
/*!mycat:dataNode=dn2*/ drop function if exists getTaskZoneCode;

/*!mycat:dataNode=dn1*/ create function getTaskZoneCode() returns char(2) deterministic return('00');
/*!mycat:dataNode=dn2*/ create function getTaskZoneCode() returns char(2) deterministic return('01');

insert into User
(id, name, zoneCode)
values
('User01', 'User01', '01'),
('User02', 'User02', '02'),
('User03', 'User03', '03'),
('User04', 'User04', '04');

insert into User
(id, name, zoneCode)
values
('User05', 'User05', '05'),
('User06', 'User06', '06'),
('User07', 'User07', '07'),
('User08', 'User08', '08'),
('User09', 'User09', '09');

insert into OrderForm
(id, userId, number, amount, gmtCreated)
values
('0001XXX02', 'User02', '2016XXX0001XXX02', 1.98, '2016-1-22');

insert into OrderForm
(id, userId, number, amount, gmtCreated)
values
('0002XXX09', 'User09', '2016XXX0002XXX09', 3.50, '2016-2-1');

insert into OrderForm
(id, userId, number, amount, gmtCreated)
values
('1001XXX02', 'User02', '2017XXX1001XXX02', 19.20, '2017-5-4');

insert into OrderForm
(id, userId, number, amount, gmtCreated)
values
('1002XXX09', 'User09', '2017XXX1002XXX09', 99.80, '2017-6-6');
