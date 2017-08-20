unit uControle;

interface

uses

   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,
   uConexaoBanco;

type

  TControle = class

    private

      FConexao  : TConexaoBanco;
      FSQL : TSQLQuery;

    public

     constructor Create;
     destructor  Destroy; override;
     property SQL : TSQLQuery read FSQL write FSQL;

  end;

implementation

constructor TControle.Create;

begin

   FConexao  := TConexaoBanco.Create;
   FSQL := TSQLQuery.Create(Application);
   FSQL.SQLConnection := FConexao.ConexaoBanco;

end;

destructor TControle.Destroy;

  begin
    inherited;
  end;

end.
