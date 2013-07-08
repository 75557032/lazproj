{-------------------------------------------------------------------------------
1.局部变量:Lxxx;
2.接口域变量:gxxx;
3.实现域变量:_sgxxx;
4.类变量:Fxxx;
5.类名:Txxx;
6.接口名:Ixxx;
7.参数名:Axxx;
8.窗体名:frmxxx;
9.单元名:uxxx;
10.DataModel名:dmxxx;
11.工程名:xxxproj;
12.结构体名:Txxx;
13.指针类型名:Pxxx;
14.异常:Exxx;
注:单个函数不许超过30行
-------------------------------------------------------------------------------}
unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, ExtCtrls, Menus,
  ComCtrls, ActnList, uselfvar, uselfconst, uselfconfig;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    actList: TActionList;
    bj_img: TImage;
    mm_menu: TMainMenu;
    sb_bar: TStatusBar;
    ti_icon: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure InitMainForm;
    procedure FinalizForm;
    function JiaZaiTongXinAPI:Boolean;
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses upublicvar,upublicconst;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  bj_img.Picture.LoadFromFile(bj_imgpath);
  InitMainForm;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FinalizForm;
end;

procedure TfrmMain.InitMainForm;
begin
  InitTongXinChaJianList;
  JiaZaiTongXinAPI;
  Self.Icon.LoadFromFile(gKuangJiaJieGouLeiXing.IconPath);
  ti_icon.Icon.LoadFromFile(gKuangJiaJieGouLeiXing.IconPath);
  Application.Title:=ReadSysConfig(sys_config_biaoti,sys_config_chengxu_biaoti);
  Self.Caption:=ReadSysConfig(sys_config_biaoti,sys_config_zhuchuangti_biaoti);
  Self.WindowState:=wsMaximized;
  Self.Show;
end;

procedure TfrmMain.FinalizForm;
begin
  FinalizTongXinChaJianList;
end;

function TfrmMain.JiaZaiTongXinAPI: Boolean;
var
  LTempList:TStrings;
begin
  LTempList:=TStringList.Create;
  try
    LTempList.Delimiter:=sys_config_tongxinchajian_fengefu;
    LTempList.DelimitedText:=ReadSysConfig(sys_config_biaoti,sys_config_tongxinchajian_biaoti);
    Result:=JiaZaiTongXinChaJian(LTempList);
  finally
    LTempList.Free;
  end;
end;

end.

