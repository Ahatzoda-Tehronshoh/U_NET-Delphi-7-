object PrepodForm: TPrepodForm
  Left = 592
  Top = 170
  Width = 813
  Height = 541
  Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 72
    Width = 417
    Height = 425
    DataSource = DataSource1
    FixedColor = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = #8470
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P_Name'
        Title.Caption = #1060'.'#1048'.'#1054
        Width = 312
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 464
    Top = 128
    Width = 297
    Height = 65
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 464
    Top = 208
    Width = 297
    Height = 65
    Caption = #1048#1047#1052#1045#1053#1048#1058#1068
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 464
    Top = 288
    Width = 297
    Height = 65
    Caption = #1059#1044#1040#1051#1048#1058#1068
    TabOrder = 3
    OnClick = Button3Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 0
    Width = 785
    Height = 73
    TabOrder = 4
    Visible = False
    object Label1: TLabel
      Left = 240
      Top = 0
      Width = 52
      Height = 20
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 225
      Height = 57
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      object RadioButton1: TRadioButton
        Left = 8
        Top = 16
        Width = 89
        Height = 17
        Caption = #1055#1086' '#1074#1086#1079#1088
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 120
        Top = 32
        Width = 97
        Height = 17
        Caption = #1055#1086' '#1091#1073#1099#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = RadioButton2Click
      end
    end
    object Edit1: TEdit
      Left = 240
      Top = 24
      Width = 465
      Height = 41
      AutoSize = False
      TabOrder = 1
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 712
      Top = 16
      Width = 65
      Height = 49
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      Style = bsNew
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Prepod;')
    Left = 24
    Top = 392
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 56
    Top = 392
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 512
    Top = 304
  end
end
