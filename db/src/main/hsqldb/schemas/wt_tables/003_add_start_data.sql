--start data

--roles
insert into wtp.role (sys_name, name, is_deleted, display_order, search_synonim)
values ('admin', 'Admin', 'N', 1, 'admin' );
insert into wtp.role (sys_name, name, is_deleted, display_order, search_synonim)
values ('all_viewer', 'Viewer', 'N', 1, null );

insert into wtp.system_parameter (sys_name, name, value_str)
values ('last_db_update', 'Последняя версия апдейта', '0000');

commit
