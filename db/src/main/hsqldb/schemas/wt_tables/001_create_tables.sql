

create schema wtp authorization dba;


create table wtp.log_level
  (
    id             bigint generated by default as identity primary key ,
    sys_name       varchar (30) ,
    name           varchar (100) ,
    warning_level  numeric(1) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(10) ,
    search_synonim varchar (100)
  ) ;
comment on table wtp.log_level is 'Уровни логгирования' ;
comment on column wtp.log_level.warning_level is 'Уровень логов';
commit;


create table wtp.system_log
  (
    id              bigint generated by default as identity primary key ,
    log_date        timestamp with time zone ,
    record_details  varchar (1000) ,
    log_level_id    bigint not null
  ) ;
comment on table wtp.system_log is 'Журнал логов' ;
comment on column wtp.system_log.log_level_id is 'id уровня логгирования' ;
commit;

create table wtp.system_parameter
  (
    id        bigint generated by default as identity primary key ,
    sys_name  varchar (30) ,
    name      varchar (100) ,
    value_str varchar (200)
  ) ;
comment on table wtp.system_parameter is 'Системные параметры' ;
comment on column wtp.system_parameter.name is 'Имя системного  параметра' ;
comment on column wtp.system_parameter.value_str is 'Значение системного параметра' ;
commit;


create table wtp.organization
  (
    id             bigint generated by default as identity primary key ,
    sys_name       varchar (30) ,
    short_name     varchar (100) ,
    name           varchar (200) ,
    full_name      varchar (500) ,
    address        varchar (200) ,
    phone          varchar (100) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(10) ,
    search_synonim varchar (100)
  ) ;
comment on table wtp.organization is 'Список организаций ';
comment on column wtp.organization.name is 'Наименование организации';
comment on column wtp.organization.full_name is 'Полное наименование организации' ;
comment on column wtp.organization.address is 'Адрес организации' ;
comment on column wtp.organization.phone is 'Телефон организации' ;
commit;


create table wtp.department
  (
    id                   bigint generated by default as identity primary key ,
    organization_id      bigint not null ,
    sys_name             varchar (30) ,
    name                 varchar (200) ,
    parent_department_id bigint ,
    is_deleted           char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order        numeric(100) ,
    search_synonim       varchar (100)
  ) ;
comment on table wtp.department is 'Подразделения организаций' ;
comment on column wtp.department.organization_id is 'id организации' ;
comment on column wtp.department.sys_name is 'Системное имя подразделения' ;
comment on column wtp.department.name is 'Название подразделения' ;
comment on column wtp.department.parent_department_id is 'Ссылка на головное подразделение' ;
commit;



create table wtp.users
  (
    id             bigint generated by default as identity primary key ,
    creation_date  timestamp with time zone ,
    info           varchar (4000)  ,
    username       varchar (100) ,
    password_hash  varchar (100) ,
    first_name     varchar (100) ,
    middle_name    varchar (100) ,
    second_name    varchar (100) ,
    email          varchar (100) ,
    contact_info   varchar (200) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  varchar (100) ,
    search_synonim varchar (100)
  ) ;
comment on table wtp.users is 'Справочник пользователей' ;
comment on column wtp.users.creation_date is 'дата создания пользователя' ;
comment on column wtp.users.info is 'Общая информация' ;
comment on column wtp.users.username is   'логин' ;
comment on column wtp.users.password_hash is 'пароль' ;
comment on column wtp.users.first_name is 'Имя' ;
comment on column wtp.users.middle_name is 'Отчество' ;
comment on column wtp.users.second_name is 'Фамилия' ;
comment on column wtp.users.contact_info is 'Контактная информация' ;
commit;


commit;
create table wtp.setting_type
  (
    id             bigint generated by default as identity primary key ,
    sys_name       varchar (30) ,
    name           varchar (100) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(10) ,
    search_synonim varchar (100)
  ) ;
commit;


commit;
create table wtp.user_setting
  (
    id              bigint generated by default as identity primary key ,
    setting_value   varchar (4000) ,
    setting_type_id bigint not null ,
    user_id         bigint not null
  ) ;
commit;




create table wtp.role
  (
    id             bigint generated by default as identity primary key ,
    sys_name       varchar (30) ,
    name           varchar (100) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(100) ,
    search_synonim varchar (100)
  ) ;
comment on table wtp.role is 'Справочник ролей пользователей' ;



create table wtp.access_control_item
  (
    id             bigint generated by default as identity primary key ,
    sys_name       varchar (30) ,
    name           varchar (100) ,
    is_deleted     char(1) default 'N' not null check(is_deleted = 'Y' or is_deleted = 'N') ,
    display_order  numeric(100) ,
    search_synonim varchar (100)
  ) ;
comment on table wtp.access_control_item
is
  'Справочник объектов прав' ;

create table wtp.access_for_role
  (
    id                     bigint generated by default as identity primary key ,
    access_control_right   char (1) ,
    role_id                bigint not null ,
    access_control_item_id bigint not null
  ) ;
comment on table wtp.access_for_role is 'Соответствие объектов прав ролям' ;
comment on column wtp.access_for_role.access_control_right is 'право на запись (W) или на чтение (R)' ;
comment on column wtp.access_for_role.role_id is 'id роли' ;
comment on column wtp.access_for_role.access_control_item_id is 'id объекта прав' ;
commit;


create table wtp.user_role_department
  (
    id            bigint generated by default as identity primary key ,
    user_id       bigint not null ,
    role_id       bigint not null ,
    department_id bigint ,
    start_date    timestamp with time zone ,
    end_date      timestamp with time zone
  ) ;
comment on table wtp.user_role_department is 'Назначение  роли и подразделения пользователю' ;
comment on column wtp.user_role_department.start_date is 'Дата начала назначения' ;
comment on column wtp.user_role_department.end_date is 'Дата окончания действия роли и назначения на подразделение' ;
commit;



