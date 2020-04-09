object Form9: TForm9
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form9'
  ClientHeight = 241
  ClientWidth = 252
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 82
    Width = 94
    Height = 13
    Caption = '2.  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091
  end
  object Label2: TLabel
    Left = 24
    Top = 24
    Width = 178
    Height = 13
    Caption = '1.  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
  end
  object Label6: TLabel
    Left = 24
    Top = 144
    Width = 99
    Height = 13
    Caption = '3.  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1088#1077#1084#1103
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 40
    Top = 163
    Width = 186
    Height = 21
    Enabled = False
    KeyField = 'id_t'
    ListField = 'time_t'
    ListSource = DM.dsTimes
    TabOrder = 0
    OnClick = DBLookupComboBox2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 101
    Width = 186
    Height = 21
    Date = 41984.584711956020000000
    Time = 41984.584711956020000000
    Enabled = False
    TabOrder = 1
    OnChange = DateTimePicker1Change
  end
  object DBEdit1: TDBEdit
    Left = 192
    Top = 128
    Width = 34
    Height = 21
    DataField = 'id_d'
    DataSource = DM.dsPlaybill
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 42
    Top = 208
    Width = 89
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 151
    Top = 208
    Width = 75
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object DBEdit2: TDBEdit
    Left = 154
    Top = 128
    Width = 32
    Height = 21
    DataField = 'date_d'
    DataSource = DM.dsDates
    TabOrder = 5
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 40
    Top = 43
    Width = 186
    Height = 21
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
    ListSource = DM.dsPerformances
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnClick = DBLookupComboBox1Click
  end
end
