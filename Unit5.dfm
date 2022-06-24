object PrepodUpdateForm: TPrepodUpdateForm
  Left = 312
  Top = 213
  Width = 520
  Height = 202
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1081
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
    Left = 8
    Top = 0
    Width = 52
    Height = 20
    Caption = #1060'.'#1048'.'#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 489
    Height = 49
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button2: TButton
    Left = 94
    Top = 80
    Width = 297
    Height = 65
    Caption = #1048#1047#1052#1045#1053#1048#1058#1068
    TabOrder = 1
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 104
  end
end
