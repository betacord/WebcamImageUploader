unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    Button3: TButton;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    GroupBox3: TGroupBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Button4: TButton;
    Button5: TButton;
    ComboBox4: TComboBox;
    BitBtn1: TBitBtn;
    FontDialog1: TFontDialog;
    FontDialog2: TFontDialog;
    ColorDialog1: TColorDialog;
    ColorDialog2: TColorDialog;
    ColorDialog3: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  fontdialog1.execute;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  colordialog1.Execute;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  colordialog2.Execute;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  fontdialog2.Execute;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  colordialog3.Execute;
end;

procedure TForm3.FormCreate(Sender: TObject);
var
  i : byte;
begin
  for I := 5 to 150 do combobox2.Items.Add(inttostr(i));
end;

end.
