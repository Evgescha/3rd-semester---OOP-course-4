object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form3'
  ClientHeight = 297
  ClientWidth = 409
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
    Top = 21
    Width = 171
    Height = 13
    Caption = '1.  '#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
  end
  object Label2: TLabel
    Left = 24
    Top = 79
    Width = 305
    Height = 13
    Caption = '2.  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1082#1090#1077#1088#1086#1074', '#1087#1088#1080#1085#1080#1084#1072#1102#1097#1080#1093' '#1091#1095#1072#1089#1090#1080#1077' '#1074' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1077
  end
  object Label3: TLabel
    Left = 24
    Top = 224
    Width = 159
    Height = 13
    Caption = '3.  '#1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1073#1080#1083#1077#1090#1086#1074
  end
  object SpeedButton3: TSpeedButton
    Left = 194
    Top = 122
    Width = 37
    Height = 22
    Caption = '>'
    Enabled = False
    Flat = True
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 194
    Top = 150
    Width = 37
    Height = 22
    Caption = '<'
    Enabled = False
    Flat = True
    OnClick = SpeedButton4Click
  end
  object Label4: TLabel
    Left = 375
    Top = 224
    Width = 6
    Height = 13
    Caption = #8364
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 40
    Top = 98
    Width = 148
    Height = 108
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'id_act'
    ListField = #1060#1072#1084#1080#1083#1080#1103
    ListSource = DM.dsActors
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = DBLookupListBox1Click
    OnDblClick = DBLookupListBox1DblClick
  end
  object DBLookupListBox2: TDBLookupListBox
    Left = 237
    Top = 98
    Width = 148
    Height = 108
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Ctl3D = True
    KeyField = 'id_r'
    ListField = #1060#1072#1084#1080#1083#1080#1103
    ListSource = DM.dsRoles
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = DBLookupListBox2Click
    OnDblClick = DBLookupListBox2DblClick
  end
  object DBMemo1: TDBMemo
    Left = 237
    Top = 18
    Width = 148
    Height = 37
    DataField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
    DataSource = DM.dsPerformances
    MaxLength = 40
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 304
    Top = 221
    Width = 65
    Height = 21
    DataField = 'price_p'
    DataSource = DM.dsPerformances
    MaxLength = 3
    TabOrder = 3
    OnKeyPress = DBEdit1KeyPress
  end
  object Button1: TButton
    Left = 312
    Top = 264
    Width = 73
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 264
    Width = 75
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = Button2Click
  end
end
