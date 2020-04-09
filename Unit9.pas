unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls,
  ComCtrls;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  count: Integer;
  dID: String;
  prevDate: TDateTime;

implementation

uses
  DataModule, Unit2;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  DM.dataSetPlaybill.edit;
  DM.dataSetPlaybill.Post;
  Form2.Show;
  Close;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  if count<>3 then
    DM.dataSetPlaybill.Cancel;
  Form2.Show;
  Close;
end;

procedure TForm9.DBLookupComboBox1Click(Sender: TObject);
begin
  DateTimePicker1.Enabled:=True;
  DBLookupComboBox2.Enabled:=False;
  Button1.Enabled:=True;
  DateTimePicker1.Date:=now;
  DBLookupComboBox2.KeyValue:=null;
  DBEdit2.Text:='';
  DBEdit1.Text:='';
end;

procedure TForm9.DateTimePicker1Change(Sender: TObject);
var
  located: Boolean;
  i, n: Integer;
  tfilt, tFilter, andd: String;
begin

  if DateTimePicker1.Date<=now then
  begin
    DBLookupComboBox2.Enabled:=False;
    Button1.Enabled:=True;
    DBLookupComboBox2.KeyValue:=null;
    MessageDlg('Выберите другую дату.', mtError, [mbOK], 0);
  end
  else begin

  if DateTimePicker1.Date=prevDate then
  begin

  with FormatSettings do
  begin
    DateSeparator:='/';
    ShortDateFormat:='mm/dd/yyyy';
  end;

  DM.dataSetDates.Last;
  n:=DM.dataSetDates.FieldByName('id_d').AsInteger;
  for i:= 1 to n do
  begin
    if DM.dataSetDates.Locate('id_d;date_d', VarArrayOf([i, DateToStr(DateTimePicker1.Date)]),[]) then
    begin
      dID:=IntToStr(i);
      DBEdit1.Text:=dID;
      located:=True;
    end;
  end;

  count:=0;

  DM.dataSetTimes.Filtered:=False;
  if located then
  begin
    with FormatSettings do
    begin
      DateSeparator:='.';
      ShortDateFormat:='dd/mm/yyyy';
    end;
    begin
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT id_d, id_t FROM Playbill WHERE id_d='+dID);
        Active:=True;
        while not Eof do
        begin
          Inc(count);
          tfilt:='id_t<>'+Fields[1].AsString;
          if Length(tFilter)>0 then
            andd:=' and '
          else
            andd:='';
          tFilter:=tFilter+andd+tFilt;
          next;
        end;
      end;
      DM.dataSetTimes.Filter:=tFilter;
      DM.dataSetTimes.Filtered:=True;
    end;
  end
  else  begin
    with FormatSettings do
    begin
      DateSeparator:='.';
      ShortDateFormat:='dd/mm/yyyy';
    end;
    DM.dataSetDates.Insert;
    DBEdit2.Text:=DateToStr(DateTimePicker1.Date);
    DM.dataSetDates.Post;
    DBEdit1.Text:=DM.dataSetDates.FieldByName('id_d').AsString;
  end;

  if count=3 then
  begin
    DBLookupComboBox2.Enabled:=False;
    MessageDlg('Выберите другую дату.', mtError, [mbOK], 0);
    //ShowMessage('Зал занят, выберите другую дату.');
  end else
    DBLookupComboBox2.Enabled:=True;
  Button1.Enabled:=True;
  DBLookupComboBox2.KeyValue:=null;

  end;
  end;

  prevDate:=DateTimePicker1.Date;

end;

procedure TForm9.DBLookupComboBox2Click(Sender: TObject);
begin
  Button1.Enabled:=True;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DateTimePicker1.Enabled:=False;
  DBLookupComboBox2.Enabled:=False;
  Button1.Enabled:=True;
  DBEdit2.Text:='';
  DBEdit1.Text:='';
  DM.dataSetTimes.Filtered:=False;
end;

procedure TForm9.FormShow(Sender: TObject);
begin

  DM.dataSetPlaybill.Insert;

  DateTimePicker1.Date:=now;
  DateTimePicker1.Time:=0;
end;

end.
