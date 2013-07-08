unit upublicconst;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  mkls_feikeshi=1;
  mkls_show=2;
  mkls_showmodel=3;
  mkls_showpage=4;

  cdksx_zhengchang=1;
  cdksx_kaishixian=2;

  jzsj_chushihua=1;
  jzsj_tuichu=2;

  rz_denglu=1;
  rz_dengchu=2;

  tx_zhixingsql=1;
  tx_chaxunsql=2;
  tx_shangchuanfile=3;
  tx_xiazaifile=4;
  tx_fasongstr=5;

  tsdksl_buxianzhi=1;

  mk_chushi_kejian=0;
  mk_chushi_feikejian=1;

  mk_chushi_keyong=0;
  mk_chushi_feikeyong=1;

  tx_chajian_getpublicfunction='GetPublicFunction';
  tx_chajian_initchajian='InitChaJian';
  tx_chajian_finalizchajian='FinalizChaJian';

  error_chuangjiantongxinshibai='创建通信插件失败';

{$IFDEF UNIX}
  so_quanzhui='lib';
  so_houzhui='.so';
{$ELSE}
  dll_houzhui='.dll';
{$ENDIF}

implementation

end.

