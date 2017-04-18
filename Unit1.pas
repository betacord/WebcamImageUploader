unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, shellapi, IdThreadComponent, IdGlobal, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Opcje1: TMenuItem;
    Pomoc1: TMenuItem;
    Otwrzarchiwum1: TMenuItem;
    Koniec1: TMenuItem;
    Poczenieftp1: TMenuItem;
    Ustawieniaobrazu1: TMenuItem;
    Ustawieniaaplikacji1: TMenuItem;
    Pomoc2: TMenuItem;
    Oprogramie1: TMenuItem;
    Kodnastronwww1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    IdFTP1: TIdFTP;
    IdThreadComponent1: TIdThreadComponent;
    ProgressBar1: TProgressBar;
    Timer2: TTimer;
    Label3: TLabel;
    Wysyajobraznaserwer1: TMenuItem;
    procedure Poczenieftp1Click(Sender: TObject);
    procedure Ustawieniaobrazu1Click(Sender: TObject);
    procedure Ustawieniaaplikacji1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Otwrzarchiwum1Click(Sender: TObject);
    procedure Koniec1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure grafika(a : string);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
    procedure Kodnastronwww1Click(Sender: TObject);
    procedure Oprogramie1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Wysyajobraznaserwer1Click(Sender: TObject);
    procedure Pomoc2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  WM_CAP_START = $0400;
  WM_CAP_DRIVER_CONNECT = $0400 + 10;
  WM_CAP_DRIVER_DISCONNECT = $0400 + 11;
  WM_CAP_SAVEDIB = $0400 + 25;
  WM_CAP_GRAB_FRAME = $0400 + 60;
  WM_CAP_STOP = $0400 + 68;
  WM_CAP_DLG_VIDEOSOURCE = (WM_CAP_START + 42);

var
  Form1: TForm1;
  s : string;
  capturewindow:cardinal;
  libhandle:cardinal;
  CapGetDriverDescriptionA: function(DrvIndex:cardinal; Name:pansichar;NameLen:cardinal;Description:pansichar;DescLen:cardinal):boolean; stdcall;
  CapCreateCaptureWindowA: function(lpszWindowName: pchar; dwStyle: dword; x, y, nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall;
  function Connectwebcam(WebcamID:integer):boolean;
  procedure CaptureWebCam(FilePath: String);
  procedure CloseWebcam();
  procedure WebcamInit;
  procedure WebcamList;


implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5, Unit6;

procedure WebcamInit;
begin
  LibHandle := LoadLibrary('avicap32.dll');
  CapGetDriverDescriptionA := GetProcAddress(LibHandle,'capGetDriverDescriptionA');
  CapCreateCaptureWindowA := GetProcAddress(LibHandle,'capCreateCaptureWindowA');
end;

procedure WebcamList;
var
  x:cardinal;
  names: ^string;
  Descriptions: ^string;
begin
  for x := 0 to 9 do
  begin
    new(names);
    new(descriptions);
    setlength(Names^,256);
    setlength(Descriptions^,256);
    if not capGetDriverDescriptionA(x,pansichar(Names^),256,pansichar(Descriptions^),256) then continue;
    if length(Names^)>0 then form1.combobox1.Items.Add(inttostr(x)+' '+pansichar(names^)+', '+pansichar(descriptions^));
    dispose(names);
    dispose(descriptions);
  end;
end;

function Connectwebcam(WebcamID:integer):boolean;
begin
  if CaptureWindow <> 0 then
  begin
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, $0010, 0, 0);
    CaptureWindow := 0;
  end;
  CaptureWindow := capCreateCaptureWindowA('CaptureWindow', WS_CHILD and WS_VISIBLE, 0, 0, 0, 0, GetDesktopWindow, 0);
  if SendMessage(CaptureWindow, WM_CAP_DRIVER_CONNECT, WebcamID, 0) <> 1 then
  begin
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, $0010, 0, 0);
    CaptureWindow := 0;
    result := false;
  end
  else
  begin
    result := true;
  end;
end;

procedure CloseWebcam();
begin
  SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
  SendMessage(CaptureWindow, $0010, 0, 0);
  CaptureWindow := 0;
end;

procedure CaptureWebCam(filepath: string);
begin
  if CaptureWindow <> 0 then
  begin
    SendMessage(capturewindow, WM_CAP_DLG_VIDEOSOURCE, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_GRAB_FRAME, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_SAVEDIB, 0, longint(ansistring(filepath)));
  end;
end;

procedure tform1.grafika(a : string);
var
  o : tbitmap;
  g: ^integer;
  r : trect;
  d : string;
  j : tjpegimage;
begin
  o:=tbitmap.create;
  o.LoadFromFile(a);
  formatsettings.TimeSeparator:=':';
  o.Canvas.brush.style:=bssolid;
  o.Canvas.Brush.Color:=form3.ColorDialog2.color;
  if form3.CheckBox2.checked=true then
  begin
    new(g);
    if form3.ComboBox2.ItemIndex<0 then
    begin
      timer1.Enabled:=false;
      memo1.lines.Add(timetostr(now)+' - operacja przerwana');
      showmessage('wybierz gruboœæ bannera!');
    end
    else g^:=form3.ComboBox2.ItemIndex+5;
    if form3.ComboBox3.ItemIndex=0 then o.canvas.Rectangle(0,0,o.Width,g^);
    if form3.ComboBox3.ItemIndex=1 then o.canvas.Rectangle(0,o.height-g^,o.Width,o.height);
    if (form3.ComboBox3.itemindex<>0) and (form3.ComboBox3.ItemIndex<>1) then
    begin
      timer1.Enabled:=false;
      memo1.lines.Add(timetostr(now)+' - operacja przerwana');
      showmessage('Wybierz umiejscowienie bannera!');
    end;
    dispose(g);
    o.Canvas.Brush.style:=bsclear;
  end;
  if Form3.checkbox1.checked=true then
  begin
    if form3.ComboBox1.ItemIndex>-1 then
    begin
      d:=datetostr(now)+' '+timetostr(now);
      r:=o.Canvas.ClipRect;
      o.Canvas.Brush.Style:=bsclear;
      o.Canvas.Font.Color:=form3.ColorDialog1.color;
      o.Canvas.Font.Size:=form3.FontDialog1.Font.Size;
      o.Canvas.Font.name:=form3.fontdialog1.font.Name;
      o.Canvas.Font.Style:=form3.fontdialog1.Font.Style;
      if form3.combobox1.ItemIndex=0 then  drawtext(o.canvas.Handle,pchar(d),-1,r,dt_left or dt_top);
      if form3.combobox1.ItemIndex=1 then  drawtext(o.canvas.Handle,pchar(d),-1,r,dt_center or dt_top);
      if form3.combobox1.ItemIndex=2 then  drawtext(o.canvas.Handle,pchar(d),-1,r,dt_right or dt_top);
      if form3.combobox1.ItemIndex=3 then  drawtext(o.canvas.Handle,pchar(d),-1,r,dt_left or dt_bottom or dt_singleline);
      if form3.combobox1.ItemIndex=4 then  drawtext(o.canvas.Handle,pchar(d),-1,r,dt_center or dt_bottom or dt_singleline);
      if form3.combobox1.ItemIndex=5 then  drawtext(o.canvas.Handle,pchar(d),-1,r,dt_right or dt_bottom or dt_singleline);
    end
    else
    begin
      timer1.Enabled:=false;
      memo1.lines.Add(timetostr(now)+' - operacja przerwana');
      showmessage('Wybierz umiejscowienie godziny i daty!');
    end;
  end;
  if form3.CheckBox3.Checked=true then
  begin
    if (length(form3.edit1.text)>0) and (form3.ComboBox4.ItemIndex>-1) then
    begin
      o.Canvas.Font.Color:=form3.ColorDialog3.Color;
      o.Canvas.Font.Size:=form3.FontDialog2.Font.Size;
      o.Canvas.Font.name:=form3.fontdialog2.font.Name;
      o.Canvas.Font.Style:=form3.fontdialog2.Font.Style;
      if form3.combobox4.ItemIndex=0 then  drawtext(o.canvas.Handle,pchar(form3.Edit1.text),-1,r,dt_left or dt_top);
      if form3.combobox4.ItemIndex=1 then  drawtext(o.canvas.Handle,pchar(form3.Edit1.text),-1,r,dt_center or dt_top);
      if form3.combobox4.ItemIndex=2 then  drawtext(o.canvas.Handle,pchar(form3.Edit1.text),-1,r,dt_right or dt_top);
      if form3.combobox4.ItemIndex=3 then  drawtext(o.canvas.Handle,pchar(form3.Edit1.text),-1,r,dt_left or dt_bottom or dt_singleline);
      if form3.combobox4.ItemIndex=4 then  drawtext(o.canvas.Handle,pchar(form3.Edit1.text),-1,r,dt_center or dt_bottom or dt_singleline);
      if form3.combobox4.ItemIndex=5 then  drawtext(o.canvas.Handle,pchar(form3.Edit1.text),-1,r,dt_right or dt_bottom or dt_singleline);
    end
    else
    begin
      timer1.Enabled:=false;
      memo1.lines.Add(timetostr(now)+' - operacja przerwana');
      showmessage('Wpisz tekst i wybierz umiejscowienie!');
    end;
  end;
  o.SaveToFile(a);
  if wysyajobraznaserwer1.Checked=true then
  begin
    j:=tjpegimage.Create;
    j.assign(o);
    j.SaveToFile(ExtractFilePath(ParamStr(0))+'cam.jpg');
    j.Free;
  end;
  o.Free;
end;

procedure TForm1.IdThreadComponent1Run(Sender: TIdThreadComponent);
begin
  idftp1.Host:=form2.Edit1.Text;
  idftp1.username:=form2.Edit3.Text;
  idftp1.Password:=form2.Edit4.Text;
  idftp1.Connect;
  idftp1.changedir(form2.edit2.Text);
  idftp1.Put(ExtractFilePath(ParamStr(0))+'cam.jpg',form2.Edit5.Text+'.jpg',false);
  idftp1.Disconnect;
  memo1.lines.Add(timetostr(now)+' - wys³ano obraz na serwer');
  idthreadcomponent1.Stop;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  button1.Enabled:=false;
  button2.Enabled:=true;
  timer1.Interval:=1;
  timer1.Enabled:=true;
  koniec1.Enabled:=false;
  ustawieniaobrazu1.Enabled:=false;
  ustawieniaaplikacji1.Enabled:=false;
  poczenieftp1.Enabled:=false;
  wysyajobraznaserwer1.Enabled:=false;
  combobox1.Enabled:=false;
  combobox2.Enabled:=false;
  progressbar1.Max:=combobox2.ItemIndex+4;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  progressbar1.Position:=0;
  memo1.Lines.Add(timetostr(now)+' - operacja przerwana');
  button1.Enabled:=true;
  button2.Enabled:=false;
  koniec1.Enabled:=true;
  ustawieniaobrazu1.Enabled:=true;
  ustawieniaaplikacji1.Enabled:=true;
  poczenieftp1.Enabled:=true;
  wysyajobraznaserwer1.Enabled:=true;
  combobox1.Enabled:=true;
  combobox2.Enabled:=true;
  idthreadcomponent1.Stop;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  closewebcam;
  idthreadcomponent1.Stop;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
begin
  webcaminit;
  webcamlist;
  combobox1.ItemIndex:=0;
  for i:=5 to 600 do combobox2.Items.Add(inttostr(i)+' sek.');
  combobox2.ItemIndex:=5;
  if not directoryexists(ExtractFilePath(ParamStr(0))+'archiwum') then createdir(ExtractFilePath(ParamStr(0))+'archiwum');
end;

procedure TForm1.Kodnastronwww1Click(Sender: TObject);
begin
  form5.show;
end;

procedure TForm1.Koniec1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Oprogramie1Click(Sender: TObject);
begin
  showmessage('Webcam 1.0 ©2013 Tomasz Krzywicki. '+#13+'Kontakt: t-krzywicki@windowslive.com');
end;

procedure TForm1.Otwrzarchiwum1Click(Sender: TObject);
begin
  shellexecute(handle, 'open', 'explorer.exe', pchar(ExtractFilePath(ParamStr(0))+'archiwum'), nil, SW_SHOW);
end;

procedure TForm1.Poczenieftp1Click(Sender: TObject);
begin
  form2.show;
end;

procedure TForm1.Pomoc2Click(Sender: TObject);
begin
  form6.show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  timer1.Interval:=(combobox2.ItemIndex+5)*1000;
  formatsettings.timeseparator:='-';
  formatsettings.DateSeparator:='-';
  if not directoryexists(ExtractFilePath(ParamStr(0))+'archiwum\'+datetostr(now)) then createdir(ExtractFilePath(ParamStr(0))+'archiwum\'+datetostr(now));
  if combobox1.ItemIndex>-1 then
  begin
    connectwebcam(combobox1.ItemIndex);
    s:=ExtractFilePath(ParamStr(0))+'archiwum\'+datetostr(now)+'\'+timetostr(now)+'.bmp';
    capturewebcam(s);
    closewebcam;
    if fileexists(s) then
    begin
      timer2.Enabled:=false;
      timer2.Interval:=1;
      progressbar1.Position:=0;
      timer2.Enabled:=true;
      grafika(s);
      image1.Picture.LoadFromFile(s);
      formatsettings.timeseparator:=':';
      memo1.lines.Add(timetostr(now)+' - wykonano ujêcie');
      if wysyajobraznaserwer1.Checked=true then idthreadcomponent1.start;
    end
    else
    begin
      timer1.Enabled:=false;
      timer2.Enabled:=false;
      progressbar1.Position:=0;
      formatsettings.timeseparator:=':';
      showmessage('Pod³¹cz kamerê internetow¹');
      memo1.Lines.Add(timetostr(now)+' - operacja przerwana');
      button1.Enabled:=true;
      button2.Enabled:=false;
      combobox1.Enabled:=true;
      combobox2.Enabled:=true;
    end;
  end
  else
  begin
    timer1.Enabled:=false;
    timer2.Enabled:=false;
    progressbar1.Position:=0;
    showmessage('Zainstaluj i pod³¹cz kamerê internetow¹!');
    memo1.Lines.Add(timetostr(now)+' - operacja przerwana');
    button1.Enabled:=true;
    button2.Enabled:=false;
    combobox1.Enabled:=true;
    combobox2.Enabled:=true;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  timer2.Interval:=1000;
  progressbar1.Position:=progressbar1.Position+1;
end;

procedure TForm1.Ustawieniaaplikacji1Click(Sender: TObject);
begin
  form4.show;
end;

procedure TForm1.Ustawieniaobrazu1Click(Sender: TObject);
begin
  form3.show;
end;

procedure TForm1.Wysyajobraznaserwer1Click(Sender: TObject);
begin
  if wysyajobraznaserwer1.Checked=true then
  begin
    button1.Enabled:=true;
    poczenieftp1.Enabled:=false;
    wysyajobraznaserwer1.Checked:=false;
  end
  else
  begin
    button2.Enabled:=false;
    button1.Enabled:=false;
    poczenieftp1.Enabled:=true;
    wysyajobraznaserwer1.Checked:=true;
  end;
end;

end.
