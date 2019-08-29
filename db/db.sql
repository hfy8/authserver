create table clientdetails
(
  appId                  varchar(256)  not null
    primary key,
  resourceIds            varchar(256)  null,
  appSecret              varchar(256)  null,
  scope                  varchar(256)  null,
  grantTypes             varchar(256)  null,
  redirectUrl            varchar(256)  null,
  authorities            varchar(256)  null,
  access_token_validity  int           null,
  refresh_token_validity int           null,
  additionalInformation  varchar(4096) null,
  autoApproveScopes      varchar(256)  null
);

create table oauth_access_token
(
  token_id          varchar(256) null,
  token             blob         null,
  authentication_id varchar(256) not null
    primary key,
  user_name         varchar(256) null,
  client_id         varchar(256) null,
  authentication    blob         null,
  refresh_token     varchar(256) null
);

create table oauth_approvals
(
  userId         varchar(256) null,
  clientId       varchar(256) null,
  scope          varchar(256) null,
  status         varchar(10)  null,
  expiresAt      timestamp    null,
  lastModifiedAt timestamp    null
);

create table oauth_client_details
(
  client_id               varchar(256)  not null
    primary key,
  resource_ids            varchar(256)  null,
  client_secret           varchar(256)  null,
  scope                   varchar(256)  null,
  authorized_grant_types  varchar(256)  null,
  web_server_redirect_uri varchar(256)  null,
  authorities             varchar(256)  null,
  access_token_validity   int           null,
  refresh_token_validity  int           null,
  additional_information  varchar(4096) null,
  autoapprove             varchar(256)  null
);

create table oauth_client_token
(
  token_id          varchar(256) null,
  token             blob         null,
  authentication_id varchar(256) not null
    primary key,
  user_name         varchar(256) null,
  client_id         varchar(256) null
);

create table oauth_code
(
  code           varchar(256) null,
  authentication blob         null
);

create table oauth_refresh_token
(
  token_id       varchar(256) null,
  token          blob         null,
  authentication blob         null
);

create table role
(
  id    bigint       not null
    primary key,
  name  varchar(50)  null,
  descn varchar(200) null
);

create table user
(
  id       bigint       not null
    primary key,
  username varchar(50)  null,
  password varchar(100) null,
  status   int          null,
  descn    varchar(200) null
);

create table user_addr
(
  user_addr_id  int unsigned auto_increment
  comment '自增主键ID'
    primary key,
  user_id       int unsigned                        not null
  comment 'user_login表的自增ID',
  zip           smallint(6)                         not null
  comment '邮编',
  province      smallint(6)                         not null
  comment '地区表中省份的ID',
  city          smallint(6)                         not null
  comment '地区表中城市的ID',
  district      smallint(6)                         not null
  comment '地区表中的区ID',
  address       varchar(200)                        not null
  comment '具体的地址门牌号',
  is_default    tinyint                             not null
  comment '是否默认',
  modified_time timestamp default CURRENT_TIMESTAMP not null
  on update CURRENT_TIMESTAMP
  comment '最后修改时间'
)
  comment '用户地址表';

create table user_inf
(
  user_inf_id        int unsigned auto_increment
  comment '自增主键ID'
    primary key,
  user_id            int unsigned                        not null
  comment 'customer_login表的自增ID',
  user_name          varchar(20)                         not null
  comment '用户真实姓名',
  identity_card_type tinyint default '1'                 not null
  comment '证件类型：1 身份证，2 军官证，3 护照',
  identity_card_no   varchar(20)                         null
  comment '证件号码',
  mobile_phone       int unsigned                        null
  comment '手机号',
  user_email         varchar(50)                         null
  comment '邮箱',
  gender             char                                null
  comment '性别',
  user_point         int default '0'                     not null
  comment '用户积分',
  register_time      timestamp                           not null
  comment '注册时间',
  birthday           datetime                            null
  comment '会员生日',
  user_level         tinyint default '1'                 not null
  comment '会员级别：1 普通会员，2 青铜，3白银，4黄金，5钻石',
  user_money         decimal(8, 2) default '0.00'        not null
  comment '用户余额',
  modified_time      timestamp default CURRENT_TIMESTAMP not null
  on update CURRENT_TIMESTAMP
  comment '最后修改时间'
)
  comment '用户信息表';

create table user_level_inf
(
  user_level    tinyint auto_increment
  comment '会员级别ID'
    primary key,
  level_name    varchar(10)                         not null
  comment '会员级别名称',
  min_point     int unsigned default '0'            not null
  comment '该级别最低积分',
  max_point     int unsigned default '0'            not null
  comment '该级别最高积分',
  modified_time timestamp default CURRENT_TIMESTAMP not null
  on update CURRENT_TIMESTAMP
  comment '最后修改时间'
)
  comment '用户级别信息表';

create table user_role
(
  user_id bigint not null,
  role_id bigint not null,
  primary key (user_id, role_id),
  constraint fk_user_role_role
  foreign key (role_id) references role (id),
  constraint fk_user_role_user
  foreign key (user_id) references user (id)
);

