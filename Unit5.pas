unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls,  Buttons;

type
  TForm5 = class(TForm)
    PaintBox1: TPaintBox;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TSeat = class
  private
    a, b, c, d: Integer;
    color: TColor;
    str: String;
  public
    m,n: Integer;
    constructor create(a, b, c, d: Integer);
    procedure draw;
    procedure mouseClick(x, y: Integer);
    procedure isBusy(id: Integer);
  end;

var
  Form5: TForm5;
  sList: TList;
  Sn: TSeat;

implementation

uses
  DataModule, Unit8;

{$R *.dfm}

constructor TSeat.create(a, b, c, d: Integer);
begin
  self.a:=a;
  self.b:=b;
  self.c:=c;
  self.d:=d;

  self.color:=RGB(174,224,24);

  sList.Add(self);

  self.str:=IntToStr((sList.Count-1) mod 8);
  if str='0' then
    str:='8';


  self.m:=Round((a+c)/2)-3;
  self.n:=Round((b+d)/2)-7;

  Draw;

end;

procedure TSeat.draw;
begin
  with Form5.PaintBox1.Canvas do
  begin
    Brush.Color:=color;
    Rectangle(a,b,c,d);
    TextOut(m,n,str);
  end;
end;

procedure TSeat.mouseClick(x: Integer; y: Integer);
var
  i, k: Integer;
  s1: TSeat;
begin
  for i:= 1 to sList.Count-1 do
  begin
    s1:=sList.Items[i];
    if ((x>s1.a) and (x<s1.c) and (y>s1.b) and (y<s1.d))then
    begin
      if(s1.color<>clred) then
      begin
        Form5.Close;
        Form8.DBEdit2.Text:=IntToStr(i);
        Form8.Edit1.Text:=IntToStr((i div 8)+1);
        k:=i mod 8;
        if k=0 then
          k:=8;
        Form8.Edit2.Text:=IntToStr(k);
        Form8.Show;
        Break;
      end
      else
        MessageDlg('Место занято.', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TSeat.isBusy(id: Integer);
var
  s1: TSeat;
begin
  s1:=sList.Items[id];
  s1.color:=clred;
  s1.draw;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sList.Clear;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  sList:=TList.Create;
end;

procedure TForm5.FormMouseEnter(Sender: TObject);
  var
  i: Integer;
begin
  for i:= 0 to 23 do
    if(Form8.seatBusy[i]<>0) then
      Sn.isBusy(Form8.seatBusy[i]);
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  Sn:=TSeat.create(0,0,0,0);
end;

procedure TForm5.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Sn.mouseClick(X,Y);
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
  Close;
  with Form8 do
  begin
    Button1.Enabled:=False;
    Show;
  end;
end;

end.
