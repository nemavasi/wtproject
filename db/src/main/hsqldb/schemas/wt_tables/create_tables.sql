
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

