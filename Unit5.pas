unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit2, Unit4, Unit1;

procedure TForm5.FormCreate(Sender: TObject);
var
  s : ^string;
begin
  new(s);
  if form2.edit2.Text='/' then s^:='' else s^:=form2.Edit2.Text;
  memo1.Lines.Add('<IMG src="'+s^+form2.edit5.text+'.jpg" width="320"  height="240"  border="1"  name="refresh"> ');
  memo1.Lines.Add('<SCRIPT language="JavaScript" type="text/javascript">');
  memo1.Lines.Add('<!--');
  memo1.Lines.Add('var t='+inttostr(form1.combobox2.itemindex+5)+' // czêstotliwoœæ odœwie¿ania obrazu');
  memo1.lines.add('image = "'+s^+form2.edit5.text+'.jpg"');
  dispose(s);
  memo1.Lines.Add('function Start() ');
  memo1.Lines.Add('{');
  memo1.Lines.Add('        tmp = new Date();');
  memo1.Lines.Add('        tmp = "?"+tmp.getTime()');
  memo1.Lines.Add('        document.images["refresh"].src = image+tmp');
  memo1.Lines.Add('        setTimeout("Start()", t*1000)');
  memo1.Lines.Add('}');
  memo1.Lines.Add('Start();');
  memo1.Lines.Add('// --> ');
  memo1.Lines.Add('</SCRIPT> ');
end;

end.
