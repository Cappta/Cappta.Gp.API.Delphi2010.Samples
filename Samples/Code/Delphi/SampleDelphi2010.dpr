program SampleDelphi2010;

uses
  Forms,
  SampleDeli2010 in 'SampleDeli2010.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
