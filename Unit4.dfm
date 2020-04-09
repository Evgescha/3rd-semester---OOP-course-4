object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form4'
  ClientHeight = 145
  ClientWidth = 297
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 93
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 64
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103
  end
  object DBEdit1: TDBEdit
    Left = 136
    Top = 21
    Width = 137
    Height = 21
    DataField = #1060#1072#1084#1080#1083#1080#1103
    DataSource = DM.dsActors
    MaxLength = 20
    TabOrder = 0
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 136
    Top = 61
    Width = 137
    Height = 21
    DataField = #1048#1084#1103
    DataSource = DM.dsActors
    MaxLength = 20
    TabOrder = 1
    OnKeyPress = DBEdit2KeyPress
  end
  object Button1: TButton
    Left = 65
    Top = 103
    Width = 89
    Height = 18
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 103
    Width = 75
    Height = 18
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
end
