unit upublicvar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, upublictype;

var
  gTongXinChaJianList:TStrings;

procedure InitTongXinChaJianList;
procedure FinalizTongXinChaJianList;
function GetTongXinChaJian(const AChaJianMing:string):TPublicFunctionType; overload;
function GetTongXinChaJian(const AIndex:NativeInt):TPublicFunctionType; overload;
function JiaZaiTongXinChaJian(const AChaJianMing:string):Boolean;

implementation

procedure InitTongXinChaJianList;
begin
  gTongXinChaJianList:=TStringList.Create;
end;

procedure FinalizTongXinChaJianList;
begin
  FreeAndNil(gTongXinChaJianList);
end;

function GetTongXinChaJian(const AChaJianMing: string): TPublicFunctionType;
var
  LIndex:NativeInt;
begin
  LIndex:=gTongXinChaJianList.IndexOf(AChaJianMing);
  Result:=GetTongXinChaJian(LIndex);
end;

function GetTongXinChaJian(const AIndex: NativeInt): TPublicFunctionType;
begin
  if AIndex<0 then
  begin
    Result:=nil;
  end
  else
  begin
    Result:=TPublicFunctionType(gTongXinChaJianList.Objects[AIndex]);
  end;
end;

function JiaZaiTongXinChaJian(const AChaJianMing: string): Boolean;
const TongXinChaJianFenGeFu=';';
var
  LTempList:TStrings;
  i:Integer;
  LChaJianMing:PChar;
  LChaJian:string;
  LTempTongXinChaJian:TPublicFunctionType;
begin
  LTempList:=TStringList.Create;
  try
    LTempList.Delimiter:=TongXinChaJianFenGeFu;
    LTempList.DelimitedText:=AChaJianMing;
    for i:=0 to LTempList.Count-1 do
    begin
      LChaJian:=LTempList[i];
      LChaJianMing:=PChar(LChaJian);
      LTempTongXinChaJian:=TPublicFunctionType.Create(LChaJianMing);
      gTongXinChaJianList.AddObject(LChaJian,LTempTongXinChaJian);
    end;
  finally
    LTempList.Free;
  end;
end;

end.

