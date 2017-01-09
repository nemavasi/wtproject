--start data

--log_level
insert into wtp.log_level (sys_name, name, warning_level, is_deleted, display_order, search_synonim)
values ('error', 'Ошибка', 2, 'N', null, null);

insert into wtp.log_level (sys_name, name, warning_level, is_deleted, display_order, search_synonim)
values ('warning', 'Предупреждение', 4, 'N', null, null);

insert into wtp.log_level (sys_name, name, warning_level, is_deleted, display_order, search_synonim)
values ('info', 'Информационное сообщение', 6, 'N', null, null);

insert into wtp.log_level (sys_name, name, warning_level, is_deleted, display_order, search_synonim)
values ('debug', 'Отладочное сообщение', 8, 'N', null, null);

--
insert into wtp.system_parameter (sys_name, name, value_str)
values ('copyright', 'Копирайт', '2016-2017 Shalygin Dmitry');

insert into wtp.system_parameter (sys_name, name, value_str)
values ('support_phone', 'Телефон поддержки', '+7(922)000-00-00');

insert into wtp.system_parameter (sys_name, name, value_str)
values ('support_email', 'Email поддержки', 'nemavasi@yandex.ru');


--roles
insert into wtp.role (sys_name, name, is_deleted, display_order, search_synonim)
values ('admin', 'Admin', 'N', 1, 'admin' );
insert into wtp.role (sys_name, name, is_deleted, display_order, search_synonim)
values ('all_viewer', 'Viewer', 'N', 1, null );

insert into wtp.system_parameter (sys_name, name, value_str)
values ('last_db_update', 'Последняя версия апдейта', '0000');

commit
