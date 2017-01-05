

alter table wtp.system_log add foreign key (log_level_id)  references wtp.log_level(id) ;
alter table wtp.department add foreign key (parent_department_id) references wtp.department(id) ;
alter table wtp.department add foreign key (organization_id) references wtp.organization (id) ;
alter table wtp.user_setting add foreign key ( user_id ) references wtp.users ( id ) ;
alter table wtp.user_setting add foreign key ( setting_type_id ) references wtp.setting_type ( id ) ;
alter table wtp.access_for_role add foreign key (access_control_item_id) references wtp.access_control_item (id) ;
alter table wtp.access_for_role add foreign key (role_id) references wtp.role (id) ;
alter table wtp.user_role_department add foreign key ( department_id ) references wtp.department ( id ) ;
alter table wtp.user_role_department add foreign key ( role_id ) references wtp.role ( id ) ;
alter table wtp.user_role_department add foreign key ( user_id ) references wtp.users ( id ) ;


commit;


