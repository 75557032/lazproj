unit upublictype;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms;

type
  PInitType=^TInitType;
  TInitType=record
    App:TApplication;
  end;

  TZhiXingSQL=function(const ASQL:string):NativeInt;
  TChaXunSQL=function(const ASQL:string;const AStream:TStream):NativeInt;
  TShangChuanFile=function(const AClientFile,AServerFile:string):NativeInt;
  TXiaZaiFile=function(const AClientFile,AServerFile:string):NativeInt;
  TFaSongStr=function(const AStr:string):string;

  TInitModel=function(const AInitType:TInitType):Boolean;
  TGetModelClass=function():NativeInt;
  TGetModelMode=function():NativeInt;
  TFinalizModel=function():Boolean;

  PPublicFunctionType=^TPublicFunctionType;
  TPublicFunctionType=record
    ZhiXingSQL:TZhiXingSQL;
    ChaXunSQL:TChaXunSQL;
    ShangChuanFile:TShangChuanFile;
    XiaZaiFile:TXiaZaiFile;
    FaSongStr:TFaSongStr;
  end;

  PPublicModelType=^TPublicModelType;
  TPublicModelType=record
    InitModel:TInitModel;
    GetModelClass:TGetModelClass;
    GetModelMode:TGetModelMode;
    FinalizModel:TFinalizModel;
  end;

implementation

end.

