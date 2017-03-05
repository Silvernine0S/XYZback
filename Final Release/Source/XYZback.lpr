program XYZback;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, SysUtils, charencstreams
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAbout, About);

  //Not used but is there if there is a need. Allows the passing of parameters
  //into XYZback instead of having XYZback read an input file.
  //
  //    XYZback.exe mirror|sync "C:\Path1" "C:\Path2"
  //
  //Currently reading an input file is the default method which is done by:
  //
  //    XYZback.exe mirror|sync altmethod
  //
  If ParamStr(1) = 'mirror' Then
    Main.Mirror.Checked := True;
  If ParamStr(1) = 'sync' Then
    Main.Synchronize.Checked := True;
  If ParamStr(2) <> 'altmethod' Then //Use commane line parameters as input instead of file
    begin
      Main.SourceDirSelect.Text := ParamStr(2);
      Main.DestinationDirSelect.Text := ParamStr(3);
    end;
  If ParamStr(2) = 'altmethod' Then //Use file as input
    begin
      Fs := TCharEncStream.Create; //TCharEnc... is from the utf8tools
                                   //http://wiki.freepascal.org/UTF8_Tools

      //Because XYplorer's scripting WriteFile only support writing to UTF16,
      //utf8tools by theo/theodb was used to ease working with the non-fully
      //functional support for UTF16 in Lazarus/Free Pascal.
      //1. Load the file XYZbackStart.txt
      //2. Convert it to UTF8 without BOM from UTF16 LE
      //3. Write the result back into XYZbackStart.txt
      //4. Reead the file back into XYZback and process it.
      Fs.LoadFromFile('XYZbackStart.txt');
      StartupParams := Fs.UTF8Text;
      Fs.Free;
      AssignFile(StartupParamsFile,'XYZbackStart.txt');
      ReWrite(StartupParamsFile);
      WriteLn(StartupParamsFile,StartupParams);
      Reset(StartupParamsFile);
      ReadLn(StartupParamsFile,StartupParams); //Read 1st line of file
      Main.SourceDirSelect.Text := UTF8Encode(StartupParams); //1st line of file -> Source field
      ReadLn(StartupParamsFile,StartupParams); //Read 2nd line of file
      Main.DestinationDirSelect.Text := UTF8Encode(StartupParams); //2nd line of file -> Destination field
      CloseFile(StartupParamsFile);
      DeleteFile('XYZbackStart.txt'); //Required SysUtils
    end;
    Application.Run;
end.

