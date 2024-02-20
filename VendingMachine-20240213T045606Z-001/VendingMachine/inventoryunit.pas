unit inventoryunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 TnsinventoryC=class
  private
  tealeavesStock: Real;
  coffeepowderStock: Real;
  sugarStock: Real;
  milkStock: Real;
  waterStock: Real;
  FUsedTeaLeaves, FUsedCoffeePowder, FUsedSugar, FUsedMilk, FUsedWater: Real;
  public
  constructor create ;
  property utl:Real read FUsedTeaLeaves write FUsedTeaLeaves;
  property ucp:Real read FUsedCoffeePowder write FUsedCoffeePowder;
  property usug:Real read FUsedSugar write FUsedSugar;
  property um:Real read FUsedMilk write FUsedMilk;
  property uw:Real read FUsedWater write FUsedWater;
  property tealeaves: Real read tealeavesStock write tealeavesStock;
  property coffeepowder: Real read coffeepowderStock write coffeepowderStock;
  property sugar: Real read sugarStock write sugarStock;
  property milk: Real read milkStock write milkStock;
  property water: Real read waterStock write waterStock;
  end;

var
  Form2: TForm2;
  invobj: TnsinventoryC;
  rTemptlinput: Real;
  rTempcpinput: Real;
  rTempsuginput: Real;
  rTempminput: Real;
  rTempwinput: Real;
implementation
{$R *.dfm}
uses
  vendmainunit, machineunit;
constructor TnsinventoryC.create;
begin
  tealeaves := 500;
  coffeepowder := 500;
  sugar := 600;
  milk := 8000;
  water := 15000;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  rTemptlinput := strtofloat(Edit1.text);
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
  rTempcpinput := strtofloat(Edit2.text);
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
  rTempsuginput := strtofloat(Edit3.text );
end;

procedure TForm2.Edit4Change(Sender: TObject);
begin
  rTempminput := strtofloat(Edit4.text);
end;

procedure TForm2.Edit5Change(Sender: TObject);
begin
  rTempwinput := strtofloat(Edit5.text);
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  LbFlag : Boolean;
begin
  LbFlag:= True;
  if (  rTemptlinput<0) or (rTempcpinput<0)or (rTempsuginput<0)or (rTempwinput<0)or (rTempminput<0) then
  begin
    showMessage('Invalid input'); LbFlag:= False;
  end;
  if (LbFlag = True) then
    myobj.Mrefill(invobj,   rTemptlinput, rTempcpinput, rTempsuginput, rTempminput, rTempwinput);
    Edit1.text:= '0';
    Edit2.text:= '0';
    Edit3.text:= '0';
    Edit4.text:= '0';
    Edit5.text:= '0';
    Form2.Close;
end;

end.
