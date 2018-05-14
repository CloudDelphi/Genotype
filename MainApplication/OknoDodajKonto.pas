{
Program:      Genotyp Projekt WAT
File:         OknoDodajUzytkownika
Description:  Plik okna z dodawaniem uzytkownikow do bazy danych
Notes:        Kamil Rutkowski - formatka + wyswietlanie uzytkownikow + dodawanie uzytkownikow

@@TODO: IMPORT OSOB, JEDNOSTEK, GRUP
        INSERT DO BAZY UTWORZONEGO UZYTKOWNIKA (manager.save(object);

}

unit OknoDodajKonto;

interface

uses
  ConnectionModule,uDB, Entities, IdGlobal, IdHash, IdHashMessageDigest,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style, System.Hash,
  FMX.ScrollBox, FMX.Grid, System.Generics.Collections, Data.DB,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Aurelius.Criteria.Linq, FMX.Ani, FMX.Layouts,
  FMX.ExtCtrls, FMX.Edit, FMX.ListBox, Windows, Aurelius.Engine.ObjectManager;


type
  TForm7 = class(TForm)
    ComboJednostka: TComboBox;
    Aktualizuj: TButton;
    Zamknij: TButton;
    procedure AktualizujClick(Sender: TObject);
    procedure ZamknijClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}



procedure TForm7.AktualizujClick(Sender: TObject);
var
i:Int64;
UnitList:TList<Tjednostka>;
begin

  UnitList:=DBConnection.Manager.Find<Tjednostka>().List;
  try
  ComboJednostka.Clear;
  for i:=0 to UnitList.Count-1 do
    ComboJednostka.Items.Add(UnitList[i].nazwaJEDNOSTKA);
  finally
    FreeAndNil(UnitList);
  end;
end;

procedure TForm7.ZamknijClick(Sender: TObject);
begin
  Form7.Hide;
  Form7.Close;
end;

end.

