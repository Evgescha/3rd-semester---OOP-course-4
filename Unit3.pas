unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls,
  Buttons;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    DBLookupListBox1: TDBLookupListBox;
    DBLookupListBox2: TDBLookupListBox;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupListBox1DblClick(Sender: TObject);
    procedure DBLookupListBox2DblClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure DBLookupListBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  j,k: Integer;
  addAct: Array [0..23] of Integer;
  delAct: Array [0..23] of Integer;

implementation

uses
  DataModule, Unit2;

procedure FiltActors();
var
  filt, andd, filtAct: String;
begin

  DM.dataSetActors.Filtered:=False;
  filtAct:='';
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT id_p, id_act FROM Roles WHERE id_p='+  DM.dataSetPerformances.FieldByName('id_p').AsString);
    Active:=True;

    while not Eof do
    begin
      filt:='id_act<>'+Fields[1].AsString;
      if Length(filtAct)>0 then
        andd:=' and '
      else
        andd:='';
      filtAct:=filtAct+andd+filt;
      next;
    end;
  end;
  DM.dataSetActors.Filter:=filtAct;
  DM.dataSetActors.Filtered:=false;
end;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  i,n,actIs: Integer;
begin

  actIs:=0;

  DM.dataSetRoles.Last;
  n:=DM.dataSetRoles.FieldByName('id_r').AsInteger;
  for i:= 1 to n do
  begin
    if DM.dataSetRoles.Locate('id_r;id_p', VarArrayOf([i,
                    DM.dataSetPerformances.FieldByName('id_p').AsString]),[]) then
      Inc(actIs);
  end;

  if (DBMemo1.Text='') or (actIs=0) or (DBEdit1.Text='') then
    MessageDlg('¬ведены не все данные.', mtError, [mbOK], 0)
  else begin
    DM.dataSetPerformances.Edit;
    DM.dataSetPerformances.Post;
    Form2.Show;
    Close;
  end;
  Ins:=False;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  i,n: Integer;
begin
  j:=0;
  k:=0;
  DM.dataSetPerformances.Cancel;
   while (delAct[k]<>0) do
  begin
    DM.dataSetRoles.Insert;
    DM.dataSetRoles.FieldByName('id_act').AsInteger:=delAct[k];
    DM.dataSetRoles.FieldByName('id_p').AsInteger:=DM.dataSetPerformances.FieldByName('id_p').AsInteger;
    DM.dataSetRoles.Post;
    Inc(k);
  end;
  while (addAct[j]<>0) do
  begin
    DM.dataSetRoles.Locate('id_p;id_act',
      VarArrayOf([DM.dataSetPerformances.FieldByName('id_p').AsString,addAct[j]]),[]);
    DM.dataSetRoles.Delete;
    Inc(j);
  end;

  if Ins then
  begin
    DM.dataSetPerformances.Delete;
    Ins:=False;
  end;
  Form2.Show;
  Close;
end;

procedure TForm3.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', #8]) then
  begin
    key:=#0;
  end;
end;

procedure TForm3.DBLookupListBox1Click(Sender: TObject);
begin
  SpeedButton3.Enabled:=True;
  SpeedButton4.Enabled:=False;
end;

procedure TForm3.DBLookupListBox1DblClick(Sender: TObject);
begin
  SpeedButton3Click(self);
end;

procedure TForm3.DBLookupListBox2Click(Sender: TObject);
begin
  SpeedButton3.Enabled:=False;
  SpeedButton4.Enabled:=True;
end;

procedure TForm3.DBLookupListBox2DblClick(Sender: TObject);
begin
  SpeedButton4Click(self);
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.dataSetActors.Filtered:=False;
  DM.dataSetRoles.Filtered:=False;
end;

procedure TForm3.FormShow(Sender: TObject);
begin


  DM.dataSetRoles.Filtered:=False;
  DM.dataSetRoles.Filter:='id_p='+
                  IntToStr(DM.dataSetPerformances.FieldByName('id_p').AsInteger);
  DM.dataSetRoles.Filtered:=True;

  FiltActors;

  for j:= 0 to 23 do
    addAct[j]:=0;
  for k:= 0 to 23 do
    delAct[k]:=0;
  j:=0;
  k:=0;

end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
var
  a: Integer;
  fa: Boolean;
begin

  if DBLookupListBox1.KeyValue<>null then
  begin

  with DM.dataSetRoles do
  begin
    Insert;
    FieldByName('id_act').AsInteger:=StrToInt(VarToStr(DBLookupListBox1.KeyValue));
    FieldByName('id_p').AsInteger:=DM.dataSetPerformances.FieldByName('id_p').AsInteger;
    Post;
  end;
  FiltActors;

  for a:= 0 to 23 do
    if addAct[a]=StrToInt(VarToStr(DBLookupListBox1.KeyValue)) then
      fa:=True;
  if fa=False then
  begin
    addAct[j]:=StrToInt(VarToStr(DBLookupListBox1.KeyValue));
    Inc(j);
  end;
  //DBLookupListBox1.KeyValue:=null;

  end;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
var
  a: Integer;
  fa: Boolean;
begin

  if DBLookupListBox2.KeyValue<>null then
  begin

  if DM.dataSetRoles.Locate('id_r',DBLookupListBox2.KeyValue,[]) then
  begin
    for a:= 0 to 23 do
      if delAct[a]=DM.dataSetRoles.FieldByName('id_act').AsInteger then
        fa:=True;
   if fa=False then
    begin
     delAct[k]:=DM.dataSetRoles.FieldByName('id_act').AsInteger;
      Inc(k);
    end;
  end;

  with DM.dataSetRoles do
  begin
    Locate('id_p;id_act',VarArrayOf([DM.dataSetPerformances.FieldByName('id_p').AsString,
                              StrToInt(VarToStr(DBLookupListBox2.KeyValue))]),[]);
    Delete;
  end;

  FiltActors;

  DBLookupListBox2.KeyValue:=null;
  end;
end;

end.
