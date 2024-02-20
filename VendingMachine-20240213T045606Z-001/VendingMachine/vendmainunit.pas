unit vendmainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, machineunit;

type

  TForm1 = class(TForm)
    dispense: TButton;
    refill: TButton;
    showreport: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cupcount: TEdit;
    item: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    exit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure itemChange(Sender: TObject);
    procedure dispenseClick(Sender: TObject);
    procedure cupcountChange(Sender: TObject);
    procedure refillClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure showreportClick(Sender: TObject);
    procedure exitClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  tempcup: Integer;
  tempsug: Integer;
  myobj: TnsMachineC;
implementation

uses inventoryunit;
var
  inputitem: integer;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  myobj := TnsMachineC.create;
  invobj := TnsinventoryC.create;
end;

procedure TForm1.itemChange(Sender: TObject);
begin
  inputitem := strtointdef(item.text,0);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    tempsug := 1
  else
    tempsug := 0;
end;

procedure TForm1.cupcountChange(Sender: TObject);
begin
  tempcup := strtointdef(cupcount.text,0);
end;

procedure TForm1.dispenseClick(Sender: TObject);
var
  LbFlag : Boolean;
begin
  LbFlag:= True;
  if (inputitem<1) or (inputitem>4) then
  begin
    showMessage('Invalid item input'); LbFlag:= False;
  end;

  if (tempcup<1) then
  begin
    showMessage('Invalid Cup Count'); LbFlag:= False;
  end;

  if (LbFlag = True) then
  if inputitem = 1 then
  begin
    tempitem := strongcoffee;
    myobj.dispensecheck( invobj, tempcup, tempsug, tempitem);
  end;
  if inputitem = 2 then
  begin
    tempitem := lightcoffee;
    myobj.dispensecheck( invobj, tempcup, tempsug, tempitem);
  end;
   if inputitem = 3 then
  begin
    tempitem := strongtea;
    myobj.dispensecheck( invobj, tempcup, tempsug, tempitem);
  end;
   if inputitem = 4 then
  begin
    tempitem := lighttea;
    myobj.dispensecheck( invobj, tempcup, tempsug, tempitem);
  end;
end;

procedure TForm1.refillClick(Sender: TObject);
begin
   showmessage('current stock in containers: ' +
    'tl: '+floattostr(invobj.tealeaves) + slinebreak+
    'cp: '+ floattostr(invobj.coffeepowder) + slinebreak+
    'sug: '+ floattostr(invobj.sugar) + slinebreak+
    'milk: '+ floattostr(invobj.milk) + slinebreak+
    'water: '+ floattostr(invobj.water));
  Form2.Show;
end;

procedure TForm1.showreportClick(Sender: TObject);
begin
  myobj.showreport(invobj);
end;

procedure TForm1.exitClick(Sender: TObject);
begin
   myobj.free;
   invobj.free;
   application.terminate;
end;

end.
