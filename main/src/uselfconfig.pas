unit uselfconfig;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, Dialogs, uselfconst, uselfvar, FileUtil;

procedure InitIniFile;
procedure FinaliFile;
function ReadSysConfig(const Section, Ident: string): string;

implementation

var
  _sgIniFile:TIniFile;

function ReadSysConfig(const Section, Ident: string): string;
begin
  try
    Result:=SysToUTF8(_sgIniFile.ReadString(Section,Ident,sys_configdefault));
  except
    ShowMessage(error_zhaobudao_configfile);
  end;
end;

procedure InitIniFile;
begin
  _sgIniFile:=TIniFile.Create(gKuangJiaJieGouLeiXing.SysConfigPath);
end;

procedure FinaliFile;
begin
  FreeAndNil(_sgIniFile);
end;

end.

