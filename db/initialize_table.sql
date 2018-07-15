-- Project Name : noname
-- Date/Time    : 2018/07/15 8:46:25
-- Author       : Hata
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ユーザトークン
create table user_token (
  user_id integer not null
  , token varchar
) ;

-- 招待履歴
create table invite_hist (
  invite_hist_id serial not null
  , room_id integer not null
  , user_id integer not null
  , invite_date date not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint invite_hist_PKC primary key (invite_hist_id)
) ;

-- 部屋家事
create table room_home_work (
  room_home_work_id serial not null
  , room_id integer not null
  , home_work_name varchar(127) not null
  , bese_home_work_time_hh decimal(3,1) not null
  , is_visible boolean not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint room_home_work_PKC primary key (room_home_work_id)
) ;

-- 共通カラムテンプレート
create table COMMON_TMPLETE (
  is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
) ;

-- 家事履歴
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

-- 家事マスタ
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

-- 部屋ユーザ
create table room_user (
  room_id serial not null
  , user_id integer not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at timestamp not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint room_user_PKC primary key (room_id,user_id)
) ;

-- 部屋
create table room (
  room_id serial not null
  , room_name varchar(255) not null
  , user_id integer not null
  , room_access_key varchar(128) not null
  , is_deleted boolean not null
  , created_by varchar(255) not null
  , created_at varchar(255) not null
  , updated_by varchar(255)
  , updated_at varchar(255)
  , constraint room_PKC primary key (room_id)
) ;

-- ユーザマスタ
create table user_master (
  user_id integer not null
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

comment on table user_token is 'ユーザトークン';
comment on column user_token.user_id is 'ユーザID';
comment on column user_token.token is 'トークン';

comment on table invite_hist is '招待履歴';
comment on column invite_hist.invite_hist_id is '招待履歴ID';
comment on column invite_hist.room_id is '部屋ID';
comment on column invite_hist.user_id is 'ユーザID';
comment on column invite_hist.invite_date is '招待日時';
comment on column invite_hist.is_deleted is '削除フラグ';
comment on column invite_hist.created_by is '作成者';
comment on column invite_hist.created_at is '作成日時';
comment on column invite_hist.updated_by is '更新者';
comment on column invite_hist.updated_at is '更新日時';

comment on table room_home_work is '部屋家事';
comment on column room_home_work.room_home_work_id is '部屋家事ID';
comment on column room_home_work.room_id is '部屋ID';
comment on column room_home_work.home_work_name is '家事名';
comment on column room_home_work.bese_home_work_time_hh is '基準家事時間';
comment on column room_home_work.is_visible is '表示フラグ';
comment on column room_home_work.is_deleted is '削除フラグ';
comment on column room_home_work.created_by is '作成者';
comment on column room_home_work.created_at is '作成日時';
comment on column room_home_work.updated_by is '更新者';
comment on column room_home_work.updated_at is '更新日時';

comment on table COMMON_TMPLETE is '共通カラムテンプレート';
comment on column COMMON_TMPLETE.is_deleted is '削除フラグ';
comment on column COMMON_TMPLETE.created_by is '作成者';
comment on column COMMON_TMPLETE.created_at is '作成日時';
comment on column COMMON_TMPLETE.updated_by is '更新者';
comment on column COMMON_TMPLETE.updated_at is '更新日時';

comment on table home_work_hist is '家事履歴';
comment on column home_work_hist.home_work_hist_id is '家事履歴ID';
comment on column home_work_hist.room_id is '部屋ID';
comment on column home_work_hist.room_home_work_id is '部屋家事ID';
comment on column home_work_hist.user_id is 'ユーザID';
comment on column home_work_hist.home_work_date is '家事日';
comment on column home_work_hist.home_work_time_hh is '家事時間';
comment on column home_work_hist.is_deleted is '削除フラグ';
comment on column home_work_hist.created_by is '作成者';
comment on column home_work_hist.created_at is '作成日時';
comment on column home_work_hist.updated_by is '更新者';
comment on column home_work_hist.updated_at is '更新日時';

comment on table home_work_master is '家事マスタ';
comment on column home_work_master.home_work_id is '家事ID';
comment on column home_work_master.home_work_name is '家事名';
comment on column home_work_master.base_home_work_time_hh is '基準家事時間';
comment on column home_work_master.is_deleted is '削除フラグ';
comment on column home_work_master.created_by is '作成者';
comment on column home_work_master.created_at is '作成日時';
comment on column home_work_master.updated_by is '更新者';
comment on column home_work_master.updated_at is '更新日時';

comment on table room_user is '部屋ユーザ';
comment on column room_user.room_id is '部屋ID';
comment on column room_user.user_id is 'ユーザID';
comment on column room_user.is_deleted is '削除フラグ';
comment on column room_user.created_by is '作成者';
comment on column room_user.created_at is '作成日時';
comment on column room_user.updated_by is '更新者';
comment on column room_user.updated_at is '更新日時';

comment on table room is '部屋';
comment on column room.room_id is '部屋ID';
comment on column room.room_name is '部屋名';
comment on column room.user_id is '部屋オーナー';
comment on column room.room_access_key is '部屋アクセスキー';
comment on column room.is_deleted is '削除フラグ';
comment on column room.created_by is '作成者';
comment on column room.created_at is '作成日時';
comment on column room.updated_by is '更新者';
comment on column room.updated_at is '更新日時';

comment on table user_master is 'ユーザマスタ';
comment on column user_master.user_id is 'ユーザID';
comment on column user_master.email is 'Eメール';
comment on column user_master.user_name is '名前';
comment on column user_master.auth_type is '認証タイプ';
comment on column user_master.auth_id is '認証ID';
comment on column user_master.is_deleted is '削除フラグ';
comment on column user_master.created_by is '作成者';
comment on column user_master.created_at is '作成日時';
comment on column user_master.updated_by is '更新者';
comment on column user_master.updated_at is '更新日時';
