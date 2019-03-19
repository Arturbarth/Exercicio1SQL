unit uGeradorSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uGeraSQL;

type
  TFGeradorSQL = class(TForm)
    pnlTop: TPanel;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    mmColuna: TMemo;
    mmTabela: TMemo;
    mmCondicao: TMemo;
    btnGerarSQL: TButton;
    gbxSQLGerado: TGroupBox;
    mmSQL: TMemo;
    procedure btnGerarSQLClick(Sender: TObject);
  private
    procedure AdicionarColunas(oGerador: TGeradorSQL);
    procedure AdicionarCondicoes(oGerador: TGeradorSQL);
    procedure AdicionarTabelas(oGerador: TGeradorSQL);
    procedure GerarSQL;
    function ValidarMemosPreenchidos: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeradorSQL: TFGeradorSQL;

implementation

{$R *.dfm}

procedure TFGeradorSQL.btnGerarSQLClick(Sender: TObject);

begin
  if not ValidarMemosPreenchidos then
    begin
    ShowMessage('Os campos Colunas, Tabelas e Condição devem ser preenchidos!');
    Exit;
  end;
  GerarSQL;
end;

function TFGeradorSQL.ValidarMemosPreenchidos: Boolean;
begin
  Result := (mmColuna.Lines.Count > 0) and (mmTabela.Lines.Count > 0) and (mmCondicao.Lines.Count > 0);
end;

procedure TFGeradorSQL.GerarSQL;
var
  oGerador: TGeradorSQL;
begin
  try
    oGerador := TGeradorSQL.Create;
    AdicionarColunas(oGerador);
    AdicionarTabelas(oGerador);
    AdicionarCondicoes(oGerador);
    mmSQL.Lines.Add(oGerador.GerarSQL);
  finally
    FreeAndNil(oGerador);
  end;
end;

procedure TFGeradorSQL.AdicionarColunas(oGerador: TGeradorSQL);
var
  I: Integer;
begin
  for I := 0 to mmColuna.Lines.Count-1 do
    oGerador.Colunas.Add(TColuna.New.AdicionarColuna(mmColuna.Lines[i]));
end;

procedure TFGeradorSQL.AdicionarTabelas(oGerador: TGeradorSQL);
var
  I: Integer;
begin
  for I := 0 to mmTabela.Lines.Count-1 do
    oGerador.Tabelas.Add(TTabela.New.AdicionarTabela(mmTabela.Lines[i]));
end;

procedure TFGeradorSQL.AdicionarCondicoes(oGerador: TGeradorSQL);
var
  I: Integer;
begin
  for I := 0 to mmCondicao.Lines.Count-1 do
    oGerador.Condicao.Add(TCondicao.New.AdicionarCondicao(mmCondicao.Lines[i]));
end;



end.
