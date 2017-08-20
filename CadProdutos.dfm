object FormCadProdutos: TFormCadProdutos
  Left = 192
  Top = 124
  Width = 416
  Height = 439
  Caption = 'Cadastro de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 36
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label2: TLabel
    Left = 112
    Top = 16
    Width = 43
    Height = 13
    Caption = 'Unidade:'
  end
  object Label3: TLabel
    Left = 200
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Valor:'
  end
  object Label4: TLabel
    Left = 16
    Top = 64
    Width = 51
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 32
    Width = 81
    Height = 21
    TabOrder = 0
  end
  object edtValor: TEdit
    Left = 200
    Top = 32
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 80
    Width = 369
    Height = 21
    TabOrder = 2
  end
  object cmbUnidade: TComboBox
    Left = 112
    Top = 32
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'P'#231
      'Kg'
      'Metro'
      'M2')
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 128
    Width = 369
    Height = 201
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object btnNovo: TButton
    Left = 16
    Top = 352
    Width = 80
    Height = 25
    Caption = 'Novo'
    TabOrder = 5
    OnClick = btnNovoClick
  end
  object btnEditar: TButton
    Left = 112
    Top = 352
    Width = 80
    Height = 25
    Caption = 'Editar'
    TabOrder = 6
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 208
    Top = 352
    Width = 80
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  object btnSalvar: TButton
    Left = 304
    Top = 352
    Width = 80
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btnSalvarClick
  end
end
