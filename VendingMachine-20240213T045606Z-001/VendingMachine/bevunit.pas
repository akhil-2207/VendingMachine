unit bevunit;
interface
uses
sysutils,dialogs,inventoryunit;
const
  MLOSS= 2.5;
  WLOSS= 5;
  WLOSST= 7.5;
  MLOSSLC= 3;
  MLOSSST= 1.5;
  MLOSSLT= 2;

  //sellp=17.5;
  TEALEAVESCP= 1;
  COFFEEPOWDERCP= 2;
  SUGARCP= 1.5;
  MILKCP= 0.15;
  WATERCP= 0.02;
//---------------------------------------------------------------------------------------------------------------------------------------
//                                         Strong Coffee
type
 TnsBeverageSC=class
  private
  Fcp:Real;
  Ftl:Real;
  Fw:Real;
  Fmi:Real;
  Fsug:Real;
  Fsellp:Real;
  public
  constructor create;
  function dispenseSCcheck(tempcup, tempsug: Integer;
           invobj: TnsinventoryC; beverageSCobj: TnsBeverageSC;
           out Lncupsdis : Integer; out Lsp : Real ;
           out Lcostprice: Real; out Lmleak: Real; out Lwleak: Real ):string;
  function countleakage(out Lmleak: Real; out Lwleak :Real; tempcup: Integer{; beverageSCobj:beverageSC}):string;
  function update(invobj: TnsinventoryC; beverageSCobj: TnsBeverageSC; tempcup, tempsug:integer):string;
  procedure used(invobj: TnsinventoryC; beverageSCobj: TnsBeverageSC; tempcup:integer);
  procedure costprice(beverageSCobj: TnsBeverageSC; tempcup, tempsug:integer; out Lcostprice:real);
  property cp: Real read Fcp write Fcp;
  property tl: Real read Ftl write Ftl;
  property w: Real read Fw write Fw;
  property mi: Real read Fmi write Fmi;
  property sug: Real read Fsug write Fsug;
  property sellp: Real read Fsellp write Fsellp;
  end;
//------------------------------------------------------------------------------------------------------------
//                                          Light Coffee
  TnsBeverageLC=class
  private
  Fcp:Real;
  Ftl:Real;
  Fw:Real;
  Fmi:Real;
  Fsug:Real;
  Fsellp:Real;
  public
  constructor create;
  function dispenseLCcheck(tempcup, tempsug: Integer;
           invobj: TnsinventoryC; beverageLCobj: TnsBeverageLC;
           out Lncupsdis : Integer; out Lsp : Real ;
           out Lcostprice: Real; out Lmleak: Real; out Lwleak: Real ):string;
  function countleakage(out Lmleak: Real; out Lwleak :Real; tempcup: Integer{; beverageSCobj:beverageSC}):string;
  function update(invobj: TnsinventoryC; beverageLCobj: TnsBeverageLC; tempcup, tempsug:integer):string;
  procedure used(invobj: TnsinventoryC; beverageLCobj: TnsBeverageLC; tempcup:integer);
  procedure costprice(beverageLCobj: TnsBeverageLC; tempcup, tempsug:integer; out Lcostprice:real);
  property cp: Real read Fcp write Fcp;
  property tl: Real read Ftl write Ftl;
  property w: Real read Fw write Fw;
  property mi: Real read Fmi write Fmi;
  property sug: Real read Fsug write Fsug;
  property sellp: Real read Fsellp write Fsellp;
  end;

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//                                         Strong Tea

  TnsBeverageST=class
  private
  Fcp:Real;
  Ftl:Real;
  Fw:Real;
  Fmi:Real;
  Fsug:Real;
  Fsellp:Real;
  public
  constructor create;
  function dispenseSTcheck(tempcup, tempsug: Integer;
           invobj: TnsinventoryC; beverageSTobj: TnsBeverageST;
           out Lncupsdis : Integer; out Lsp : Real ;
           out Lcostprice: Real; out Lmleak: Real; out Lwleak: Real ):string;
  function countleakage(out Lmleak: Real; out Lwleak :Real; tempcup: Integer{; beverageSCobj:beverageSC}):string;
  function update(invobj: TnsinventoryC; beverageSTobj: TnsBeverageST; tempcup, tempsug:integer):string;
  procedure used(invobj: TnsinventoryC; beverageSTobj: TnsBeverageST; tempcup:integer);
  procedure costprice(beverageSTobj: TnsBeverageST; tempcup, tempsug:integer; out Lcostprice:real);
  property cp: Real read Fcp write Fcp;
  property tl: Real read Ftl write Ftl;
  property w: Real read Fw write Fw;
  property mi: Real read Fmi write Fmi;
  property sug: Real read Fsug write Fsug;
  property sellp: Real read Fsellp write Fsellp;
  end;

//--------------------------------------------------------------------------------------------------------------------------------------------------
//                                            Light Tea
  TnsBeverageLT=class
  private
  Fcp:Real;
  Ftl:Real;
  Fw:Real;
  Fmi:Real;
  Fsug:Real;
  Fsellp:Real;
  public
  constructor create;
  function dispenseLTcheck(tempcup, tempsug: Integer;
           invobj: TnsinventoryC; beverageLTobj: TnsBeverageLT;
           out Lncupsdis : Integer; out Lsp : Real ;
           out Lcostprice: Real; out Lmleak: Real; out Lwleak: Real ):string;
  function countleakage(out Lmleak: Real; out Lwleak :Real; tempcup: Integer):string;
  function update(invobj: TnsinventoryC; beverageLTobj: TnsBeverageLT; tempcup, tempsug:integer):string;
  procedure used(invobj: TnsinventoryC; beverageLTobj: TnsBeverageLT; tempcup:integer);
  procedure costprice(beverageLTobj: TnsBeverageLT; tempcup, tempsug:integer; out Lcostprice:real);
  property cp: Real read Fcp write Fcp;
  property tl: Real read Ftl write Ftl;
  property w: Real read Fw write Fw;
  property mi: Real read Fmi write Fmi;
  property sug: Real read Fsug write Fsug;
  property sellp: Real read Fsellp write Fsellp;
  end;



var
  //beverageSCobj: beverageSC;
  inventoryobj: TnsinventoryC;

implementation
uses
  machineunit;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//                                       Strong Coffee Dispense

constructor TnsBeverageSC.create;
begin
  cp:=4;
  tl:=0;
  w:=100;
  mi:=50;
  sug:=2;
  {mloss:=2.5;
  wloss:=5;}
  sellp:=17.5;
end;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TnsBeverageSC.countleakage;
begin
    (*
    Intent
    -calculate total milk and water leak occured and Lmleak and Lwleak are out parameters of DispenseSCcheck

    Caller
    -Strong Coffee dispense check function
    *)
  Lmleak :=  MLOSS * tempcup;
  Lwleak :=  WLOSS * tempcup;
end;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TnsBeverageSC.update(invobj: TnsinventoryC; beverageSCobj: TnsBeverageSC; tempcup, tempsug:integer):string;
begin
  {*
  Intent: Updates the inventory after dispensing Strong Coffee cups.

  Parameters:
  - invobj: An instance of the TnsinventoryC class, representing the inventory object.
  - beverageSCobj: An instance of the TnsBeverageSC class, representing the Strong Coffee beverage.
  - tempcup: Integer, representing the number of cups dispensed.
  - tempsug: Integer, representing the choice of with (1) or without (0) sugar for dispensing.

  Logic:
  - Subtracts the consumed quantities of tea leaves, coffee powder, sugar, milk, and water from the inventory.
  - If sugar is included in the recipe (tempsug=1), subtracts sugar from the inventory as well.
  - Displays a message showing the updated stock levels after dispensing.
  *}
  invobj.tealeaves := invobj.tealeaves - beverageSCobj.tl * tempcup;
  invobj.coffeepowder := invobj.coffeepowder - beverageSCobj.cp * tempcup;
  if (tempsug=1)then
  begin
    invobj.sugar := invobj.sugar - beverageSCobj.sug*tempcup;
  end;
  invobj.milk := invobj.milk - beverageSCobj.mi * tempcup;
  invobj.water := invobj.water - beverageSCobj.w * tempcup;
  showmessage('Stock Left After Dispense :' +slinebreak+
  'tl= ' +floattostr(invobj.tealeaves) +slinebreak+
  'cp= ' +floattostr(invobj.coffeepowder) +slinebreak+
  'sug= ' + floattostr(invobj.sugar) +slinebreak+
  'mi= ' +floattostr(invobj.milk) +slinebreak+
  'w= ' + floattostr(invobj.water));
end;

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------

procedure TnsBeverageSC.used(invobj: TnsinventoryC; beverageSCobj: TnsBeverageSC; tempcup:integer);
var
  utl, ucp, usug, um, uw:Real;
begin
  {*
  Intent: Records the quantities of inventory used during the dispensing process of Strong Coffee.

  Parameters:
  - invobj: An instance of the TnsinventoryC class, representing the inventory object.
  - beverageSCobj: An instance of the TnsBeverageSC class, representing the Strong Coffee beverage.
  - tempcup: Integer, representing the number of cups dispensed.

  Logic:
  - Calculates the quantities of tea leaves (utl), coffee powder (ucp), sugar (usug), milk (um), and water (uw)
    used during the dispensing process for the specified number of cups.
  - Displays a message showing the quantities of each item used for dispensing.
  - Updates the total used quantities in the inventory object.

  Assumptions:
  - Assumes that the dispensing process has already been completed, and the inventory quantities are sufficient for the specified number of cups.
  *}
  utl := beverageSCobj.tl * tempcup;
  ucp := beverageSCobj.cp * tempcup;
  usug := beverageSCobj.sug * tempcup;
  um := beverageSCobj.mi * tempcup;
  uw := beverageSCobj.w * tempcup;
  showmessage('Stock  Used For Dispense :' +slinebreak+
  'tl= ' +floattostr(utl) +slinebreak+
  'cp= ' +floattostr(ucp) +slinebreak+
  'sug= ' + floattostr(usug) +slinebreak+
  'mi= ' +floattostr(um) +slinebreak+
  'w= ' +floattostr(uw));
  invobj.utl:=  invobj.utl+utl;
  invobj.ucp:=  invobj.ucp+ucp;
  invobj.usug:=  invobj.usug+usug;
  invobj.um:=  invobj.um+um;
  invobj.uw:=  invobj.uw+uw;
end;

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

procedure TnsBeverageSC.costprice;
begin
  {*
  Intent: Calculates the cost price for the Strong Coffee dispensed based on the recipe and sugar level.

  Parameters:
  - beverageSCobj: An instance of the TnsBeverageSC class, representing the Strong Coffee beverage.
  - tempcup: Integer, representing the number of cups dispensed.
  - tempsug: Integer, representing the choice of with (1) or without (0) sugar for dispensing.
  - Lcostprice: Out parameter, Real, returns the calculated cost price for the dispensed cups.

  Logic:
  - Calculates the cost price by considering the quantities of tea leaves, coffee powder, sugar, milk, and water used.
  - If sugar is included in the recipe (tempsug=1), includes the cost of sugar in the calculation.
  - Assigns the calculated cost price to the out parameter Lcostprice.

  Assumptions:
  - Assumes that the dispensing process has already been completed, and the required quantities are available in the beverage object.
  *}
  if(tempsug=1)then
  begin
    Lcostprice := TEALEAVESCP * beverageSCobj.tl * tempcup + COFFEEPOWDERCP * beverageSCobj.cp * tempcup +
                   MILKCP * beverageSCobj.mi * tempcup + WATERCP * beverageSCobj.w * tempcup +
                   SUGARCP * beverageSCobj.sug * tempcup;
  end
  else
  begin
    Lcostprice := TEALEAVESCP*beverageSCobj.tl*tempcup + coffeepowderCP*beverageSCobj.cp*tempcup +
                   milkCP*beverageSCobj.mi*tempcup + waterCP*beverageSCobj.w*tempcup;
   end;
end;

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TnsBeverageSC.dispenseSCcheck(tempcup, tempsug: integer; invobj: TnsinventoryC; beverageSCobj: TnsBeverageSC;
         out Lncupsdis : Integer; out Lsp : Real; out Lcostprice:real ; out Lmleak:real; out Lwleak:real):string;
begin
  {*
  Intent: Handles the dispensing process for Strong Coffee and performs checks on inventory levels.

  Parameters:
  - tempcup: Integer, representing the number of cups to be dispensed.
  - tempsug: Integer, representing the choice of with (1) or without (0) sugar for dispensing.
  - invobj: An instance of the TnsinventoryC class, representing the inventory object.
  - beverageSCobj: An instance of the TnsBeverageSC class, representing the Strong Coffee beverage.
  - Lncupsdis: Out parameter, Integer, returns the number of cups dispensed.
  - Lsp: Out parameter, Real, returns the selling price of the dispensed cups.
  - Lcostprice: Out parameter, Real, returns the total cost price of the dispensed cups.
  - Lmleak: Out parameter, Real, returns the total milk leakage during dispensing.
  - Lwleak: Out parameter, Real, returns the total water leakage during dispensing.

  Assumptions:
  - Assumes that the required ingredients for Strong Coffee (coffee powder, tea leaves, water, sugar)
    are available in the inventory.

  Logic:
  - Checks if there is sufficient inventory to dispense the specified number of cups of Strong Coffee.
  - If sufficient, dispenses the cups, updates the inventory, calculates cost price, and counts leakage.
  - Displays messages for successful dispensing or insufficient inventory.
  - Checks if inventory levels are below threshold values and prompts a refill message.

  Result: Returns a string indicating the success or failure of the dispensing process.
  *}

 try
    if (beverageSCobj.cp*tempcup <= invobj.coffeepowder) and(beverageSCobj.tl*tempcup <= invobj.tealeaves)and(beverageSCobj.w*tempcup <= invobj.water)
    and(beverageSCobj.sug*tempcup <= invobj.sugar) then
    begin
      showmessage('dispense strong coffee ' + inttostr(tempcup) + ' cups');
      beverageSCobj.update(invobj, beverageSCobj, tempcup, tempsug);
      beverageSCobj.used(invobj, beverageSCobj, tempcup);
      beverageSCobj.costprice(beverageSCobj, tempcup, tempsug, Lcostprice);
      beverageSCobj.countleakage(Lmleak, Lwleak, tempcup);
      (*if(tempsug=1)then
      begin
        Lcostprice := tealeavesCP * beverageSCobj.tl * tempcup + coffeepowderCP*beverageSCobj.cp*tempcup +
                   milkCP*beverageSCobj.mi*tempcup + waterCP*beverageSCobj.w*tempcup + sugarCP*beverageSCobj.sug*tempcup;
      end
      else
      begin
        Lcostprice := tealeavesCP*beverageSCobj.tl*tempcup + coffeepowderCP*beverageSCobj.cp*tempcup +
                   milkCP*beverageSCobj.mi*tempcup + waterCP*beverageSCobj.w*tempcup;
      end;*)
      Lncupsdis := tempcup;
      Lsp := beverageSCobj.sellp;
      ShowMessage('amount: '+ floattostr(Lsp*Lncupsdis)+'rupees');
    end
    else
    begin
      showmessage('cannot dispense these many cups ');
      Lncupsdis := 0;
      Lsp := 0;
      Lcostprice:=0;
      Lmleak:=0;
      Lwleak:=0;
    end;
    if(invobj.tealeaves <= 50)or (invobj.coffeepowder <= 50)or (invobj.sugar <= 50)or
      (invobj.milk <= 4000)or (invobj.water <= 600) then
    begin
      showmessage('threshold value reached , refill ASAP!');
    end;
 finally
  beverageSCobj.free;
 end;
end;




//----------------------------------------------------------------------------------------------------------
//                                         Light Coffe dispense

constructor TnsBeverageLC.create;
begin
  cp:=2;
  tl:=0;
  w:=100;
  mi:=60;
  sug:=1.5;
  {mloss:=2.5;
  wloss:=5;}
  sellp:=16.5;
end;

//-----------------------------------------------------------------------------------------------------------

function TnsBeverageLC.countleakage;
begin
  Lmleak :=  MLOSSLC * tempcup;
  Lwleak :=  WLOSS * tempcup;
end;

//--------------------------------------------------------------------------------------------------------------

function TnsBeverageLC.update;
begin
  invobj.tealeaves := invobj.tealeaves - beverageLCobj.tl * tempcup;
  invobj.coffeepowder := invobj.coffeepowder - beverageLCobj.cp * tempcup;
  if (tempsug=1)then
  begin
    invobj.sugar := invobj.sugar - beverageLCobj.sug*tempcup;
  end;
  invobj.milk := invobj.milk - beverageLCobj.mi * tempcup ;
  invobj.water := invobj.water - beverageLCobj.w * tempcup;
  showmessage('Stock Left After Dispense :' +slinebreak+
  'tl= ' +floattostr(invobj.tealeaves) +slinebreak+
  'cp= ' +floattostr(invobj.coffeepowder) +slinebreak+
  'sug= ' + floattostr(invobj.sugar) +slinebreak+
  'mi= ' +floattostr(invobj.milk) +slinebreak+
  'w= ' + floattostr(invobj.water));
end;

//-----------------------------------------------------------------------------------------------------------

procedure TnsBeverageLC.used;
var
  utl, ucp, usug, um, uw:real;
begin
  utl := beverageLCobj.tl * tempcup;
  ucp := beverageLCobj.cp * tempcup;
  usug := beverageLCobj.sug * tempcup;
  um := beverageLCobj.mi * tempcup;
  uw := beverageLCobj.w * tempcup;
  showmessage('Stock  Used For Dispense :' +slinebreak+
  'tl= ' +floattostr(utl) +slinebreak+
  'cp= ' +floattostr(ucp) +slinebreak+
  'sug= ' + floattostr(usug) +slinebreak+
  'mi= ' +floattostr(um) +slinebreak+
  'w= ' +floattostr(uw));
  invobj.utl:=  invobj.utl+utl;
  invobj.ucp:=  invobj.ucp+ucp;
  invobj.usug:=  invobj.usug+usug;
  invobj.um:=  invobj.um+um;
  invobj.uw:=  invobj.uw+uw;
end;

//-----------------------------------------------------------------------------------------------------------

procedure TnsBeverageLC.costprice;
begin
  if(tempsug=1)then
  begin
    Lcostprice := TEALEAVESCP * beverageLCobj.tl * tempcup + COFFEEPOWDERCP * beverageLCobj.cp * tempcup +
                   MILKCP * beverageLCobj.mi * tempcup + WATERCP * beverageLCobj.w * tempcup +
                   SUGARCP * beverageLCobj.sug * tempcup;
  end
  else
  begin
    Lcostprice := TEALEAVESCP*beverageLCobj.tl*tempcup + coffeepowderCP*beverageLCobj.cp*tempcup +
                   milkCP*beverageLCobj.mi*tempcup + waterCP*beverageLCobj.w*tempcup;
   end;
end;

//-----------------------------------------------------------------------------------------------------------

function TnsBeverageLC.dispenseLCcheck;
begin
 try
    if (beverageLCobj.cp*tempcup <= invobj.coffeepowder) and(beverageLCobj.tl*tempcup <= invobj.tealeaves)and
    (beverageLCobj.w*tempcup <= invobj.water)
    and(beverageLCobj.sug*tempcup <= invobj.sugar) then
    begin
      showmessage('dispense Light Coffee ' + inttostr(tempcup) + 'cups' );
      beverageLCobj.update(invobj, beverageLCobj, tempcup, tempsug);
      beverageLCobj.used(invobj, beverageLCobj, tempcup);
      beverageLCobj.costprice(beverageLCobj, tempcup, tempsug, Lcostprice);
      beverageLCobj.countleakage(Lmleak, Lwleak, tempcup);
      Lncupsdis := tempcup;
      Lsp := beverageLCobj.sellp;
      ShowMessage('amount: '+ floattostr(Lsp*Lncupsdis)+'rupees');
    end
    else
    begin
      showmessage('cannot dispense these many cups ');
      Lncupsdis := 0;
      Lsp := 0;
      Lcostprice:=0;
      Lmleak:=0;
      Lwleak:=0;
    end;
    if(invobj.tealeaves <= 50)or (invobj.coffeepowder <= 50)or (invobj.sugar <= 50)or
      (invobj.milk <= 4000)or (invobj.water <= 600) then
    begin
      showmessage('threshold value reached , refill ASAP!');
    end;
 finally
  beverageLCobj.free;
 end;
end;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
//                                                Strong Tea Dispense

constructor TnsBeverageST.create;
begin
  cp:=0;
  tl:=4;
  w:=150;
  mi:=30;
  sug:=2;
  {mloss:=2.5;
  wloss:=5;}
  sellp:=15.50;
end;

//----------------------------------------------------------------------------------------------------------------------------

function TnsBeverageST.countleakage;
begin
  Lmleak :=  MLOSSST * tempcup;
  Lwleak :=  WLOSST * tempcup;
end;

//--------------------------------------------------------------------------------------------------------------------------------

function TnsBeverageST.update;
begin
  invobj.tealeaves := invobj.tealeaves - beverageSTobj.tl * tempcup;
  invobj.coffeepowder := invobj.coffeepowder - beverageSTobj.cp * tempcup;
  if (tempsug=1)then
  begin
    invobj.sugar := invobj.sugar - beverageSTobj.sug*tempcup;
  end;
  invobj.milk := invobj.milk - beverageSTobj.mi * tempcup;
  invobj.water := invobj.water - beverageSTobj.w * tempcup;
  showmessage('Stock Left After Dispense :' +slinebreak+
  'tl= ' +floattostr(invobj.tealeaves) +slinebreak+
  'cp= ' +floattostr(invobj.coffeepowder) +slinebreak+
  'sug= ' + floattostr(invobj.sugar) +slinebreak+
  'mi= ' +floattostr(invobj.milk) +slinebreak+
  'w= ' + floattostr(invobj.water));
end;

//----------------------------------------------------------------------------------------------------------------------------------

procedure TnsBeverageST.used;
var
  utl, ucp, usug, um, uw:real;
begin
  utl := beverageSTobj.tl * tempcup;
  ucp := beverageSTobj.cp * tempcup;
  usug := beverageSTobj.sug * tempcup;
  um := beverageSTobj.mi * tempcup;
  uw := beverageSTobj.w * tempcup;
  showmessage('Stock  Used For Dispense :' +slinebreak+
  'tl= ' +floattostr(utl) +slinebreak+
  'cp= ' +floattostr(ucp) +slinebreak+
  'sug= ' + floattostr(usug) +slinebreak+
  'mi= ' +floattostr(um) +slinebreak+
  'w= ' +floattostr(uw));
  invobj.utl:=  invobj.utl+utl;
  invobj.ucp:=  invobj.ucp+ucp;
  invobj.usug:=  invobj.usug+usug;
  invobj.um:=  invobj.um+um;
  invobj.uw:=  invobj.uw+uw;
end;

//----------------------------------------------------------------------------------------------------------------

procedure TnsBeverageST.costprice;
begin
  if(tempsug=1)then
  begin
    Lcostprice := TEALEAVESCP * beverageSTobj.tl * tempcup + COFFEEPOWDERCP * beverageSTobj.cp * tempcup +
                   MILKCP * beverageSTobj.mi * tempcup + WATERCP * beverageSTobj.w * tempcup +
                   SUGARCP * beverageSTobj.sug * tempcup;
  end
  else
  begin
    Lcostprice := TEALEAVESCP*beverageSTobj.tl*tempcup + coffeepowderCP*beverageSTobj.cp*tempcup +
                   milkCP*beverageSTobj.mi*tempcup + waterCP*beverageSTobj.w*tempcup;
   end;
end;

//----------------------------------------------------------------------------------------------------------------

function TnsBeverageST.dispenseSTcheck;
begin
 try
    if (beverageSTobj.cp*tempcup <= invobj.coffeepowder) and(beverageSTobj.tl*tempcup <= invobj.tealeaves)and
    (beverageSTobj.w*tempcup <= invobj.water)
    and(beverageSTobj.sug*tempcup <= invobj.sugar) then
    begin
      showmessage('dispense Strong Tea ' + inttostr(tempcup) + 'cups' );
      beverageSTobj.update(invobj, beverageSTobj, tempcup, tempsug);
      beverageSTobj.used(invobj, beverageSTobj, tempcup);
      beverageSTobj.costprice(beverageSTobj, tempcup, tempsug, Lcostprice);
      beverageSTobj.countleakage(Lmleak, Lwleak, tempcup);
      Lncupsdis := tempcup;
      Lsp := beverageSTobj.sellp;
      ShowMessage('amount: '+ floattostr(Lsp*Lncupsdis)+'rupees');
    end
    else
    begin
      showmessage('cannot dispense these many cups ');
      Lncupsdis := 0;
      Lsp := 0;
      Lcostprice:=0;
      Lmleak:=0;
      Lwleak:=0;
    end;
    if(invobj.tealeaves <= 50)or (invobj.coffeepowder <= 50)or (invobj.sugar <= 50)or
      (invobj.milk <= 4000)or (invobj.water <= 600) then
    begin
      showmessage('threshold value reached , refill ASAP!');
    end;
 finally
  beverageSTobj.free;
 end;
end;

//--------------------------------------------------------------------------------------------------------------------------------------------------
//                                              Light Tea Dispense

constructor TnsBeverageLT.create;
begin
  cp:=0;
  tl:=3;
  w:=150;
  mi:=40;
  sug:=1.5;
  {mloss:=2.5;
  wloss:=5;}
  sellp:=15;
end;

//--------------------------------------------------------------------------------------------------------------------------------

function TnsBeverageLT.countleakage;
begin
  Lmleak :=  MLOSSLT * tempcup;
  Lwleak :=  WLOSST * tempcup;
end;

//--------------------------------------------------------------------------------------------------------------------------------

function TnsBeverageLT.update;
begin
  invobj.tealeaves := invobj.tealeaves - beverageLTobj.tl * tempcup;
  invobj.coffeepowder := invobj.coffeepowder - beverageLTobj.cp * tempcup;
  if (tempsug=1)then
  begin
    invobj.sugar := invobj.sugar - beverageLTobj.sug*tempcup;
  end;
  invobj.milk := invobj.milk - beverageLTobj.mi * tempcup;
  invobj.water := invobj.water - beverageLTobj.w * tempcup;
  showmessage('Stock Left After Dispense :' +slinebreak+
  'tl= ' +floattostr(invobj.tealeaves) +slinebreak+
  'cp= ' +floattostr(invobj.coffeepowder) +slinebreak+
  'sug= ' + floattostr(invobj.sugar) +slinebreak+
  'mi= ' +floattostr(invobj.milk) +slinebreak+
  'w= ' + floattostr(invobj.water));
end;

//----------------------------------------------------------------------------------------------------------------------------------

procedure TnsBeverageLT.used;
var
  utl, ucp, usug, um, uw:real;
begin
  utl := beverageLTobj.tl * tempcup;
  ucp := beverageLTobj.cp * tempcup;
  usug := beverageLTobj.sug * tempcup;
  um := beverageLTobj.mi * tempcup;
  uw := beverageLTobj.w * tempcup;
  showmessage('Stock  Used For Dispense :' +slinebreak+
  'tl= ' +floattostr(utl) +slinebreak+
  'cp= ' +floattostr(ucp) +slinebreak+
  'sug= ' + floattostr(usug) +slinebreak+
  'mi= ' +floattostr(um) +slinebreak+
  'w= ' +floattostr(uw));
  invobj.utl:=  invobj.utl+utl;
  invobj.ucp:=  invobj.ucp+ucp;
  invobj.usug:=  invobj.usug+usug;
  invobj.um:=  invobj.um+um;
  invobj.uw:=  invobj.uw+uw;
end;

//----------------------------------------------------------------------------------------------------------------

procedure TnsBeverageLT.costprice;
begin
  if(tempsug=1)then
  begin
    Lcostprice := TEALEAVESCP * beverageLTobj.tl * tempcup + COFFEEPOWDERCP * beverageLTobj.cp * tempcup +
                   MILKCP * beverageLTobj.mi * tempcup + WATERCP * beverageLTobj.w * tempcup +
                   SUGARCP * beverageLTobj.sug * tempcup;
  end
  else
  begin
    Lcostprice := TEALEAVESCP*beverageLTobj.tl*tempcup + coffeepowderCP*beverageLTobj.cp*tempcup +
                   milkCP*beverageLTobj.mi*tempcup + waterCP*beverageLTobj.w*tempcup;
   end;
end;

//----------------------------------------------------------------------------------------------------------------

function TnsBeverageLT.dispenseLTcheck;
begin
 try
    if (beverageLTobj.cp*tempcup <= invobj.coffeepowder) and(beverageLTobj.tl*tempcup <= invobj.tealeaves)and
    (beverageLTobj.w*tempcup <= invobj.water)
    and(beverageLTobj.sug*tempcup <= invobj.sugar) then
    begin
      showmessage('dispense Light Tea ' + inttostr(tempcup) + 'cups' );
      beverageLTobj.update(invobj, beverageLTobj, tempcup, tempsug);
      beverageLTobj.used(invobj, beverageLTobj, tempcup);
      beverageLTobj.costprice(beverageLTobj, tempcup, tempsug, Lcostprice);
      beverageLTobj.countleakage(Lmleak, Lwleak, tempcup);
      Lncupsdis := tempcup;
      Lsp := beverageLTobj.sellp;
      ShowMessage('amount: '+ floattostr(Lsp*Lncupsdis)+'rupees');
    end
    else
    begin
      showmessage('cannot dispense these many cups ');
      Lncupsdis := 0;
      Lsp := 0;
      Lcostprice:=0;
      Lmleak:=0;
      Lwleak:=0;
    end;
    if(invobj.tealeaves <= 50)or (invobj.coffeepowder <= 50)or (invobj.sugar <= 50)or
      (invobj.milk <= 4000)or (invobj.water <= 600) then
    begin
      showmessage('threshold value reached , refill ASAP!');
    end;
 finally
  beverageLTobj.free;
 end;
end;

end.
