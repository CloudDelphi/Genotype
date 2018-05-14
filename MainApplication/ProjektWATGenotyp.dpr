program ProjektWATGenotyp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ConnectionModule in '..\DBConnection\ConnectionModule.pas' {FireDacMySQLConnection: TDataModule},
  OknoLogowania in 'OknoLogowania.pas' {Form2},
  OknoSekretarka in 'OknoSekretarka.pas' {Form3},
  OknoLaborant in 'OknoLaborant.pas' {Form4},
  OknoAdministrator in 'OknoAdministrator.pas' {Form5},
  OknoImport in 'OknoImport.pas' {Form1},
  OknoWyswietlUzytkownikow in 'OknoWyswietlUzytkownikow.pas' {Form6},
  OknoDodajKonto in 'OknoDodajKonto.pas' {Form7},
  OknoDodajOsobe in 'OknoDodajOsobe.pas' {Form8},
  OknoDodajJednostke in 'OknoDodajJednostke.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
