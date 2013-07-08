unit upublicfunction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
{$IFDEF UNIX}
  dl
{$ELSE}
  windows
{$ENDIF}
  ;

function JiaZaiChaJian(const AModelName: PChar):NativeInt;
function HuoQuChaJianHanShu(const AChaJianPointer:NativeInt;const AHanShuMing:PChar):Pointer;
procedure ShiFangChaJian(const AChaJianPointer:NativeInt);

implementation

function JiaZaiChaJian(const AModelName: PChar):NativeInt;
begin
{$IFDEF UNIX}
  Result:=NativeInt(dlopen(AModelName,RTLD_LAZY));
{$ELSE}
  Result:=LoadLibrary(AModelName);
{$ENDIF}
end;

function HuoQuChaJianHanShu(const AChaJianPointer: NativeInt;
  const AHanShuMing: PChar): Pointer;
begin
{$IFDEF UNIX}
  Result:=dlsym(AChaJianPointer,AHanShuMing);
{$ELSE}
  Result:=GetProcAddress(AChaJianPointer,AHanShuMing);
{$ENDIF}
end;

procedure ShiFangChaJian(const AChaJianPointer:NativeInt);
begin
{$IFDEF UNIX}
  dlclose(AChaJianPointer);
{$ELSE}
  FreeLibrary(AChaJianPointer);
{$ENDIF}
end;

end.

