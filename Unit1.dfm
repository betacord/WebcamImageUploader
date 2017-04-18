object Form1: TForm1
  Left = 488
  Top = 55
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Webcam v1.0'
  ClientHeight = 574
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 296
    Width = 92
    Height = 13
    Caption = 'Wybierz sterownik:'
  end
  object Label2: TLabel
    Left = 16
    Top = 323
    Width = 166
    Height = 13
    Caption = 'Cz'#281'stotliwo'#347#263' od'#347'wie'#380'ania obrazu:'
  end
  object Label3: TLabel
    Left = 16
    Top = 384
    Width = 140
    Height = 13
    Caption = 'Post'#281'p do najbli'#380'szego uj'#281'cia'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 273
    Caption = 'Podgl'#261'd obrazu'
    Color = clMenu
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Image1: TImage
      Left = 16
      Top = 19
      Width = 320
      Height = 240
      Proportional = True
    end
  end
  object ComboBox1: TComboBox
    Left = 110
    Top = 293
    Width = 251
    Height = 21
    TabOrder = 1
  end
  object ComboBox2: TComboBox
    Left = 188
    Top = 320
    Width = 173
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 347
    Width = 170
    Height = 25
    Caption = 'Start'
    Enabled = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 347
    Width = 169
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 555
    Width = 376
    Height = 19
    Panels = <
      item
        Text = 'Webcam v1.0'
        Width = 200
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #169' 2013 Tomasz Krzywicki'
        Width = 50
      end>
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 436
    Width = 353
    Height = 105
    Caption = 'Log'
    TabOrder = 6
    object Memo1: TMemo
      Left = 8
      Top = 16
      Width = 337
      Height = 81
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 402
    Width = 345
    Height = 28
    TabOrder = 7
  end
  object MainMenu1: TMainMenu
    Left = 56
    Top = 32
    object Plik1: TMenuItem
      Caption = 'Plik'
      object Otwrzarchiwum1: TMenuItem
        Caption = 'Otw'#243'rz archiwum'
        OnClick = Otwrzarchiwum1Click
      end
      object Koniec1: TMenuItem
        Caption = 'Koniec'
        OnClick = Koniec1Click
      end
    end
    object Opcje1: TMenuItem
      Caption = 'Opcje'
      object Poczenieftp1: TMenuItem
        Caption = 'Po'#322#261'czenie ftp'
        OnClick = Poczenieftp1Click
      end
      object Ustawieniaobrazu1: TMenuItem
        Caption = 'Ustawienia obrazu'
        OnClick = Ustawieniaobrazu1Click
      end
      object Ustawieniaaplikacji1: TMenuItem
        Caption = 'Ustawienia aplikacji'
        OnClick = Ustawieniaaplikacji1Click
      end
      object Wysyajobraznaserwer1: TMenuItem
        Caption = 'Wysy'#322'aj obraz na serwer'
        Checked = True
        OnClick = Wysyajobraznaserwer1Click
      end
    end
    object Pomoc1: TMenuItem
      Caption = 'Pomoc'
      object Pomoc2: TMenuItem
        Caption = 'Pomoc'
        OnClick = Pomoc2Click
      end
      object Oprogramie1: TMenuItem
        Caption = 'O programie'
        OnClick = Oprogramie1Click
      end
      object Kodnastronwww1: TMenuItem
        Caption = 'Kod na stron'#281' www'
        OnClick = Kodnastronwww1Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 184
    Top = 224
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 184
    Top = 272
  end
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = IdThreadComponent1Run
    Left = 216
    Top = 272
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 248
    Top = 248
  end
end
