unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
  label1.Caption:='Webcam 1.0 jest programem do pobierania i archiwizowania obrazu z kamery internetowej, oraz wysy³ania go na serwer ftp. Mo¿na wykorzystaæ go do udostêpniania i umieszczania obrazu na ¿ywo na stronie internetowej, lub do zdalnego monitoringu.'+#13 +
                  'Aby rozpocz¹æ pracê z programem nale¿y wybraæ jedn¹ z opcji wysy³ania obrazu na serwer (tak/nie). Aby u¿ywaæ programu bez opcji wysy³ania obrazu na serwer nale¿y w menu opcje odznaczyæ pozycjê "wysy³aj obraz na serwer" i klikn¹æ odblokowany button start.'+#13 +
                  'W przypadku gdy chcemy wysy³aæ obraz na serwer nale¿y w menu opcje wybraæ po³¹czenie ftp, uzupe³niæ wszystkie pola i wybraæ OK. Zostanie wówczas przeprowadzony test po³¹czenia. Gdy wynik bêdzie pozytywny, zostanie odblokowany przycisk start. '+
                  'Je¿eli nie - nale¿y wprowadziæ dane ponownie.'+#13 +
                  'Aby przerwaæ wysy³anie - nale¿y wcisn¹æ button stop.';
end;

end.
