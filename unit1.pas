unit Unit1;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, EditBtn, UTF8Process, LConvEncoding, charencstreams, unit2;

type

  { TMain }

  TMain = class(TForm)
    Button1: TButton;
    SourceDirSelect: TDirectoryEdit;
    DestinationDirSelect: TDirectoryEdit;
    PreviewBtn: TButton;
    RunBtn: TButton;
    SwapPathBtn: TSpeedButton;
    IncludeSubfolders: TCheckBox;
    IncludeMaskText: TEdit;
    ExcludeMaskText: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ModeofOperation: TRadioGroup;
    Mirror: TRadioButton;
    Synchronize: TRadioButton;
    Timer1: TTimer;
    ZbackParamsText: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SwapPathBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure RunBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
    Main: TMain;
    Mode: UTF8String;
    SrcDir: UTF8String;
    DstDir: UTF8String;
    IncludeMask: UTF8String;
    ExcludeMask: UTF8String;
    SubDir: UTF8String;
    ZbackParams: UTF8String;
    ZbackParamsFile: Text;
    StartupParams: UTF8String;
    StartupParamsFile: Text;
    AProcess: TProcessUTF8;
    Fs: TCharEncStream;

implementation

{$R *.lfm}

{ TMain }

procedure TMain.Button1Click(Sender: TObject);
begin
      About.ShowModal; //Displays About window
end;

procedure TMain.SwapPathBtnClick(Sender: TObject); //Swap Source and Destination
begin
    SrcDir := SourceDirSelect.Directory;
    DstDir := DestinationDirSelect.Directory;
    SourceDirSelect.Text := DstDir;
    DestinationDirSelect.Text := SrcDir;
end;

procedure TMain.Timer1Timer(Sender: TObject);
begin
    If Main.Mirror.Checked = True Then
        Mode := 'm'  //Zback Mirror mode
    Else
        Mode := 'U'; //Zback Synchronize modee
    If Main.ExcludeMaskText.Text <> '' Then
        ExcludeMask := ' /cs k=[' + Main.ExcludeMaskText.Text + ']' //Zback Exclusion
    Else
        ExcludeMask := '';
    If Main.IncludeSubfolders.Checked = True Then
        SubDir := 's' //Zback recurse subdir
    Else
        SubDir := '';

      //ZbackParams is the actual Zback parameters that are sent to Zback.exe
      //unlike Main.ZbackParamsText.Text which is used for display in GUI.
      ZbackParams :=
      Main.SourceDirSelect.Directory + '\' +
      Main.IncludeMaskText.Text + ' > ' +
      Main.DestinationDirSelect.Directory + ' /' +
      Mode + SubDir + ExcludeMask;
      Main.ZbackParamsText.Text := 'zback.exe "' + ZbackParams + '"';
end;




//Due to various issues with Unicode in Lazarus, instead of directly sending the
//parameters to Zback via command line, a file is written instead in UTF-8 with
//BOM and Zback is to read that batch file.
var s:UTF8String;
procedure StartZback(var mode: UTF8String);
begin
    AssignFile(ZbackParamsFile,'XYZback.bal'); //File name initiated with handle.
    ReWrite(ZbackParamsFile); //File is open up for action through handle ZbackParamsFile
    WriteLn(ZbackParamsFile,UTF8ToUTF8BOM(ZbackParams)); //ZBackParams is written
                                                         //with content ZbackParams.
    //File is forcefully written in UTF-8 with BOM because
    //Zback would not read the file properly otherwise.
    //UTF-16 LE is supported by Zback but Lazarus does not have full support.
    CloseFile(ZbackParamsFile);
    AProcess := TProcessUTF8.Create(nil);
    AProcess.Executable:= 'zback.exe';
    AProcess.Parameters.Add('"XYZback.bal"' + ' /' + mode);
    AProcess.Execute;
    //DeleteFile('XYZback.bal');
end;
procedure TMain.PreviewBtnClick(Sender: TObject);
begin
    s := 'l';
    StartZback(s);
end;
procedure TMain.RunBtnClick(Sender: TObject);
begin
    s := 'r';
    StartZback(s);
end;

// - Code below is for passing parameters to Zback via command line.
//Required all strings to be UnicodeString (UTF-16). Lazarus does not have full
//support for UTF-16 yet and as a result, went back to using only UTF-8. Then output
//Zback command parameters to its batch file format and then have Zback read it back
//insteead of passing the parameters through cmd as intended.
//    ZbackParams := '"' + ZbackParams + '"' + ' /l';
//    AProcess := TProcessUTF8.Create(nil);
//    AProcess.Executable:= 'zback.exe';
//    AProcess.Parameters.Add(PWideChar(ZbackParams));
//    AProcess.Execute;

end.

