unit uIDHTTP;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  IdAuthentication, FMX.Layouts, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMX.Objects;

type
  TForm3 = class(TForm)
    textBox: TText;
    edtHello: TEdit;
    edtBool: TEdit;
    edtnum: TEdit;
    btnSend: TButton;
    IdHTTP: TIdHTTP;
    Layout1: TLayout;
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TFoo = class
  private
    FFoo:integer;
    FFee:integer;

  end;

var
  Form3: TForm3;

implementation
uses
  REST.JSON;

{$R *.fmx}

procedure TForm3.btnSendClick(Sender: TObject);
 var iSS: TStringStream;
 begin
   iSS:= TstringStream.create;
   idHttp.Get('http://jsonapi.org/', iSS); // api �ּ�
   textBox.Text:= iSS.DataString;
   textBox.text:= TJson.JsonToObject<tfoo>(iSS.DataString);
   iSS.Free;
 end;


end.
