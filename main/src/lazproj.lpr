program lazproj;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, umain, uselfconst, uselfvar, uselffunction, uselfconfig, uselftype,
  upublictype, upublicvar, upublicconst, upublicfunction
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  if not JianChaJieGou then
  begin
    Exit;
  end;
  InitIniFile;
  try
    Application.Icon.LoadFromFile(gKuangJiaJieGouLeiXing.IconPath);
    Application.ShowMainForm:=False;
    Application.CreateForm(TfrmMain, frmMain);
    Application.Run;
  finally
    FinaliFile;
  end;
end.

