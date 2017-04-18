unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IdGlobal,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdThreadComponent;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Edit5: TEdit;
    IdFTP1: TIdFTP;
    IdThreadComponent1: TIdThreadComponent;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

function zaszyfruj(t:string): string;
var
  i: byte;
begin
  if ord(t[1])+26>122 then t:=inttostr(ord(t[1])+26-122) else t:=inttostr(ord(t[1])+26);
  result:=t;
end;
function rozszyfruj(t : string) : string;
var
  i, j : byte;
begin
  if strtoint(t)-26<1 then j:=strtoint(t)-26+122 else j:=strtoint(t)-26;
  result:=chr(j);
end;
procedure TForm2.BitBtn1Click(Sender: TObject);
var
  p, p1, h: textfile;
  i : ^byte;
  j : byte;
  hh : ^string;
  a : array[1..2] of string;
begin
  if (length(edit1.Text)>0) and (length(edit2.Text)>0) and (length(edit3.Text)>0) and (length(edit4.Text)>0) and (length(edit5.Text)>0) then
  begin
    form1.memo1.lines.add(timetostr(now)+' - test po³¹czenia');
    assignfile(p1,ExtractFilePath(ParamStr(0))+'ustawienia.txt');
    new(i);
    i^:=1;
    reset(p1);
    while not eof(p1) do
    begin
      readln(p1,a[i^]);
      i^:=i^+1;
    end;
    dispose(i);
    closefile(p1);
    assignfile(h,ExtractFilePath(ParamStr(0))+'haslo.txt');
    assignfile(p,ExtractFilePath(ParamStr(0))+'polaczenie.txt');
    if a[2]='1' then
    begin
      rewrite(p);
      writeln(p,edit5.Text);
      writeln(p,edit2.Text);
      writeln(p,edit1.Text);
      writeln(p,edit3.Text);
      closefile(p);
      rewrite(h);
      for j := 1 to length(edit4.text) do writeln(h,zaszyfruj(edit4.text[j]));
      closefile(h);
    end
    else
    begin
      rewrite(p);
      closefile(p);
      rewrite(h);
      closefile(h);
    end;
    idthreadcomponent1.Start;
    sleep(strtoint(a[1])*1000);
    if idftp1.Connected=true then
    begin
      idftp1.Disconnect;
      form1.memo1.lines.add(timetostr(now)+' - po³¹czono z serwerem');
      form1.Button1.Enabled:=true;
      close;
    end
    else form1.memo1.lines.add(timetostr(now)+' - nie nawi¹zano po³¹czenia z serwerem');
  end
  else showmessage('Uzupelnij wszystkie pola!');
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  p1, p, h : textfile;
  s, s1 : ^string;
  i : integer;
  a : array[1..2] of string;
  b : array[1..4] of string;
begin
  assignfile(p1,ExtractFilePath(ParamStr(0))+'ustawienia.txt');
  reset(p1);
  i:=1;
  while not eof(p1) do
  begin
    readln(p1,a[i]);
    i:=i+1;
  end;
  closefile(p1);
  if not (i=1) and (a[2]='1') then
  begin
    assignfile(p,ExtractFilePath(ParamStr(0))+'polaczenie.txt');
    reset(p);
    i:=1;
    while not eof(p) do
    begin
      readln(p,b[i]);
      i:=i+1;
    end;
    closefile(p);
    edit5.Text:=b[1];
    edit2.Text:=b[2];
    edit1.Text:=b[3];
    edit3.Text:=b[4];
    assignfile(h,ExtractFilePath(ParamStr(0))+'haslo.txt');
    reset(h);
    new(s);
    new(s1);
    while not eof(h) do
    begin
      readln(h,s1^);
      s^:=s^+rozszyfruj(s1^);
    end;
    closefile(h);
    dispose(s1);
    edit4.Text:=s^;
    dispose(s);
  end;
end;

procedure TForm2.IdThreadComponent1Run(Sender: TIdThreadComponent);
begin
  idftp1.host:=edit1.Text;;
  idftp1.Username:=edit3.text;
  idftp1.Password:=edit4.text;
  idftp1.Connect;
  idthreadcomponent1.Stop;
end;

end.
