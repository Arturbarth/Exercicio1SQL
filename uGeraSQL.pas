unit uGeraSQL;

interface

uses System.Classes, System.Generics.Collections, System.SysUtils;

type
  IColuna = interface
    ['{DA7AD0D2-64B8-49F9-A1B9-0DA4350C69A8}']
    function AdicionarColuna(AcColuna: String): IColuna;
    function RetornarColuna: String;
  end;

  ITabela = interface
    ['{D66BF235-2EB2-460B-BA39-D431D183CEF1}']
    function AdicionarTabela(AcTabela: String): ITabela;
    function RetornarTabela: String;
  end;

  ICondicao = interface
    ['{28275C47-8362-44AA-9928-460422342D21}']
    function AdicionarCondicao(AcCondicao: String): ICondicao;
    function RetornarCondicao: String;
  end;

  IGeradorSQL = interface
    ['{7CDEB602-A8D8-4A8D-A18C-52E50A7CFBC7}']
    function GerarSQL: String;
  end;

  TColuna = Class(TInterfacedObject, IColuna)
    private
      FColuna: String;
      procedure SetColuna(const Value: String);
      function AdicionarColuna(AcColuna: String): IColuna;
      function RetornarColuna: String;
    public
      property Coluna: String read FColuna write SetColuna;
      class function New: IColuna;
  End;

  TTabela = Class(TInterfacedObject, ITabela)
    private
     FTabela: String;
      procedure SetTabela(const Value: String);
      function AdicionarTabela(AcTabela: String): ITabela;
      function RetornarTabela: String;
    public
      property Tabela: String read FTabela write SetTabela;
      class function New: ITabela;
  End;

  TCondicao = Class(TInterfacedObject, ICondicao)
    private
      FCondicao: String;
      procedure SetCondicao(const Value: String);
      function AdicionarCondicao(AcCondicao: String): ICondicao;
      function RetornarCondicao: String;
    public
      property Condicao: String read FCondicao write SetCondicao;
      class function New: ICondicao;

  End;

  TGeradorSQL = Class(TInterfacedObject, IGeradorSQL)
    private
      FTabelas: TList<ITabela>;
      FCondicao: TList<ICondicao>;
      FColunas: TList<IColuna>;
      function RetornarColuas: String;
      function RetornarTabelas: String;
      function RetornarWhere: String;

      procedure SetColunas(const Value: TList<IColuna>);
      procedure SetTabelas(const Value: TList<ITabela>);
      procedure SetCondicao(const Value: TList<ICondicao>);

    public
      constructor Create;
      Destructor Destroy; Override;

      function GerarSQL: String;
      property Colunas: TList<IColuna> read FColunas write SetColunas;
      property Tabelas: TList<ITabela> read FTabelas write SetTabelas;
      property Condicao: TList<ICondicao> read FCondicao write SetCondicao;



  End;

implementation

{ TGeradorSQL }

constructor TGeradorSQL.Create;
begin
  Colunas := TList<IColuna>.Create;
  Tabelas := TList<ITabela>.Create;
  Condicao:= TList<ICondicao>.Create;
end;

destructor TGeradorSQL.Destroy;
begin
  FreeAndNil(FColunas);
  FreeAndNil(FTabelas);
  FreeAndNil(FCondicao);
  inherited;
end;

function TGeradorSQL.GerarSQL: String;
begin
  Result := Format('SELECT %S FROM %S WHERE %S', [RetornarColuas, RetornarTabelas, RetornarWhere]);
end;

function TGeradorSQL.RetornarColuas: String;
var
  I: Integer;
begin
  for I := 0 to Colunas.Count-1 do
    Result := Result + Colunas[i].RetornarColuna + ', ';
  //Result := Copy(Result, 1, Length(Result)-2);
end;

function TGeradorSQL.RetornarTabelas: String;
var
  I: Integer;
begin
  for I := 0 to Tabelas.Count-1 do
    Result := Result + Tabelas[i].RetornarTabela + ', ';
  //Result := Copy(Result, 1, Length(Result)-2);
end;

function TGeradorSQL.RetornarWhere: String;
var
  I: Integer;
begin
  for I := 0 to Condicao.Count-1 do
    Result := Result + Condicao[i].RetornarCondicao + ' AND ';
  //Result := Copy(Result, 1, Length(Result)-5);
end;

procedure TGeradorSQL.SetColunas(const Value: TList<IColuna>);
begin
  FColunas := Value;
end;

procedure TGeradorSQL.SetTabelas(const Value: TList<ITabela>);
begin
  FTabelas := Value;
end;

procedure TGeradorSQL.SetCondicao(const Value: TList<ICondicao>);
begin
  FCondicao := Value;
end;

{ TColuna }

function TColuna.AdicionarColuna(AcColuna: String): IColuna;
begin
  SetColuna(AcColuna);
  Result := Self;
end;

class function TColuna.New: IColuna;
begin
  Result := TColuna.Create;
end;

function TColuna.RetornarColuna: String;
begin
  Exit(FColuna);
end;

procedure TColuna.SetColuna(const Value: String);
begin
  FColuna := Value;
end;

{ TTabela }

function TTabela.AdicionarTabela(AcTabela: String): ITabela;
begin
  SetTabela(AcTabela);
  Result := Self;
end;

class function TTabela.New: ITabela;
begin
  Result := TTabela.Create;
end;

function TTabela.RetornarTabela: String;
begin
  Exit(FTabela);
end;

procedure TTabela.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

{ TCondicao }

function TCondicao.AdicionarCondicao(AcCondicao: String): ICondicao;
begin
  SetCondicao(AcCondicao);
  Result := Self;
end;

class function TCondicao.New: ICondicao;
begin
  Result := TCondicao.Create;
end;

function TCondicao.RetornarCondicao: String;
begin
  Exit(FCondicao);
end;

procedure TCondicao.SetCondicao(const Value: String);
begin
  FCondicao := Value;
end;

end.
