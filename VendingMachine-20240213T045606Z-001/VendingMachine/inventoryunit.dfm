object Form2: TForm2
  Left = 669
  Top = 283
  Width = 1024
  Height = 675
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 432
    Top = 104
    Width = 49
    Height = 13
    Caption = 'tea leaves'
  end
  object Label2: TLabel
    Left = 432
    Top = 136
    Width = 68
    Height = 13
    Caption = 'coffee powder'
  end
  object Label3: TLabel
    Left = 432
    Top = 168
    Width = 26
    Height = 13
    Caption = 'sugar'
  end
  object Label4: TLabel
    Left = 432
    Top = 200
    Width = 18
    Height = 13
    Caption = 'milk'
  end
  object Label5: TLabel
    Left = 432
    Top = 232
    Width = 26
    Height = 13
    Caption = 'water'
  end
  object Edit1: TEdit
    Left = 528
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 528
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 528
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 528
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 528
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
    OnChange = Edit5Change
  end
  object Button1: TButton
    Left = 496
    Top = 288
    Width = 75
    Height = 25
    Caption = 'REFILL'
    TabOrder = 5
    OnClick = Button1Click
  end
end
