object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ustawienia aplikacji'
  ClientHeight = 104
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 198
    Height = 13
    Caption = 'Czas oczekiwania na odpowied'#378' serwera:'
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 35
    Width = 177
    Height = 17
    Caption = 'Zapami'#281'taj dane logowania ftp'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 67
    Width = 278
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object ComboBox1: TComboBox
    Left = 220
    Top = 5
    Width = 65
    Height = 21
    TabOrder = 0
  end
end
