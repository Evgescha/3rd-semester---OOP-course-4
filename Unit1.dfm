object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 138
  ClientWidth = 281
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
  object SpeedButton1: TSpeedButton
    Left = 258
    Top = 0
    Width = 23
    Height = 22
    Caption = 'x'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Button1: TButton
    Left = 56
    Top = 32
    Width = 169
    Height = 25
    Caption = #1042#1086#1081#1090#1080' '#1082#1072#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 56
    Top = 80
    Width = 169
    Height = 25
    Caption = #1042#1086#1081#1090#1080' '#1082#1072#1082' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 35
    Top = 16
    Width = 217
    Height = 105
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 14
      Top = 14
      Width = 30
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object Label2: TLabel
      Left = 14
      Top = 35
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Edit1: TEdit
      Left = 68
      Top = 11
      Width = 133
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 68
      Top = 35
      Width = 133
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 32
      Top = 76
      Width = 64
      Height = 18
      Caption = #1044#1072#1083#1077#1077
      Default = True
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 118
      Top = 76
      Width = 64
      Height = 18
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 3
      OnClick = Button4Click
    end
  end
end
