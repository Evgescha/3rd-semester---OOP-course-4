object DM: TDM
  OldCreateOrder = False
  Height = 370
  Width = 405
  object con: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Theater.mdb;Persist' +
      ' Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 16
  end
  object dsPerformances: TDataSource
    DataSet = dataSetPerformances
    Left = 152
    Top = 72
  end
  object dsActors: TDataSource
    DataSet = dataSetActors
    Left = 152
    Top = 128
  end
  object dataSetPerformances: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 
      'select id_p, title_p as ['#1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080'], price_p, count_p ' +
      'from Performances'
    DataSource = dsTicket
    Parameters = <
      item
        Name = 'count_p'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Left = 48
    Top = 72
  end
  object dataSetActors: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 
      'select id_act, surname_act as ['#1060#1072#1084#1080#1083#1080#1103'], name_act as ['#1048#1084#1103'] from ' +
      'Actors'
    DataSource = dsRoles
    Parameters = <>
    Left = 48
    Top = 128
    object dataSetActorsid_act: TAutoIncField
      FieldName = 'id_act'
      ReadOnly = True
    end
    object dataSetActorsФамилия: TWideStringField
      FieldName = #1060#1072#1084#1080#1083#1080#1103
      Size = 255
    end
    object dataSetActorsИмя: TWideStringField
      FieldName = #1048#1084#1103
      Size = 255
    end
  end
  object dataSetRoles: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 'select id_r, id_act, id_p from Roles'
    DataSource = DataSource3
    Parameters = <>
    Left = 280
    Top = 128
    object dataSetRolesid_r: TAutoIncField
      FieldName = 'id_r'
      ReadOnly = True
    end
    object dataSetRolesid_act: TIntegerField
      FieldName = 'id_act'
    end
    object dataSetRolesid_p: TIntegerField
      FieldName = 'id_p'
    end
    object dataSetRolesФамилия: TStringField
      FieldKind = fkLookup
      FieldName = #1060#1072#1084#1080#1083#1080#1103
      LookupDataSet = dataSetActors
      LookupKeyFields = 'id_act'
      LookupResultField = #1060#1072#1084#1080#1083#1080#1103
      KeyFields = 'id_act'
      Lookup = True
    end
    object dataSetRolesИмя: TStringField
      FieldKind = fkLookup
      FieldName = #1048#1084#1103
      LookupDataSet = dataSetActors
      LookupKeyFields = 'id_act'
      LookupResultField = #1048#1084#1103
      KeyFields = 'id_act'
      Lookup = True
    end
  end
  object dsRoles: TDataSource
    DataSet = dataSetRoles
    Left = 352
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = con
    Parameters = <>
    Left = 48
    Top = 184
  end
  object dataSetPlaybill: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 'select id_pb, id_d, id_t, id_p from Playbill'
    DataSource = dsPerformances
    Parameters = <>
    Left = 280
    Top = 184
    object dataSetPlaybillid_pb: TAutoIncField
      FieldName = 'id_pb'
      ReadOnly = True
    end
    object dataSetPlaybillid_d: TIntegerField
      FieldName = 'id_d'
    end
    object dataSetPlaybillid_t: TIntegerField
      FieldName = 'id_t'
    end
    object dataSetPlaybillid_p: TIntegerField
      FieldName = 'id_p'
    end
    object dataSetPlaybillДата: TDateTimeField
      FieldKind = fkLookup
      FieldName = #1044#1072#1090#1072
      LookupDataSet = dataSetDates
      LookupKeyFields = 'id_d'
      LookupResultField = 'date_d'
      KeyFields = 'id_d'
      Lookup = True
    end
    object dataSetPlaybillВремя: TStringField
      FieldKind = fkLookup
      FieldName = #1042#1088#1077#1084#1103
      LookupDataSet = dataSetTimes
      LookupKeyFields = 'id_t'
      LookupResultField = 'time_t'
      KeyFields = 'id_t'
      Lookup = True
    end
    object dataSetPlaybillНазваниепостановки: TStringField
      FieldKind = fkLookup
      FieldName = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
      LookupDataSet = dataSetPerformances
      LookupKeyFields = 'id_p'
      LookupResultField = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
      KeyFields = 'id_p'
      Size = 225
      Lookup = True
    end
  end
  object dsPlaybill: TDataSource
    DataSet = dataSetPlaybill
    Left = 352
    Top = 184
  end
  object dataSetDates: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 'select id_d, date_d from Dates'
    DataSource = dsPlaybill
    Parameters = <>
    Left = 48
    Top = 256
  end
  object dataSetTimes: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 'select id_t, time_t from Times'
    DataSource = dsDates
    Parameters = <>
    Left = 48
    Top = 304
  end
  object dataSetTicket: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 'select id_tick, id_pb, id_s from Tickets'
    Parameters = <>
    Left = 248
    Top = 256
  end
  object dsTicket: TDataSource
    DataSet = dataSetTicket
    Left = 320
    Top = 264
  end
  object dsTimes: TDataSource
    DataSet = dataSetTimes
    Left = 112
    Top = 304
  end
  object dsDates: TDataSource
    DataSet = dataSetDates
    Left = 112
    Top = 256
  end
  object dataSetSeats: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 'select id_s, row_s, seat_s from Seats'
    Parameters = <>
    Left = 248
    Top = 320
  end
  object dsSeats: TDataSource
    DataSet = dataSetSeats
    Left = 320
    Top = 320
  end
  object ADOQuery2: TADOQuery
    Connection = con
    CursorType = ctStatic
    DataSource = dsPlaybill
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Playbill.id_pb, Playbill.id_p, Playbill.id_d, Playbill.id' +
        '_t, Performances.id_p, Performances.title_p, Dates.id_d, Dates.d' +
        'ate_d, Times.id_t, Times.time_t FROM Playbill, Performances, Dat' +
        'es, Times WHERE Performances.id_p=Playbill.id_p AND Dates.id_d=P' +
        'laybill.id_d AND Times.id_t=Playbill.id_t')
    Left = 264
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 336
    Top = 16
  end
  object DataSource3: TDataSource
    DataSet = ADODataSet1
    Left = 184
    Top = 8
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = con
    CursorType = ctStatic
    CommandText = 
      'select id_p, title_p as ['#1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080'], price_p, count_p ' +
      'from Performances'
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'count_p'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Left = 112
    Top = 8
  end
end
