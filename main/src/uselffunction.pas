unit uselffunction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, uselfvar, uselfconst;

function JianChaJieGou:Boolean; //检查结构

implementation

function JianChaJieGou:Boolean;
begin
  Result:=False;
  if not FileExists(gKuangJiaJieGouLeiXing.SysConfigPath) then
  begin
    ShowMessage(error_zhaobudao_configfile);
    Exit;
  end;
  if not FileExists(gKuangJiaJieGouLeiXing.IconPath) then
  begin
    ShowMessage(error_zhaobudao_iconfile);
    Exit;
  end;
  if not DirectoryExists(gKuangJiaJieGouLeiXing.ModelPath) then
  begin
    ShowMessage(error_zhaobudao_modeldir);
    Exit;
  end;
  Result:=True;
end;

end.

