{
Program:      Genotyp Projekt WAT
File:         OknoDodajOsobe
Description:  Plik okna administratora - dodawanie osob do bazy
Notes:        KATARZYNA NOWAK - formatka, dodawanie pacjentów
}

unit OknoDodajPacjenta;

interface

uses
   ConnectionModule,uDB, Entities, IdGlobal, IdHash, IdHashMessageDigest,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style, System.Hash,
  FMX.ScrollBox, FMX.Grid, System.Generics.Collections, Data.DB,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Aurelius.Criteria.Linq, FMX.Ani, FMX.Layouts,
  FMX.ExtCtrls, FMX.Edit, FMX.ListBox, Windows, Aurelius.Engine.ObjectManager, StrUtils;

type
  TForm10 = class(TForm)
    Zamknij: TButton;
    Imie: TEdit;
    Nazwisko: TEdit;
    Pesel: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dodaj: TButton;
    Brush1: TBrushObject;
    ComboJednostka: TComboBox;
    Jednostka: TLabel;
    Odswiez: TButton;
    procedure ZamknijClick(Sender: TObject);
    procedure DodajClick(Sender: TObject);
    procedure OdswiezClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.fmx}

procedure TForm10.OdswiezClick(Sender: TObject);

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

procedure TForm10.DodajClick(Sender: TObject);
var
 INosoba :TOsoba;
 INpacjent :TPacjent;
 UserList: TList<Tpacjent>;
 OsobaList: TList<TOsoba>;
PobranaJednostka:TList<Tjednostka>;
begin

  if Imie.Text = '' then
   begin
    ShowMessage('Pole nie mo¿e byæ puste, wprowadŸ IMIÊ!');
    end
  else
   begin
      if Nazwisko.Text = '' then
      begin
        ShowMessage('Pole nie mo¿e byæ puste, wprowadŸ NAZWISKO!');
      end
      else
      begin
          if Pesel.Text = '' then
          begin
            ShowMessage('Pole nie mo¿e byæ puste, wprowadŸ PESEL!');
          end
          else
          begin

            if Pesel.Text.Length<11 then
            begin
              ShowMessage('Nemer PESEL jest za krótki!');
            end
            else
            begin

              OsobaList:=DBConnection.Manager.Find<TOsoba>().Where(TLinq['PESEL'] = Pesel.Text).List;

              if OsobaList.Count=0 then
               begin
                    PobranaJednostka:=DBConnection.Manager.Find<Tjednostka>().Where(Linq['FnazwaJEDNOSTKA']=ComboJednostka.Items[ComboJednostka.ItemIndex]).List;
                    if PobranaJednostka.Count=1 then
                    begin
                        INosoba := Tosoba.Create;
                        INosoba.imieOSOBA := Imie.Text;
                        INosoba.nazwiskoOSOBA := Nazwisko.Text;
                        INosoba.PESEL :=Pesel.Text;
                        DBConnection.Manager.Save(INOsoba);

                        INpacjent := Tpacjent.Create;
                        INpacjent.OSOBA_idOSOBA:=INosoba;
                        INpacjent.JEDNOSTKA_idJEDNOSTKA:=PobranaJednostka.First;;
                        DBConnection.Manager.Save(INpacjent);

                        DBConnection.Manager.Flush;
                        UserList:=DBConnection.Manager.Find<Tpacjent>().List;
                        ShowMessage('Dodano. Numer identyfikacyjny pacjenta to: '+ UserList.Last.idPACJENT.ToString);

                        Pesel.Text :='';
                        Imie.Text  :='';
                        Nazwisko.Text:='';;
                    end;
               end
               else
               begin
                Pesel.Text:='';
                ShowMessage('PESEL ju¿ istnieje w bazie danych, wprowadŸ poprawny PESEL!');

               end;

            end
            end



        end
   end;



end;

procedure TForm10.FormCreate(Sender: TObject);
begin
    OdswiezClick(Sender);
end;

procedure TForm10.ZamknijClick(Sender: TObject);
begin
  Close;
end;

end.
