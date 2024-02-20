program vendingmachine;

uses
  Forms,
  vendmainunit in 'vendmainunit.pas' {Form1},
  bevunit in 'bevunit.pas',
  machineunit in 'machineunit.pas',
  inventoryunit in 'inventoryunit.pas' {Form2};

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
