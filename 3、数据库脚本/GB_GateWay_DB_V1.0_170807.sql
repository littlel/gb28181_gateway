

--Date: 20170807
--Author: liyang 
--Description:


-- create DB
create database gb_gateway_db;


--create Table
/*==============================================================*/
/* Table: gw_version_info_tbl                                */
/*==============================================================*/
create table gw_version_info_tbl
(
   iID                  int not null comment '网关编号',
   iType                int  not null comment '类型',
   cSystemVersion       varchar(40) comment '网关系统版本',
   tBuildDate           timestamp comment '网关构建时间',
   cDetails             varchar(100) comment '网关详细信息',
   cCopyright           varchar(100) comment '网关版权信息',
   
);
alter table gw_version_info_tbl comment '网关基本信息';


/*==============================================================*/
/* Table: user_Tbl                                                  */
/*==============================================================*/
create table user_Tbl
(
   iID                  int not null comment '用户编号',
   cUserName            varchar(40) not null comment '用户名',
   cName                varchar(40) not null comment '用户真实姓名',
   cPassword            varchar(40) not null comment '用户密码',
   cUserRole            integer not null default 0 comment '用户角色',
   cUserAuthorization   varchar(40) not null comment '用户权限',
   cPartment            varchar(100) not null comment '用户所属部门',
   cIP                  varchar(40) not null comment '用户最近一次登录IP',
   tLoginDateTime       timestamp not null comment '用户最近一次登录时间',
   primary key (iID)
);

alter table user_Tbl comment '用户';



/*==============================================================*/
/* Table: local_gb_tbl                            		        */
/*==============================================================*/
use gb_gateway_db;
create table local_gb_tbl
(
   cGBID                varchar(20)  not null comment '本机信令国标编号',
   iExperis             int default 3600 comment '注册有效期',
   cIP                  varchar(40) not null comment '网关IP地址',
   idownPort            int not null default 5060 comment '网关对下级端口',
   iupport              int not null default 6060 comment '网关对上级端口',
   cUserName            varchar(40) comment '用户名',
   cPassword            varchar(40) comment '密码',
   primary key (cGBID)
);

alter table local_gb_tbl comment '本地网关国标参数';


/*==============================================================*/
/* Table: media_svr_tbl                                         */
/*==============================================================*/
use gb_gateway_db;
create table media_svr_tbl
(
   iID                  int not null  AUTO_INCREMENT comment '媒体流服务器编号',
   iMediaType           int  not null default 0 comment '媒体类型（0--转发服务器，1--转码服务器）',
   cName                varchar(30) not null comment '流媒体名称',
   cIP                  varchar(40) not null comment '媒体流服务器IP地址',
   iPort                int not null default 10050 comment '媒体流服务器端口：默认值554，范围(0,65535)',
   cAccessDateTime      timestamp not null  comment '最近一次接入成功时间',
   primary key (iID)
);

alter table media_svr_tbl comment '流媒体服务器';



/*==============================================================*/
/* Table: signalproxy_runing_status_tbl                         */
/*==============================================================*/
use gb_gateway_db;
create table signalproxy_runing_status_tbl
(
   iID                  int not null  AUTO_INCREMENT comment '信令服务器运行状态编号',
   fCPUUP               float(10) comment 'CPU使用率百分比',
   fMemUP               float(10) comment '内存使用率百分比',
   fDiskIOUP            float(10) comment '磁盘IO使用率百分比',
   fNetworkIOUP         float(10) comment '网络IO使用率百分比',
   dtUpdate             timestamp comment '时间点',   
   primary key (iID)
);

alter table signalproxy_runing_status_tbl comment '信令服务器运行状态';


/*==============================================================*/
/* Table: up_gb_platform_tbl                                    */
/*==============================================================*/
use gb_gateway_db;
create table up_gb_platform_tbl
(
   cGBID                varchar(20) not null comment '上级国标平台编号',
   cIP                  varchar(40) not null comment '上级国标平台IP地址',
   iPort                int not null default 5060 comment '上级国标平台端口',
   cUserName            varchar(40) not null comment '用户名',
   cPassword            varchar(40) not null comment '密码',
   cRegisterDomain      varchar(40) comment '注册域',
   cPlatformName        varchar(50) not null comment '平台名称',
   cPlatformfactory     varchar(50) not null comment  '平台厂家',
   iOnLine              int not null default 0 comment '是否在线 0 - 不在线，1 - 在线',
   cAccessDateTime      timestamp not null  comment '最近一次接入成功时间',
   primary key (cGBID)
);

alter table up_gb_platform_tbl comment '上级国标平台参数';



/*==============================================================*/
/* Table: down_gb_platform_tbl                               */
/*==============================================================*/
create table down_gb_platform_tbl
(
   cGBID                varchar(20)  not null comment '下级国标编号',
   cIP                  varchar(40) not null comment '下级国标平台IP地址',
   iPort                int not null comment '下级国标平台端口',
   cUserName            varchar(40) not null comment '用户名',
   cPassword            varchar(40) not null comment '密码',
   cPlatformVersion     varchar(40) not null comment '平台版本',
   iOnLine              int not null  default 0 comment '是否在线：0 - 异常, 1 - 在线',
   cAccessDateTime      timestamp not null   comment '下级国标平台最近一次接入时间',
   primary key (ID)
);

alter table down_gb_platform_tbl comment '下级国标平台参数';



create table device_info_tbl
(
   device_gbid   		varchar(20) not null comment '设备国标编号',
   device_source        int  not null  default 0 comment '设备来源  0 - 本机配置  1 - 下级推送',
   device_type          int  not null  default 132 comment '设备类型' , 
   device_name          varchar(128)   comment '设备名称',
   



);



-- 