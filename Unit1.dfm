object Form1: TForm1
  Left = 310
  Top = 177
  Width = 1044
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=MyDriver;SERVER=localhost;UID=root;DATABASE=u_net;PORT=3' +
      '306"'
    LoginPrompt = False
    Left = 440
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 496
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from student;')
    Left = 576
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 8
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      object N5: TMenuItem
        Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1055#1088#1077#1076#1084#1077#1090
        OnClick = N7Click
      end
    end
    object N2: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N8: TMenuItem
        Caption = #1057#1087#1080#1089#1082#1080' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      end
    end
    object N3: TMenuItem
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1082#1086#1084#1087#1083#1077#1082#1089
      object N10: TMenuItem
        Caption = #1042#1077#1076#1077#1084#1086#1089#1090#1080
      end
      object N11: TMenuItem
        Caption = #1057#1074#1086#1076#1082#1072' '#1087#1086' '#1089#1077#1089#1089#1080#1080
      end
    end
    object N4: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N12: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      end
    end
  end
end
