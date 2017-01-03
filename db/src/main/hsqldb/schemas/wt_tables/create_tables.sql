--HSQLDB

--drop schema if exists wt_tables cascade;

--create schema wt_tables;
--authorization wt;
--comment on schema wt_tables
--is 'wt_tables';
drop table if exists access_control_item cascade;

create table if not exists access_control_item
  (
    id             integer not null primary key ,
    sys_name       varchar (30) ,
    name           varchar (100) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(100) ,
    search_synonim varchar (100)
  ) ;
comment on table access_control_item
IS
  'Справочник объектов прав' ;

insert into access_control_item (
    id, sys_name, name, is_deleted, display_order, search_synonim
    ) values (
    1,'admin', 'admin', 'N', 1, 'admin'
    )
    ;
