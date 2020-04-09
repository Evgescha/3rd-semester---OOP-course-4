unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, Grids,
  DBGrids, StdCtrls,   Buttons;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    fromTwo: Boolean;
    { Public declarations }
  end;

var
  Form2: TForm2;
  a, b, c: Boolean;
  actID: String;
  ins: Boolean;

implementation

uses
  DataModule, Unit1, Unit3, Unit4, Unit6, Unit9;

{$R *.dfm}

procedure DeleteAct();
var
  actID, i, n: Integer;
begin
  actID:=DM.dataSetActors.FieldByName('id_act').AsInteger;
  DM.dataSetRoles.Last;
  n:=DM.dataSetRoles.FieldByName('id_r').AsInteger;
  for i:= 1 to n do
  begin
    if DM.dataSetRoles.Locate('id_r;id_act', VarArrayOf([i, actID]),[]) then
      DM.dataSetRoles.Delete;
  end;
  DM.dataSetActors.Delete;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  DBGrid2.Visible:=False;
  DBGrid1.Visible:=True;
  DM.dataSetPerformances.Sort:='[Название постановки] ASC';
  SpeedButton3.Visible:=False;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  DBGrid1.Visible:=False;
  DBGrid2.Visible:=True;
  DM.dataSetActors.Sort:='Фамилия ASC';
  SpeedButton3.Visible:=True;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin

  Form9.Show;
  Close;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Form6.Show;
  fromTwo:=True;
  Close;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
  SpeedButton2Click(self);
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
  case Column.ID of
    0: if(not a) then
         begin
           DM.dataSetPerformances.Sort:='[Название постановки] DESC';
           a:=not a;
         end
       else begin
           DM.dataSetPerformances.Sort:='[Название постановки] ASC';
           a:=not a;
       end;
  end;
end;

procedure TForm2.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton2Click(self);
end;

procedure TForm2.DBGrid2TitleClick(Column: TColumn);
begin
  case Column.ID of
    0: begin
         if(not b) then
           begin
             DM.dataSetActors.Sort:='Фамилия DESC';
             b:=not b;
           end
         else begin
             DM.dataSetActors.Sort:='Фамилия ASC';
             b:=not b;
         end;
         c:=true;
       end;
    1: begin
         if(not c) then
           begin
             DM.dataSetActors.Sort:='Имя DESC';
             c:=not c;
           end
         else begin
             DM.dataSetActors.Sort:='Имя ASC';
             c:=not c;
         end;
         b:=true;
       end;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if(DBGrid1.Visible=True) then
  begin
    with DM.dataSetPerformances do
    begin
      Insert;
      FieldByName('Название постановки').AsString:='';

      Post;
      ins:=True;
    end;
    Form3.Show;
    Hide;
  end
  else begin
    DM.dataSetActors.Insert;
    Form4.Show;
    Hide;
  end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  if(DBGrid1.Visible=True) then
  begin
    Form3.Show;
    Hide;
  end
  else
    Form4.Show;
    Hide;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  if MessageBox(0, PChar('Удалить текущую запись?'), 'Удаление', MB_YESNO or MB_ICONWARNING
                                                       or MB_DEFBUTTON2)=id_yes then
    DeleteAct();
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  Close;
  Form1.Show;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Button1Click(self);
end;

end.
