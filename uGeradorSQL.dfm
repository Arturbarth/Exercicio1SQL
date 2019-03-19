object FGeradorSQL: TFGeradorSQL
  Left = 0
  Top = 0
  Caption = 'Gerador de SQL'
  ClientHeight = 395
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 193
    Align = alTop
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 472
      Top = 32
      Width = 185
      Height = 105
      Caption = 'Condi'#231#227'o'
      TabOrder = 0
      object mmCondicao: TMemo
        Left = 2
        Top = 15
        Width = 181
        Height = 88
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 16
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
    object GroupBox2: TGroupBox
      Left = 255
      Top = 32
      Width = 185
      Height = 105
      Caption = 'Tabela'
      TabOrder = 1
      object mmTabela: TMemo
        Left = 2
        Top = 15
        Width = 181
        Height = 88
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
    object GroupBox1: TGroupBox
      Left = 40
      Top = 32
      Width = 185
      Height = 105
      Caption = 'Coluna'
      TabOrder = 2
      object mmColuna: TMemo
        Left = 2
        Top = 15
        Width = 181
        Height = 88
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 1
      end
    end
    object btnGerarSQL: TButton
      Left = 248
      Top = 143
      Width = 190
      Height = 41
      Caption = 'Gerar SQL'
      TabOrder = 3
      OnClick = btnGerarSQLClick
    end
  end
  object gbxSQLGerado: TGroupBox
    Left = 0
    Top = 193
    Width = 718
    Height = 202
    Align = alClient
    Caption = 'SQL:'
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitTop = 272
    ExplicitWidth = 185
    ExplicitHeight = 105
    object mmSQL: TMemo
      Left = 2
      Top = 15
      Width = 714
      Height = 185
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 3
    end
  end
end
