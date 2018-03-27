unit mi_ip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, ExtCtrls, StrUtils;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    ip: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    fecha: TLabel;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var total: string; sub_total: string; variable: integer;
begin
ip.Caption := IdHTTP1.Get('http://dynamic.zoneedit.com/checkip.html');
fecha.Caption := FormatDateTime('yyyy/mm/dd hh:nn:ss', Now());
sub_total :=  fecha.Caption+ '|' +ip.Caption;
total := AnsiReplaceStr(sub_total,' ','|');
ip.Color:= RGB(Random(255), Random(255), Random(255));

  try
     IdHTTP1.Get('http://www.AQUI_VA_TU_DOMINIO.com.ar/biblioteca/AQUI_TU_PHP.php?ip='+total);
     //RECIBE CON TU PHP EL VALOR DE TOTAL Y GUARDALO EN UNA TABLA, LUEGO LEE EL DATO DESDE AHI (◕‿-)
  except

  end;


end;

end.
