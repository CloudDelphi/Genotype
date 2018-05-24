{
Program:      Genotyp Projekt WAT
File:         OknoWyswietlPacjentow
Description:  Plik okna z wyswietlaniem pacjentów w bazie danych
Notes:        Kamil Rutkowski - formatka, pobieranie i wyswietlanie pacjentów

}
unit OknoWyswietlPacjentow;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, System.Generics.Collections, Entities, ConnectionModule, uDB;

type
  TForm11 = class(TForm)
    Zamknij: TButton;
    Odswiez: TButton;
    PatientGrid: TStringGrid;
    Imie: TStringColumn;
    Nazwisko: TStringColumn;
    PESEL: TStringColumn;
    Jednostka: TStringColumn;
    procedure ZamknijClick(Sender: TObject);
    procedure OdswiezClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.FormCreate(Sender: TObject);
begin
      OdswiezClick(Sender);
end;

procedure TForm11.OdswiezClick(Sender: TObject);
var
i:Int64;
PatientList:TList<Tpacjent>;
begin
  PatientList:=DBConnection.Manager.Find<Tpacjent>().List;
  try
    if(PatientList.Count>0) then
    begin
      PatientGrid.RowCount:=PatientList.Count;
      for i:=0 to PatientList.Count-1 do
        begin
          PatientGrid.Cells[0,i]:=PatientList[i].OSOBA_idOSOBA.imieOSOBA;
          PatientGrid.Cells[1,i]:=PatientList[i].OSOBA_idOSOBA.nazwiskoOSOBA;
          PatientGrid.Cells[2,i]:=PatientList[i].OSOBA_idOSOBA.PESEL;
          PatientGrid.Cells[3,i]:=PatientList[i].JEDNOSTKA_idJEDNOSTKA.nazwaJEDNOSTKA;
        end;
    end;
  finally
    if assigned(PatientList) then
     freeAndNil(PatientList);
  end;

end;

procedure TForm11.ZamknijClick(Sender: TObject);
begin
        Close;

end;

end.
