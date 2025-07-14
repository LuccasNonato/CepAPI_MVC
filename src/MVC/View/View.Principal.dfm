object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 267
    Width = 21
    Height = 15
    Caption = 'Cep'
  end
  object Label2: TLabel
    Left = 88
    Top = 315
    Width = 18
    Height = 15
    Caption = 'Api'
  end
  object Button1: TButton
    Left = 256
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MemoResultado: TMemo
    Left = 88
    Top = 48
    Width = 425
    Height = 193
    TabOrder = 1
  end
  object cxEditCep: TEdit
    Left = 136
    Top = 264
    Width = 185
    Height = 23
    TabOrder = 2
  end
  object cxSelecionaApi: TComboBox
    Left = 136
    Top = 312
    Width = 145
    Height = 23
    ItemIndex = 0
    TabOrder = 3
    Text = 'Todos'
    Items.Strings = (
      'Todos'
      'Awesome'
      'ApiCep'
      'ViaCep')
  end
end
