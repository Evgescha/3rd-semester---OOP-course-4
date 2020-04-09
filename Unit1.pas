unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2, Unit7;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Hide;
  Form7.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Panel1.Visible:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if ((Edit1.Text='Admin') or (Edit1.Text='admin')) and (Edit2.Text='1111') then
  begin
    Panel1.Visible:=False;
    Edit1.Text:='';
    Edit2.Text:='';
    Hide;
    Form2.Show;
  end
  else begin
    MessageDlg('Логин и/или пароль введены не правильно.', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Panel1.Visible:=False;
  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
