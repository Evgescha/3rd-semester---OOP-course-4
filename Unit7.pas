unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses
  DataModule, Unit1, Unit6, Unit8;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
  Close;
  Form6.Show;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  Close;
  DM.dataSetTicket.Insert;
  Form8.Show;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
  Close;
  Form1.Show;
end;

end.
