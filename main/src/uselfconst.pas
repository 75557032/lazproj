unit uselfconst;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  kj_jg_ModelPath_Dir='Model';
  kj_jg_IconPath_File='main.ico';
  kj_jg_ConfigPath_File='sysconfig.ini';

  error_zhaobudao_configfile='找不到系统配置文件';
  error_zhaobudao_iconfile='找不到系统图标文件';
  error_zhaobudao_modeldir='找不到插件保存目录';

  sys_configdefault='';

  sys_config_biaoti='SysConfig';
  sys_config_chengxu_biaoti='ChengXuBiaoTi';
  sys_config_zhuchuangti_biaoti='ZhuChuangTiBiaoTi';

implementation

end.

