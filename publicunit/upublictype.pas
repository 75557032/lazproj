unit upublictype;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms;

type
  TZhiXingSQL=function(const ASQL:string):NativeInt;
  TChaXunSQL=function(const ASQL:string; AStream:TStream):NativeInt;
  TShangChuanFile=function(const AClientFile,AServerFile:string):NativeInt;
  TXiaZaiFile=function(const AClientFile,AServerFile:string):NativeInt;
  TFaSongStr=function(const AStr:string):string;
{$H+}

  { TPublicFunctionType }

  TPublicFunctionType=class(TObject)
  private
    FChaJianPointer:NativeInt;
    procedure InitFunction;
  public
    ZhiXingSQL:TZhiXingSQL;
    ChaXunSQL:TChaXunSQL;
    ShangChuanFile:TShangChuanFile;
    XiaZaiFile:TXiaZaiFile;
    FaSongStr:TFaSongStr;
    constructor Create(AModelName:PChar);virtual;
    destructor Destroy;override;
  end;
{$H-}
  PInitChaJianType=^TInitChaJianType;
  TInitChaJianType=record
    App:TApplication;
  end;
  TGetPublicFunction=function(APublicFunction:TPublicFunctionType):Boolean;
  TInitChaJian=function(const AInitChaJianType:TInitChaJianType):Boolean;
  TFinalizChaJian=function():Boolean;

  PInitType=^TInitType;
  TInitType=record
    App:TApplication;
    TongXinChaJianList:TStrings;
    MoKuaiID:NativeInt;
    MoKuaiMing:string;
    ShouCan:string;
    MoKuaiLeiXing:NativeInt;
  end;
  TInitModel=function(const AInitType:TInitType):Boolean;
  TGetModelClass=function():NativeInt;
  TGetModelMode=function():NativeInt;
  TFinalizModel=function():Boolean;
  PPublicModelType=^TPublicModelType;
  TPublicModelType=record
    InitModel:TInitModel;
    GetModelClass:TGetModelClass;
    GetModelMode:TGetModelMode;
    FinalizModel:TFinalizModel;
  end;

  TKeShiHuaMoKuai=class(TForm)

  end;
  TFeiKeShiHuaMoKuai=class(TComponent)

  end;
  TKeShiHuaMoKuaiClass=class of TKeShiHuaMoKuai;
  TFeiKeShiHuaMoKuaiClass=class of TFeiKeShiHuaMoKuai;

implementation

uses upublicfunction,upublicconst;

{ TPublicFunctionType }

procedure TPublicFunctionType.InitFunction;
var
  LGetPublicFunction:TGetPublicFunction;
begin
  LGetPublicFunction:=TGetPublicFunction(HuoQuChaJianHanShu(FChaJianPointer,tx_chajian_getpublicfunction));
  LGetPublicFunction(Self);
end;

constructor TPublicFunctionType.Create(AModelName: PChar);
const
  Error_Nil=0;
var
  LInitChaJian:TInitChaJian;
  LInitChaJianType:TInitChaJianType;
begin
  FChaJianPointer:=JiaZaiChaJian(AModelName);
  if FChaJianPointer=Error_Nil then
  begin
    raise Exception.Create(error_chuangjiantongxinshibai);
  end;
  LInitChaJian:=TInitChaJian(HuoQuChaJianHanShu(FChaJianPointer,tx_chajian_initchajian));
  LInitChaJianType.App:=Application;
  LInitChaJian(LInitChaJianType);
  InitFunction;
end;

destructor TPublicFunctionType.Destroy;
var
  LFinalizChaJian:TFinalizChaJian;
begin
  LFinalizChaJian:=TFinalizChaJian(HuoQuChaJianHanShu(FChaJianPointer,tx_chajian_finalizchajian));
  LFinalizChaJian();
  ShiFangChaJian(FChaJianPointer);
  inherited Destroy;
end;

end.

