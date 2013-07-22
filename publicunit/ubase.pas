unit ubase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type
  TfrmBase = class(TForm)
  private
    FTongLeiList:TList;
    FTabSheet:TTabSheet;
    FShouCan:string;
    FFuDaiCanShu:string;
    { private declarations }
  public
    { public declarations }
  published
    property TongLeiList:TList read FTongLeiList write FTongLeiList;
    property TabSheet:TTabSheet read FTabSheet write FTabSheet;
    property ShouCan:string read FShouCan write FShouCan;
    property FuDaiCanShu:string read FFuDaiCanShu write FFuDaiCanShu;
  end;

{$M+}
  TrunBase=class(TObject)
  private
    FTongLeiList:TList;
    FShouCan:string;
    FFuDaiCanShu:string;
    { private declarations }
  public
    { public declarations }
  published
    property TongLeiList:TList read FTongLeiList write FTongLeiList;
    property ShouCan:string read FShouCan write FShouCan;
    property FuDaiCanShu:string read FFuDaiCanShu write FFuDaiCanShu;
  end;
{$M-}

  TfrmBaseClass=class of TfrmBase;
  TrunBaseClass=class of TrunBase;

implementation

{$R *.lfm}

end.

