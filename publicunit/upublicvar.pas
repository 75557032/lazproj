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
function JiaZaiTongXinChaJian(AChaJianMingList:TStrings):Boolean;

implementation

uses upublicconst;

procedure InitTongXinChaJianList;
begin
  gTongXinChaJianList:=TStringList.Create;
end;

procedure FinalizTongXinChaJianList;
var
  i:Integer;
begin
  for i:=gTongXinChaJianList.Count-1 downto 0 do
  begin
    TPublicFunctionType(gTongXinChaJianList.Objects[i]).Free;
  end;
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

function JiaZaiTongXinChaJian(AChaJianMingList:TStrings):Boolean;
var
  i:Integer;
  LChaJianMing:PChar;
  LChaJian:string;
  LTempTongXinChaJian:TPublicFunctionType;
begin
  try
    for i:=0 to AChaJianMingList.Count-1 do
    begin
      LChaJian:=AChaJianMingList[i];
    {$IFDEF UNIX}
      LChaJianMing:=PChar(ExtractFilePath(ParamStr(0))+so_quanzhui+LChaJian+so_houzhui);
    {$ELSE}
      LChaJianMing:=PChar(ExtractFilePath(ParamStr(0))+LChaJian+dll_houzhui);
    {$ENDIF}
      LTempTongXinChaJian:=TPublicFunctionType.Create(LChaJianMing);
      gTongXinChaJianList.AddObject(LChaJian,LTempTongXinChaJian);
    end;
    Result:=True;
  except
    Result:=False;
  end;
end;

end.

