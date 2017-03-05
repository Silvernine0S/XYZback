unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, lclintf, Buttons;

type

  { TAbout }

  TAbout = class(TForm)
    XYplorer: TImage;
    Zback: TImage;
    AboutText: TStaticText;
    XYplorerURL: TLabel;
    ZbackURL: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure XYplorerClick(Sender: TObject);
    procedure XYplorerURLClick(Sender: TObject);
    procedure ZbackClick(Sender: TObject);
    procedure ZbackURLClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  About: TAbout;

implementation

{$R *.lfm}

{ TAbout }

procedure TAbout.FormCreate(Sender: TObject);
begin

end;

procedure TAbout.XYplorerClick(Sender: TObject);
begin
  OpenURL('http://www.xyplorer.com/');
end;

procedure TAbout.XYplorerURLClick(Sender: TObject);
begin
  OpenURL('http://www.xyplorer.com/');
end;

procedure TAbout.ZbackClick(Sender: TObject);
begin
  OpenURL('http://titan.fsb.hr/~dzorc/zback.html');
end;

procedure TAbout.ZbackURLClick(Sender: TObject);
begin
  OpenURL('http://titan.fsb.hr/~dzorc/zback.html');
end;

end.

