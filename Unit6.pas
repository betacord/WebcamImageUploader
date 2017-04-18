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
  label1.Caption:='Webcam 1.0 jest programem do pobierania i archiwizowania obrazu z kamery internetowej, oraz wysy�ania go na serwer ftp. Mo�na wykorzysta� go do udost�pniania i umieszczania obrazu na �ywo na stronie internetowej, lub do zdalnego monitoringu.'+#13 +
                  'Aby rozpocz�� prac� z programem nale�y wybra� jedn� z opcji wysy�ania obrazu na serwer (tak/nie). Aby u�ywa� programu bez opcji wysy�ania obrazu na serwer nale�y w menu opcje odznaczy� pozycj� "wysy�aj obraz na serwer" i klikn�� odblokowany button start.'+#13 +
                  'W przypadku gdy chcemy wysy�a� obraz na serwer nale�y w menu opcje wybra� po��czenie ftp, uzupe�ni� wszystkie pola i wybra� OK. Zostanie w�wczas przeprowadzony test po��czenia. Gdy wynik b�dzie pozytywny, zostanie odblokowany przycisk start. '+
                  'Je�eli nie - nale�y wprowadzi� dane ponownie.'+#13 +
                  'Aby przerwa� wysy�anie - nale�y wcisn�� button stop.';
end;

end.
