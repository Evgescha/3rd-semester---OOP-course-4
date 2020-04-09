unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Grids, DBGrids, ExtCtrls,
  DBLookup, ComCtrls, DBCtrls, StdCtrls,
      Buttons;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    Button4: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  querySQL: String;

implementation

uses
  DataModule, Unit2, Unit7;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  SpeedButton1Click(self);
  if Form2.fromTwo then
  begin
    Form2.Show;
    Form2.fromTwo:=False;
  end
  else
    Form7.Show;
  Close;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  SpeedButton1Click(self);
  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add(querySQL+ ' AND Playbill.id_p='+VarToStr(DBLookupComboBox1.KeyValue));
    Active:=True;
  end;
  Button4.Enabled:=False;
  DateTimePicker1.Date:=now;

end;

procedure TForm6.Button4Click(Sender: TObject);
var
  i, n, dID: Integer;
  pDate: TDateTime;
begin
  SpeedButton1Click(self);
  Button2.Enabled:=False;
  DBLookupComboBox1.KeyValue:=null;

  pDate:=DateTimePicker1.Date;

  DM.dataSetDates.Last;
  n:=DM.dataSetDates.FieldByName('id_d').AsInteger;
  for i:= 1 to n do
  begin
    if DM.dataSetDates.Locate('id_d;date_d', VarArrayOf([i, pDate]),[]) then
      dID:=i;
  end;

  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add(querySQL+ ' AND Playbill.id_d='+IntToStr(dID));
    Active:=True;
  end;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  SpeedButton1Click(self);
  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add(querySQL);
    Active:=True;
  end;
  Button4.Enabled:=False;
  Button2.Enabled:=False;
  DateTimePicker1.Date:=now;
  DBLookupComboBox1.KeyValue:=null;
end;

procedure TForm6.DBLookupComboBox1Click(Sender: TObject);
begin
  Button2.Enabled:=True;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DBLookupComboBox1.KeyValue:=null;
  Button2.Enabled:=False;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=now;
  DateTimePicker1.Time:=0;
  querySQL:='SELECT Playbill.id_pb, Playbill.id_p, Playbill.id_d, Playbill.id_t, '+
      'Performances.id_p, Performances.title_p, Dates.id_d, Dates.date_d, Times.id_t, '+
      'Times.time_t FROM Playbill, Performances, Dates, Times WHERE '+
      'Performances.id_p=Playbill.id_p AND Dates.id_d=Playbill.id_d AND '+
      'Times.id_t=Playbill.id_t';
  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add(querySQL);
    Active:=True;
  end;
  DM.ADOQuery2.Sort:='date_d, time_t ASC';
  DBGrid1.Columns[0].Title.Caption:='Дата';
  DBGrid1.Columns[1].Title.Caption:='Время';
  DBGrid1.Columns[2].Title.Caption:='Название постановки';
end;

procedure TForm6.DateTimePicker1Click(Sender: TObject);
begin
  Button4.Enabled:=True;
end;

procedure TForm6.DBGrid1DblClick(Sender: TObject);
var
  i,k,pID: Integer;
begin
  DM.dataSetPerformances.Sort:='';
  DM.dataSetPerformances.Last;
  k:=DM.dataSetPerformances.FieldByName('id_p').AsInteger;
  for i:= 1 to k do
  begin
    if DM.dataSetPerformances.Locate('id_p;Название постановки', VarArrayOf([i,
                          DM.ADOQuery2.FieldByName('title_p').AsString]),[]) then
      pID:=i;
  end;

  DM.dataSetRoles.Filtered:=False;
  DM.dataSetRoles.Filter:='id_p='+IntToStr(pID);
  DM.dataSetRoles.Filtered:=True;
  DBGrid2.Visible:=True;
  Label1.Visible:=True;
  SpeedButton1.Visible:=True;

  Label3.Visible:=True;
  Label4.Visible:=True;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT id_p, price_p FROM Performances WHERE id_p='+IntToStr(pID));
    Active:=True;
    Label4.Caption:=Fields[1].AsString+' €';
  end;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
  DBGrid2.Visible:=False;
  Label1.Visible:=False;
  SpeedButton1.Visible:=False;
  Label3.Visible:=False;
  Label4.Visible:=False;
  ;
end;
end.
