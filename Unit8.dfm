object Form8: TForm8
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form8'
  ClientHeight = 323
  ClientWidth = 307
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 234
    Top = 224
    Width = 47
    Height = 21
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Enabled = False
    Flat = True
    OnClick = SpeedButton1Click
  end
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
  object Label3: TLabel
    Left = 24
    Top = 208
    Width = 98
    Height = 13
    Caption = '4.  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1089#1090#1086
  end
  object Label4: TLabel
    Left = 40
    Top = 227
    Width = 41
    Height = 13
    Caption = #8470' '#1088#1103#1076#1072
  end
  object Label5: TLabel
    Left = 128
    Top = 227
    Width = 45
    Height = 13
    Caption = #8470' '#1084#1077#1089#1090#1072
  end
  object Label6: TLabel
    Left = 24
    Top = 144
    Width = 99
    Height = 13
    Caption = '3.  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1088#1077#1084#1103
  end
  object Button1: TButton
    Left = 48
    Top = 288
    Width = 72
    Height = 17
    Caption = #1047#1072#1082#1072#1079#1072#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 126
    Top = 288
    Width = 76
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
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
    TabOrder = 1
    OnClick = DBLookupComboBox2Click
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 40
    Top = 101
    Width = 186
    Height = 21
    Enabled = False
    KeyField = 'id_d'
    ListField = 'date_d'
    ListSource = DM.dsDates
    TabOrder = 0
    OnClick = DBLookupComboBox3Click
  end
  object Edit1: TEdit
    Left = 87
    Top = 224
    Width = 25
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 179
    Top = 224
    Width = 25
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit1: TDBEdit
    Left = 234
    Top = 163
    Width = 47
    Height = 21
    DataField = 'id_pb'
    DataSource = DM.dsTicket
    TabOrder = 6
    Visible = False
  end
  object DBEdit2: TDBEdit
    Left = 234
    Top = 251
    Width = 47
    Height = 21
    DataField = 'id_s'
    DataSource = DM.dsTicket
    TabOrder = 7
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
    KeyField = 'id_p'
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
    ListSource = DM.DataSource3
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    OnClick = DBLookupComboBox1Click
  end
end
