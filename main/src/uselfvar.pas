unit uselfvar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, uselftype, uselfconst;

var
  gKuangJiaJieGouLeiXing:TKuangJiaJieGouLeiXing;

implementation

procedure InitKuangJiaJieGouLeiXing;
begin
  gKuangJiaJieGouLeiXing.IconPath:=ExtractFilePath(Application.ExeName)+kj_jg_IconPath_File;
  gKuangJiaJieGouLeiXing.SysConfigPath:=ExtractFilePath(Application.ExeName)+kj_jg_ConfigPath_File;
  gKuangJiaJieGouLeiXing.ModelPath:=ExtractFilePath(Application.ExeName)+kj_jg_ModelPath_Dir;
end;

initialization
  InitKuangJiaJieGouLeiXing;
end.

