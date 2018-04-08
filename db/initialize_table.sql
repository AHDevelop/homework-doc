-- Project Name : noname
-- Date/Time    : 2018/04/08 22:30:47
-- Author       : Hiro
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ユーザマスタ
drop table user_master cascade;

create table user_master (
  user_id serial not null
  , email varchar(255) not null
  , user_name varchar(255) not null
  , auth_type smallint not null
  , auth_id text
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint user_master_PKC primary key (user_id)
) ;

-- 部屋
drop table room cascade;

create table room (
  room_id serial not null
  , room_name varchar(255) not null
  , user_id integer not null
  , room_number integer not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at varchar(255) not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint room_PKC primary key (room_id)
) ;

-- 部屋ユーザ
drop table room_user cascade;

create table room_user (
  room_id integer not null
  , user_id integer not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint room_user_PKC primary key (room_id,user_id)
) ;

-- 家事マスタ
drop table home_work_master cascade;

create table home_work_master (
  home_work_id serial not null
  , home_work_name varchar(127) not null
  , base_home_work_time_hh decimal(3,1) not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint home_work_master_PKC primary key (home_work_id)
) ;

-- 家事履歴
drop table home_work_hist cascade;

create table home_work_hist (
  home_work_hist_id serial not null
  , room_id integer not null
  , room_home_work_id integer not null
  , user_id integer not null
  , home_work_date date not null
  , home_work_time_hh decimal(3,1) not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint home_work_hist_PKC primary key (home_work_hist_id)
) ;

-- 部屋家事
drop table room_home_work cascade;

create table room_home_work (
  room_home_work_id serial not null
  , room_id integer not null
  , home_work_name varchar(127) not null
  , base_home_work_time_hh decimal(3,1) not null
  , is_visible boolean not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint room_home_work_PKC primary key (room_home_work_id)
) ;

-- ユーザトークン
drop table user_token cascade;

create table user_token (
  user_id integer not null
  , token varchar(128) not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint user_token_PKC primary key (user_id)
) ;
