program prjGeradorSQL;

uses
  Vcl.Forms,
  uGeradorSQL in 'uGeradorSQL.pas' {FGeradorSQL},
  uGeraSQL in 'uGeraSQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFGeradorSQL, FGeradorSQL);
  Application.Run;
end.
