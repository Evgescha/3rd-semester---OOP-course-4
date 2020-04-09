unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Buttons, StdCtrls, Mask,
  DBCtrls, ComCtrls, Unit5;

type
  TForm8 = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    seatBusy: Array [0..23] of Integer;
    { Public declarations }
  end;

var
  Form8: TForm8;
  pbID: String;

implementation

uses
  DataModule, Unit7;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
var
  count: Integer;
begin

  DM.dataSetTicket.Post;





  with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('SELECT id_p, count_p FROM Performances WHERE id_p='+VarToStr(DBLookupComboBox1.KeyValue));
      Active:=True;
      count:=Fields[1].AsInteger;
    end;
  with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('UPDATE Performances SET count_p='+IntToStr(count+1)+' WHERE id_p='+VarToStr(DBLookupComboBox1.KeyValue));
      ExecSQL;
    end;

  Close;
  Form7.Show;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  DM.dataSetTicket.Cancel;
  DM.dataSetDates.Filtered:=False;
  DM.dataSetTimes.Filtered:=False;
  Close;
  Form7.Show;
end;

procedure TForm8.DBLookupComboBox1Click(Sender: TObject);
var
  dFilter, dFilt, andd: String;
  i: Integer;
  f: Boolean;
  prev: Array [0..49] of Integer;
begin
  DBLookupComboBox3.KeyValue:=null;
  DBLookupComboBox2.KeyValue:=null;
  DBEdit1.Text:='';
  DBEdit2.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';
  DBLookupComboBox3.Enabled:=True;
  DBLookupComboBox2.Enabled:=False;
  SpeedButton1.Enabled:=False;
  Button1.Enabled:=False;

  f:=False;

  DM.dataSetDates.Filtered:=False;
  dFilter:='';

  with FormatSettings do
  begin
    DateSeparator:='/';
    ShortDateFormat:='mm/dd/yyyy';
  end;

  for i:= 0 to 49 do
    prev[i]:=0;

  i:=0;

  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT id_d, date_d FROM Dates WHERE date_d<=#'+DateToStr(now)+'#');
    Active:=True;
    while not Eof do
    begin
      prev[i]:=Fields[0].AsInteger;
      Inc(i);
      next;
    end;
    end;

  with FormatSettings do
    begin
      DateSeparator:='.';
      ShortDateFormat:='dd/mm/yyyy';
    end;

  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT id_p, id_d FROM Playbill WHERE id_p='+VarToStr(DBLookupComboBox1.KeyValue));
    Active:=True;
    while not Eof do
    begin
      for i:= 0 to 49 do
        if Fields[1].AsInteger=prev[i] then
          f:=True;
      if f=False then
      begin
          dFilt:='id_d='+Fields[1].AsString;
          if Length(dFilter)>0 then
            andd:=' or '
          else
            andd:='';
          dFilter:=dFilter+andd+dFilt;
      end;
      f:=False;
      next;
    end;
  end;
  DM.dataSetDates.Filter:=dFilter;
  DM.dataSetDates.Filtered:=True;
  DM.dataSetDates.Sort:='date_d ASC';
end;

procedure TForm8.DBLookupComboBox3Click(Sender: TObject);
var
  tFilter, tFilt, andd: String;
begin
  DBLookupComboBox2.KeyValue:=null;
  DBEdit1.Text:='';
  DBEdit2.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';

  DBLookupComboBox2.Enabled:=True;
  SpeedButton1.Enabled:=False;
  Button1.Enabled:=False;

  DM.dataSetTimes.Filtered:=False;
  tFilter:='';

  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT id_p, id_d, id_t FROM Playbill WHERE id_p='+
                                VarToStr(DBLookupComboBox1.KeyValue)+' and id_d='+
                                VarToStr(DBLookupComboBox3.KeyValue));
    Active:=True;
    while not Eof do
      begin
      tFilt:='id_t='+Fields[2].AsString;
      if Length(tFilter)>0 then
        andd:=' or '
      else
        andd:='';
      tFilter:=tFilter+andd+tFilt;
      next;
    end;
  end;
  DM.dataSetTimes.Filter:=tFilter;
  DM.dataSetTimes.Filtered:=True;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DBLookupComboBox1.KeyValue:=null;
  DBLookupComboBox3.KeyValue:=null;
  DBLookupComboBox2.KeyValue:=null;
  DBEdit1.Text:='';
  DBEdit2.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';
  DBLookupComboBox3.Enabled:=False;
  DBLookupComboBox2.Enabled:=False;
  SpeedButton1.Enabled:=False;
  Button1.Enabled:=False;
  DM.dataSetDates.Filtered:=False;
  DM.dataSetTimes.Filtered:=False;
end;

procedure TForm8.DBLookupComboBox2Click(Sender: TObject);
begin
  DBEdit1.Text:='';
  DBEdit2.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';

  SpeedButton1.Enabled:=True;
  Button1.Enabled:=False;
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
var
  i, j, k: Integer;
begin
  DBEdit1.Text:='';
  DBEdit2.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';

  DM.dataSetPlaybill.Last;
  k:=DM.dataSetPlaybill.FieldByName('id_pb').AsInteger;
  for i:= 1 to k do
  begin
    if DM.dataSetPlaybill.Locate('id_pb;id_p;id_d;id_t', VarArrayOf([i,
      VarToStr(DBLookupComboBox1.KeyValue), VarToStr(DBLookupComboBox3.KeyValue),
                                  VarToStr(DBLookupComboBox2.KeyValue)]),[]) then
      pbID:=IntToStr(i);
  end;
  DBEdit1.Text:=pbID;

  for k:= 0 to 23 do
    seatBusy[k]:=0;
  k:=0;

  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT id_pb, id_s FROM Tickets WHERE id_pb='+pbID);
    Active:=True;
    while not Eof do
    begin
      seatBusy[k]:=Fields[1].AsInteger;
      Inc(k);
      next;
    end;
  end;

  Hide;
  Form5.Show;

  for j:= 0 to 2 do
    for i:= 0 to 7 do
      TSeat.create(i*40+10,j*40+10,(i+1)*40,(j+1)*40);

  Button1.Enabled:=True;
end;

end.
