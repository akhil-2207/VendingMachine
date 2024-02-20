unit machineunit;
interface
uses
sysutils,dialogs, inventoryunit,bevunit;
const
  TEALEAVESCO=500;
  COFFEEPOWDERCO=500;
  SUGARCO=600;
  MILKCO=8000;
  WATERCO=15000;

type
TBeverageType=(strongcoffee=1,lightcoffee=2,strongtea=3,lighttea=4);

 TnsMachineC=class
  private
  FTotalCup: Integer;
  FTotalSP: real;
  FTotalMilkLeak: real;
  FTotalWaterLeak: real;
  FTotalCP: real;
  FProfit: real;
  FSCsold:Integer;
  FLCsold:Integer;
  FSTsold:Integer;
  FLTsold:Integer;
  public
  utl, ucp, usug, um, uw:Real;
  constructor create;
  procedure Status( Lncupsdis: Integer; Lsp: Real; Lcostprice:Real; Lmleak:Real; Lwleak:Real);
  function dispensecheck(invobj:TnsinventoryC;
           tempcup, tempsug: Integer;
           tempitem: TBeverageType): string;
  function Mrefill(invobj: TnsinventoryC;
           rTemptlinput, rTempcpinput, rTempsuginput, rTempminput, rTempwinput: Real):string;
  procedure showreport(invobj:TnsinventoryC);
  property totalcupsold: Integer read FTotalCup write FTotalCup;
  property totalSP: Real read FTotalSP write FTotalSP;
  property totalmleak: Real read FTotalMilkLeak write FTotalMilkLeak;
  property totalwleak: Real read FTotalWaterLeak write FTotalWaterLeak;
  property totalCP: Real read FTotalCP write FTotalCP;
  property profit: Real read FProfit write FProfit;
  property SCsold: Integer read FSCsold write FSCsold;
  property LCsold: Integer read FLCsold write FLCsold;
  property STsold: Integer read FSTsold write FSTsold;
  property LTsold: Integer read FLTsold write FLTsold;
  end;

var
  tempitem: TBeverageType;
  myobj: TnsMachineC;
  invobj: TnsinventoryC;
  beverageSCobj: TnsBeverageSC;
  beverageLCobj: TnsBeverageLC;
  beverageSTobj: TnsBeverageST;
  beverageLTobj: TnsbeverageLT;
  

implementation

constructor TnsMachineC.create;
begin
  totalcupsold := 0;
  totalSP := 0;
  totalmleak := 0;
  totalwleak := 0;
  totalCP := 0;
  profit := 0;
  //showmessage('created');
end;

procedure TnsMachineC.Status( Lncupsdis: Integer; Lsp: Real; Lcostprice:Real; Lmleak:Real; Lwleak:Real);

begin
  totalcupsold := totalcupsold + Lncupsdis;
  totalSP := self.totalSP + Lsp * Lncupsdis;

  totalCP :=  totalCP + Lcostprice;
  profit := totalSP - totalCP;
    //showMessage('Total amount is : ' + floattostr(totalSP));
    //showMessage('Total cp is : ' + floattostr(totalCP));
    //beverageSCobj.countleakage(Lmleak, Lwleak, tempcup {beverageSCobj});
  totalmleak := totalmleak + Lmleak;
  totalwleak := totalwleak + Lwleak;


end;

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TnsMachineC.dispensecheck;
var
  Lncupsdis: Integer;
  Lsp, Lmleak, Lwleak, Lcostprice: Real;
  
begin
  if ord(tempitem)=1 then
  begin
    {*
      Intent: Handles the dispensing process for different beverage types based on the selected beverage.

    Parameters:
    - invobj: An instance of the TnsinventoryC class, representing the inventory object.
    - tempcup: An Integer representing the cup count for dispensing (e.g., 1,2,3).
    - tempsug: An Integer representing the choice to add sugar or not for dispensing.
    - tempitem: An enumerated type (TBeverageType) representing
                the selected beverage type (e.g. Strong Coffee=1,Light Coffee=2).

    Assumptions:
    - Assumes tempitem is set to a valid beverage type
      (1 for Strong Coffee, 2 for Light Coffee, 3 for Strong Tea, 4 for Light Tea).

    Logic:
    - Creates an instance of the appropriate beverage type (Strong Coffee, Light Coffee, Strong Tea, Light Tea).
    - Calls the respective dispense check method for the selected beverage type.
    - Updates the machine fields using machines status func based on the dispense check results.

    Callers:
    - Called from  main form to initiate the dispensing process.

    Result: A string indicating the result of the dispensing process (e.g., dispensed 3 cups of Strong Coffee).
      *}

    beverageSCobj := TnsBeverageSC.create;
    Lncupsdis:=0; Lsp:=0; Lmleak:=0; Lwleak:=0; Lcostprice:=0;
    beverageSCobj.dispenseSCcheck(tempcup, tempsug, invobj, beverageSCobj, Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak);
    self.status(Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak) ;
    SCsold:= SCsold + Lncupsdis;

    (*totalcupsold := totalcupsold + Lncupsdis;
    totalSP := totalSP + Lsp * Lncupsdis;

    totalCP :=  totalCP + Lcostprice;
    profit := totalSP - totalCP;
    //showMessage('Total amount is : ' + floattostr(totalSP));
    //showMessage('Total cp is : ' + floattostr(totalCP));
    //beverageSCobj.countleakage(Lmleak, Lwleak, tempcup {beverageSCobj});
    totalmleak := totalmleak + Lmleak;
    totalwleak := totalwleak + Lwleak;*)
  end;

  if ord(tempitem)=2 then
  begin
    beverageLCobj := TnsBeverageLC.create;
    Lncupsdis:=0; Lsp:=0; Lmleak:=0; Lwleak:=0; Lcostprice:=0;
    beverageLCobj.dispenseLCcheck(tempcup, tempsug, invobj, beverageLCobj, Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak);
    self.status(Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak) ;
    LCsold:= LCsold + Lncupsdis;
  end;

  if ord(tempitem)=3 then
  begin
    beverageSTobj := TnsBeverageST.create;
    Lncupsdis:=0; Lsp:=0; Lmleak:=0; Lwleak:=0; Lcostprice:=0;
    beverageSTobj.dispenseSTcheck(tempcup, tempsug, invobj, beverageSTobj, Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak);
    self.status(Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak) ;
    STsold:= STsold + Lncupsdis;
  end;

  if ord(tempitem)=4 then
  begin
    beverageLTobj := TnsBeverageLT.create;
    Lncupsdis:=0; Lsp:=0; Lmleak:=0; Lwleak:=0; Lcostprice:=0;
    beverageLTobj.dispenseLTcheck(tempcup, tempsug, invobj, beverageLTobj, Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak);
    self.status(Lncupsdis, Lsp, Lcostprice, Lmleak, Lwleak) ;
    LTsold:= LTsold + Lncupsdis;
  end;



end;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TnsMachineC.Mrefill(invobj: TnsinventoryC; rTemptlinput, rTempcpinput, rTempsuginput, rTempminput, rTempwinput: Real):string;
begin
    {*
    Intent: Refills the inventory with specified quantities of tea leaves, coffee powder, sugar, milk, and water.

    Parameters:
    - invobj: An instance of the TnsinventoryC class, representing the inventory object.
    - rTemptlinput: Real, the quantity of tea leaves to be added.
    - rTempcpinput: Real, the quantity of coffee powder to be added.
    - rTempsuginput: Real, the quantity of sugar to be added.
    - rTempminput: Real, the quantity of milk to be added.
    - rTempwinput: Real, the quantity of water to be added.

    Assumptions:
    - Assumes that the sum of the input quantities and the existing quantities in the inventory
    does not exceed the container capacities defined by TEALEAVESCO, COFFEEPOWDERCO, SUGARCO, MILKCO, and WATERCO.

    Logic:
    - Checks if the sum of the input quantities for each item plus the current quantity in the inventory
    is within the defined container capacities.
    - If within limits, updates the inventory quantities and displays a message with the updated inventory values.
    - If exceeded, displays an error message indicating that refill quantities exceed container capacities.

    Callers:
    - Called from refill form to initiate the refilling process.

    Result: Displays a message indicating the success or failure of the refill operation.
    *}

  if(rTemptlinput + invobj.tealeaves <= TEALEAVESCO)and
    (rTempcpinput + invobj.coffeepowder <= COFFEEPOWDERCO)and
    (rTempsuginput + invobj.sugar <= SUGARCO) and
    (rTempminput + invobj.milk <= MILKCO)and
    (rTempwinput + invobj.water <= WATERCO)then
  begin
    invobj.tealeaves := invobj.tealeaves + rTemptlinput;
    invobj.coffeepowder := invobj.coffeepowder + rTempcpinput;
    invobj.sugar := invobj.sugar + rTempsuginput;
    invobj.milk := invobj.milk + rTempminput;
    invobj.water := invobj.water + rTempwinput;
    showmessage('invemtory updated : '+ slinebreak+
    'tl: '+floattostr(invobj.tealeaves) + slinebreak+
    'cp: '+ floattostr(invobj.coffeepowder) + slinebreak+
    'sug: '+ floattostr(invobj.sugar) + slinebreak+
    'milk: '+ floattostr(invobj.milk) + slinebreak+
    'water: '+ floattostr(invobj.water));
  end
  else
    showmessage('cannot refill more than container capacity');
end;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

procedure TnsMachineC.showreport;
begin
  {*
  Intent: Displays a summary report of the machine's performance and inventory status.

  Parameters:
  - invobj: An instance of the TnsinventoryC class, representing the inventory object.

  Logic:
  - Displays a message box containing the following information:
  - Total cups sold
  - Total income
  - Profit
  - Total leakage of milk
  - Total water leak
  - Total stock used for each inventory item (tea leaves, coffee powder, sugar, milk, water)

  Result: Displays a summary report to provide insights into the machine's activity and inventory status.
  *}

  showmessage('total cups sold : ' + inttostr(totalcupsold)+ slinebreak +
  'Strong Coffee Sold: ' + IntToStr(SCsold) + slinebreak +
  'Light Coffee Sold: ' + IntToStr(LCsold) + slinebreak +
  'Strong Tea Sold: ' + IntToStr(STsold) + slinebreak +
  'Light Tea Sold: ' + IntToStr(LTsold) + slinebreak +
  'total income: ' + floattostr(totalSP)+ slinebreak+
  'profit: '+ floattostr(profit)+ slinebreak+
  'total leakage of milk: ' + floattostr(totalmleak)+ slinebreak+
  'total water leak : ' + floattostr(totalwleak)+ slinebreak+
  'total stock used : ' + slinebreak+
  'tea leaves: ' + floattostr(invobj.utl)+ slinebreak +
  'coffee powder: ' + floattostr(invobj.ucp)+ slinebreak +
  'sugar: ' + floattostr(invobj.usug)+slinebreak +
  'milk: ' + floattostr(invobj.um)+slinebreak +
  'water: ' + floattostr(invobj.uw));

end;
end.
