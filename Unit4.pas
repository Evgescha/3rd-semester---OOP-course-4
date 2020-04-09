unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls,
  Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  DataModule, Unit2;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  if (DBEdit1.Text='') or (DBEdit2.Text='') then
    MessageDlg('Введены не все данные.', mtError, [mbOK], 0)
  else begin
    DM.dataSetActors.Edit;
    DM.dataSetActors.Post;
    Form2.Show;
    Close;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  DM.dataSetActors.Cancel;
  Form2.Show;
  Close;
end;

procedure TForm4.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  {if not (key in['А'..'Я', 'а'..'я', #8]) then
  begin
    key:=#0;
  end;}
end;

procedure TForm4.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  {if not (key in['А'..'Я', 'а'..'я', #8]) then
  begin
    key:=#0;
  end;}
end;

end.
