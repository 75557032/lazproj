unit upublicfunction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
{$IFDEF WINDOWS}
  windows
{$ELSE}
  dl
{$ENDIF}
  ;

function JiaZaiChaJian(const AModelName: PChar):NativeInt;
function HuoQuChaJianHanShu(const AChaJianPointer:NativeInt;const AHanShuMing:PChar):Pointer;
procedure ShiFangChaJian(const AChaJianPointer:NativeInt);

implementation

function JiaZaiChaJian(const AModelName: PChar):NativeInt;
begin
{$IFDEF WINDOWS}
  Result:=LoadLibrary(AModelName);
{$ELSE}
  Result:=NativeInt(dlopen(AModelName,RTLD_LAZY));
{$ENDIF}
end;

function HuoQuChaJianHanShu(const AChaJianPointer: NativeInt;
  const AHanShuMing: PChar): Pointer;
begin
{$IFDEF WINDOWS}
  Result:=GetProcAddress(AChaJianPointer,AHanShuMing);
{$ELSE}
  Result:=dlsym(AChaJianPointer,AHanShuMing);
{$ENDIF}
end;

procedure ShiFangChaJian(const AChaJianPointer:NativeInt);
begin
{$IFDEF WINDOWS}
  FreeLibrary(AChaJianPointer);
{$ELSE}
  dlclose(AChaJianPointer);
{$ENDIF}
end;

end.

