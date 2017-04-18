unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, registry;

type
  TForm4 = class(TForm)
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit2;

function zaszyfruj(t:string): string;
var
  i: byte;
begin
  if ord(t[1])+26>122 then t:=inttostr(ord(t[1])+26-122) else t:=inttostr(ord(t[1])+26);
  result:=t;
end;
procedure TForm4.BitBtn1Click(Sender: TObject);
var
  p, a, h : textfile;
  j : byte;
begin
  assignfile(p,ExtractFilePath(ParamStr(0))+'ustawienia.txt');
  rewrite(p);
  writeln(p,inttostr(combobox1.ItemIndex+1));
  if checkbox1.Checked=true then writeln(p,1) else writeln(p,0);
  closefile(p);
  assignfile(a,ExtractFilePath(ParamStr(0))+'polaczenie.txt');
  assignfile(h,ExtractFilePath(ParamStr(0))+'haslo.txt');
  if checkbox1.checked=false then
  begin
    rewrite(a);
    rewrite(h);
  end
  else
  begin
    rewrite(a);
    rewrite(h);
    writeln(a,form2.edit5.text);
    writeln(a,form2.edit2.Text);
    writeln(a,form2.edit1.Text);
    writeln(a,form2.edit3.Text);
    for j := 1 to length(form2.edit4.text) do writeln(h,zaszyfruj(form2.edit4.text[j]));
  end;
  closefile(a);
  closefile(h);
  close;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  p : textfile;
  i : ^byte;
  j : byte;
  a : array[1..2] of string;
  r : tregistry;
begin
  for j := 1 to 60 do combobox1.Items.Add(inttostr(j)+' sek.');
  assignfile(p,ExtractFilePath(ParamStr(0))+'ustawienia.txt');
  reset(p);
  new(i);
  i^:=1;
  while not eof(p) do
  begin
    readln(p,a[i^]);
    i^:=i^+1;
  end;
  dispose(i);
  closefile(p);
  combobox1.ItemIndex:=strtoint(a[1])-1;
  if a[2]='1' then checkbox1.Checked:=true else checkbox1.Checked:=false;
end;

end.
