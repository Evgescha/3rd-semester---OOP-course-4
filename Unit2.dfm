object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form2'
  ClientHeight = 351
  ClientWidth = 559
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 16
    Top = 311
    Width = 153
    Height = 22
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 183
    Top = 311
    Width = 193
    Height = 22
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 382
    Top = 311
    Width = 160
    Height = 22
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
    Flat = True
    OnClick = SpeedButton3Click
  end
  object Label1: TLabel
    Left = 335
    Top = 16
    Width = 151
    Height = 13
    Caption = #1042#1099' '#1074#1086#1096#1083#1080' '#1082#1072#1082' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
  end
  object SpeedButton4: TSpeedButton
    Left = 503
    Top = 16
    Width = 39
    Height = 13
    Caption = #1042#1099#1081#1090#1080
    Flat = True
    OnClick = SpeedButton4Click
  end
  object Button2: TButton
    Left = 112
    Top = 89
    Width = 73
    Height = 25
    Caption = #1058#1088#1091#1087#1087#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 16
    Top = 89
    Width = 90
    Height = 25
    Caption = #1056#1077#1087#1077#1088#1090#1091#1072#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 120
    Width = 527
    Height = 177
    DataSource = DM.dsPerformances
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
        Width = 506
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 56
    Top = 120
    Width = 527
    Height = 177
    DataSource = DM.dsActors
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    OnTitleClick = DBGrid2TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = #1060#1072#1084#1080#1083#1080#1103
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1048#1084#1103
        Width = 252
        Visible = True
      end>
  end
  object Button3: TButton
    Left = 405
    Top = 89
    Width = 137
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1072#1092#1080#1096#1091
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 256
    Top = 89
    Width = 143
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1072#1092#1080#1096#1091
    TabOrder = 2
    OnClick = Button4Click
  end
end
