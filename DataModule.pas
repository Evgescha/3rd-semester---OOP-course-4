unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con: TADOConnection;
    dsPerformances: TDataSource;
    dsActors: TDataSource;
    dataSetPerformances: TADODataSet;
    dataSetActors: TADODataSet;
    dataSetRoles: TADODataSet;
    dsRoles: TDataSource;
    dataSetActorsid_act: TAutoIncField;
    dataSetActors�������: TWideStringField;
    dataSetActors���: TWideStringField;
    dataSetRolesid_r: TAutoIncField;
    dataSetRolesid_act: TIntegerField;
    dataSetRolesid_p: TIntegerField;
    dataSetRoles�������: TStringField;
    ADOQuery1: TADOQuery;
    dataSetRoles���: TStringField;
    dataSetPlaybill: TADODataSet;
    dsPlaybill: TDataSource;
    dataSetDates: TADODataSet;
    dataSetTimes: TADODataSet;
    dataSetPlaybill����: TDateTimeField;
    dataSetPlaybillid_pb: TAutoIncField;
    dataSetPlaybillid_d: TIntegerField;
    dataSetPlaybillid_t: TIntegerField;
    dataSetPlaybillid_p: TIntegerField;
    dataSetPlaybill�����: TStringField;
    dataSetPlaybill������������������: TStringField;
    dataSetTicket: TADODataSet;
    dsTicket: TDataSource;
    dsTimes: TDataSource;
    dsDates: TDataSource;
    dataSetSeats: TADODataSet;
    dsSeats: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    ADODataSet1: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
