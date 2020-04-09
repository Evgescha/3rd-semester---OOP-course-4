object Form6: TForm6
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form6'
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 496
    Top = 207
    Width = 47
    Height = 22
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Flat = True
    Visible = False
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 209
    Top = 199
    Width = 334
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1077#1088#1086#1074', '#1087#1088#1080#1085#1080#1084#1072#1102#1097#1080#1093' '#1091#1095#1072#1089#1090#1080#1077' '#1074' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1077
    Visible = False
  end
  object Label2: TLabel
    Left = 401
    Top = 87
    Width = 144
    Height = 13
    Caption = '________________________'
  end
  object Label3: TLabel
    Left = 16
    Top = 199
    Width = 109
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1073#1080#1083#1077#1090#1072'  '#8212
    Visible = False
  end
  object Label4: TLabel
    Left = 131
    Top = 199
    Width = 3
    Height = 13
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 32
    Width = 369
    Height = 153
    BorderStyle = bsNone
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'date_d'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'time_t'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title_p'
        Width = 220
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 226
    Width = 529
    Height = 95
    BorderStyle = bsNone
    DataSource = DM.dsRoles
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = #1060#1072#1084#1080#1083#1080#1103
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1048#1084#1103
        Width = 245
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 468
    Top = 327
    Width = 75
    Height = 16
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 401
    Top = 139
    Width = 96
    Height = 17
    Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085'/'#1087
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 470
    Top = 168
    Width = 73
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button3Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 401
    Top = 112
    Width = 142
    Height = 21
    KeyField = 'id_p'
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
    ListSource = DM.dsPerformances
    TabOrder = 5
    OnClick = DBLookupComboBox1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 401
    Top = 40
    Width = 142
    Height = 21
    Date = 41982.956989421300000000
    Time = 41982.956989421300000000
    DateFormat = dfLong
    TabOrder = 6
    OnClick = DateTimePicker1Click
  end
  object Button4: TButton
    Left = 401
    Top = 64
    Width = 96
    Height = 17
    Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1076#1072#1090#1077
    Enabled = False
    TabOrder = 7
    OnClick = Button4Click
  end
end
