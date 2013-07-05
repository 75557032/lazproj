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
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, uselfvar, uselfconst, uselfconfig;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure InitMainForm;
    procedure FinalizForm;
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitMainForm;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FinalizForm;
end;

procedure TfrmMain.InitMainForm;
begin
  Self.Icon.LoadFromFile(gKuangJiaJieGouLeiXing.IconPath);
  Application.Title:=ReadSysConfig(sys_config_biaoti,sys_config_chengxu_biaoti);
  Self.Caption:=ReadSysConfig(sys_config_biaoti,sys_config_zhuchuangti_biaoti);
  Self.WindowState:=wsMaximized;
  Self.Show;
end;

procedure TfrmMain.FinalizForm;
begin
  //
end;

end.

