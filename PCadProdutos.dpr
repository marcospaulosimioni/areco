program PCadProdutos;

uses
  Forms,
  CadProdutos in 'CadProdutos.pas' {FormCadProdutos},
  uConexaoBanco in 'uConexaoBanco.pas',
  uControle in 'uControle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCadProdutos, FormCadProdutos);
  Application.Run;
end.
