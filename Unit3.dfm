object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ustawienia obrazu'
  ClientHeight = 327
  ClientWidth = 311
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 145
    Caption = 'Data/godzina'
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Poka'#380' dat'#281'/godzin'#281
      TabOrder = 0
    end
    object Button1: TButton
      Left = 16
      Top = 39
      Width = 113
      Height = 25
      Caption = 'Czcionka'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 70
      Width = 113
      Height = 25
      Caption = 'Kolor czcionki'
      TabOrder = 2
      OnClick = Button2Click
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 104
      Width = 113
      Height = 21
      TabOrder = 3
      Text = 'Umiejscowienie'
      Items.Strings = (
        'g'#243'ra/lewa'
        'g'#243'ra/'#347'rodek'
        'g'#243'ra/prawa'
        'd'#243#322'/lewa'
        'd'#243#322'/'#347'rodek'
        'd'#243#322'/prawa')
    end
  end
  object GroupBox2: TGroupBox
    Left = 160
    Top = 8
    Width = 137
    Height = 145
    Caption = 'Banner poziomy'
    TabOrder = 1
    object CheckBox2: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Banner poziomy'
      TabOrder = 0
    end
    object Button3: TButton
      Left = 13
      Top = 39
      Width = 113
      Height = 25
      Caption = 'Kolor'
      TabOrder = 1
      OnClick = Button3Click
    end
    object ComboBox3: TComboBox
      Left = 13
      Top = 104
      Width = 113
      Height = 21
      TabOrder = 2
      Text = 'Umiejscowienie'
      Items.Strings = (
        'g'#243'ra'
        'd'#243#322)
    end
  end
  object ComboBox2: TComboBox
    Left = 173
    Top = 78
    Width = 113
    Height = 21
    TabOrder = 2
    Text = 'Grubo'#347#263
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 159
    Width = 289
    Height = 114
    Caption = 'W'#322'asny tekst'
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 39
      Width = 118
      Height = 13
      Caption = 'Tutaj wpisz w'#322'asny tekst'
    end
    object CheckBox3: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = 'W'#322'asny tekst'
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 16
      Top = 51
      Width = 262
      Height = 21
      TabOrder = 1
    end
    object Button4: TButton
      Left = 16
      Top = 78
      Width = 75
      Height = 25
      Caption = 'Czcionka'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 97
      Top = 78
      Width = 75
      Height = 25
      Caption = 'Kolor czcionki'
      TabOrder = 3
      OnClick = Button5Click
    end
    object ComboBox4: TComboBox
      Left = 178
      Top = 78
      Width = 100
      Height = 21
      TabOrder = 4
      Text = 'Umiejscowienie'
      Items.Strings = (
        'g'#243'ra/lewa'
        'g'#243'ra/'#347'rodek'
        'g'#243'ra/prawa'
        'd'#243#322'/lewa'
        'd'#243#322'/'#347'rodek'
        'd'#243#322'/prawa')
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 294
    Width = 295
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 144
    Top = 168
  end
  object FontDialog2: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 152
    Top = 160
  end
  object ColorDialog1: TColorDialog
    Left = 152
    Top = 176
  end
  object ColorDialog2: TColorDialog
    Left = 184
    Top = 176
  end
  object ColorDialog3: TColorDialog
    Left = 192
    Top = 184
  end
end
