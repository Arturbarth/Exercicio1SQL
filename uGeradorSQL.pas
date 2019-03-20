unit uGeradorSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uGeraSQL;

type
  TFGeradorSQL = class(TForm)
    pnlTop: TPanel;
    gbxCondicao: TGroupBox;
    gbxTabela: TGroupBox;
    gbxColuna: TGroupBox;
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
  Result := (Trim(mmColuna.Text) <> EmptyStr) and (Trim(mmTabela.Text) <> EmptyStr) and (Trim(mmCondicao.Text) <> EmptyStr);
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
    mmSQL.Text := oGerador.GerarSQL;
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
