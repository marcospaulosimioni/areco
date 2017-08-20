unit CadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,
  uConexaoBanco;

type
  TFormCadProdutos = class(TForm)
    edtCodigo: TEdit;
    edtValor: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    cmbUnidade: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  FCodigo : String;
  FDescricao : String;
  FUnidade : String;
  FValor : String;
  Fcontrole :TControle;

  public

  constructor Create(pConexaoControle:TControle);
  destructor Destroy; override;

  function InsereProduto : Boolean;
  function AlteraProduto : Boolean;
  function ExcluirProduto : Boolean;
  function PesquisaProduto(pCodigo:string):TCadProduto;

  property Codigo : String read FCodigo write FCodigo;
  property Descricao : String read FDescricao write FDescricao;
  property Unidade : String read FUnidade write FUnidade;
  property Valor : String read FValor write FValor;

  end;

var

  FormCadProdutos: TFormCadProdutos;

implementation

function TCadProduto.AlteraProduto: Boolean;

begin

  FControle.SQL.Close;
  FControle.SQL.SQL.Clear;
  FControle.SQL.SQL.Add(' UPDATE PRODUTOS ');
  FControle.SQL.SQL.Add(' SET DESCRICAO = :vDESCRICAO, ');
  FControle.SQL.SQL.Add(' UNIDADE = :vUNIDADE, ');
  FControle.SQL.SQL.Add(' VALOR = :vVALOR, ');
  FControle.SQL.SQL.Add(' WHERE (CODIGO = :vCODIGO) ');

  FControle.SQL.ParamByName('vDESCRICAO').AsString := Self.Descricao;
  FControle.SQL.ParamByName('vUNIDADE').AsString := Self.Unidade;
  FControle.SQL.ParamByName('vVALOR').AsString := Self.Valor;

try

    FControle.SQL.ExecSQL;
    Result := True;

  except
    Result := False;
  end;

end;

constructor TCadProduto.Create(pConexaoControle:TControle);

begin
  Fcontrole := pConexaoControle;
end;

destructor TCadProduto.Destroy;

begin
inherited;
end;

function TCadProduto.ExcluirProduto: Boolean;

begin

  Fcontrole.SQL.Close;
  FControle.SQL.SQL.Clear;
  FControle.SQL.SQL.Add(' DELETE FROM PRODUTOS ');
  FControle.SQL.SQL.Add(' WHERE CODIGO = :vCODIGO ');
  FControle.SQL.ParamByName('vCODIGO').AsString := Self.Codigo;

try

    FControle.SQL.ExecSQL;
    Result := True;

  except
    Result := False;
  end

end;


function TCadProduto.InsereProduto: Boolean;

begin

  FControle.SQL.Close;
  FControle.SQL.SQL.Clear;
  FControle.SQL.SQL.Add(' INSERT INTO PRODUTOS ');
  FControle.SQL.SQL.Add(' (DESCRICAO, ');
  FControle.SQL.SQL.Add(' UNIDADE, ');
  FControle.SQL.SQL.Add(' VALOR, ');

  FControle.SQL.ParamByName('vDESCRICAO').AsString := Self.Descricao;
  FControle.SQL.ParamByName('vUNIDADE').AsString := Self.Unidade;
  FControle.SQL.ParamByName('vVALOR').AsString := Self.Valor;

try

    FControle.SQL.ExecSQL;
    Result := True;

  except
    Result := False;
  end;

end;

function TCadProduto.PesquisaProduto: TCadProduto;

begin

  FControle.SQL.Close;
  FControle.SQL.SQL.Clear;
  FControle.SQL.SQL.Add(' SELECT * FROM PRODUTOS ');

  FControle.SQL.Open;

if FControle.SQL.IsEmpty then

    begin

      Self.Codigo := '';

    end

  else

  begin

    Self.Codigo := FControle.SQL.ParamByName('vCODIGO').AsString ;
    Self.Descricao := FControle.SQL.ParamByName('vDESCRICAO').AsString ;
    Self.Unidade := FControle.SQL.ParamByName('vUNIDADE').AsString ;
    Self.Valor := FControle.SQL.ParamByName('vVALOR').AsString ;

  end;
  
end;

procedure TFormCadProdutos.btnExcluirClick(Sender: TObject);
begin

  TCadProduto.ExcluirProduto;

end;

procedure TFormCadProdutos.btnEditarClick(Sender: TObject);
begin

if trim(edtCodigo.Text) <> '' then

     edtDescricao.Enabled = True;
     cmbUnidade.Enabled = True;
     edtValor.Enabled = True;
     cmbUnidade.SetFocus;
     
else
  Erro('É Necessario selecionar um registro no grid.');
end;
end;

procedure TFormCadProdutos.DBGrid1CellClick(Column: TColumn);
begin

    edtCodigo.Text := FControle.SQL.ParamByName('vCODIGO').AsString ;
    edtDescricao.Text := FControle.SQL.ParamByName('vDESCRICAO').AsString ;
    cmbUnidade.Text := FControle.SQL.ParamByName('vUNIDADE').AsString ;
    edtValor.Text := FControle.SQL.ParamByName('vVALOR').AsString ;

end;

procedure TFormCadProdutos.btnSalvarClick(Sender: TObject);
begin

TCadProduto.InsereProduto;

end;

procedure TFormCadProdutos.btnNovoClick(Sender: TObject);
begin

  edtCodigo.Text := '';
  edtDescricao.Text := '';
  cmbUnidade.Text := '';
  edtValor.Text := '';
  cmbUnidade.SetFocus;
  
end;

procedure TFormCadProdutos.FormShow(Sender: TObject);
begin
TCadProduto.PesquisaProduto;
end;

end.
