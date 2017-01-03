--POSTGRES

drop schema if exists wt_tables cascade;

create schema wt_project
authorization wt;
comment on schema wt_project
is 'wtproject';


create table  if not exists wt_tables.access_control_item
  (
    id             bigserial primary key ,
    sys_name       varchar (30) ,
    name           varchar (100) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(100) ,
    search_synonim varchar (100)
  ) ;
comment on table wt_tables.access_control_item
IS
  'Справочник объектов прав' ;