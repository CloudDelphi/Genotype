  {
Program:      Genotyp Projekt WAT
File:         Entities
Description:  Okno importowania wynoków badañ
Notes:
              Katarzyna Nowak - wczytanie z pliku wartoœci Allelów do Tablicy

}
unit OknoImport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ComboEdit, System.Rtti,
  FMX.Grid.Style, FMX.Memo, FMX.ScrollBox, FMX.Grid;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Importuj: TButton;
    Memo1: TMemo;
    Koniec: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Brush1: TBrushObject;


    procedure ImportujClick(Sender: TObject);
    procedure KoniecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses OknoLaborant;

{$R *.fmx}

procedure TForm1.ImportujClick(Sender: TObject);

    var
    Linia, Ilosc_wierszy    : string;
    plik      : TextFile;
    Liniav    : PWideChar ;
    i         :integer;
    TablicaAllel_1   : Array[0..15] of String;
    TablicaAllel_2   : Array[0..15] of String;
begin

  AssignFile(plik, Edit1.Text) ;
  reset(plik);
  readln(plik);

  for i := 0 to 14 do
      begin

    readln(plik,linia);

      GetMem(Liniav, sizeof(WideChar) * Succ(Length(Linia)));
      StringToWideChar(Linia, Liniav, Succ(Length(Linia)));
      ExtractStrings([#9], [], Liniav, Memo1.Lines) ;
      Ilosc_wierszy := Memo1.Lines.Count.ToString;  {liczba wszystkich 14/(gdy nie ma 2 wartoœci markera to 13)}

      if(Ilosc_wierszy='14') then
        begin
        TablicaAllel_1[i]:= Memo1.Lines[2];
        TablicaAllel_2[i]:= Memo1.Lines[3];
        Memo1.Lines.Clear;


      end;


      if(Ilosc_wierszy='13') then
        begin
        TablicaAllel_1[i]:= Memo1.Lines[2];
        TablicaAllel_2[i]:= Memo1.Lines[2];
        Memo1.Lines.Clear;


      end;

    end ;

     ShowMessage('Zaimportowano.')
   end;



procedure TForm1.KoniecClick(Sender: TObject);
begin
  Form1.Hide;
  Form1.Close;
  Form4.ShowModal;
end;


end.





