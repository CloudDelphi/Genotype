{
Program:      Genotyp Projekt WAT
File:         OknoImportSlowniki
Description:  Plik okna importu rekordów s³ownikowych alleli do bazy danych
Notes:        Kamil Rutkowski - formatka + import

}

unit OknoImportSlowniki;

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
  TForm12 = class(TForm)
    sciezkaEdit: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    zamknijButton: TButton;
    importujButton: TButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure zamknijButtonClick(Sender: TObject);
    procedure importujButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.fmx}

procedure TForm12.zamknijButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm12.importujButtonClick(Sender: TObject);
var
i: Int64;
plik: TextFile;
linia: String;
allel: Tallele;
alleleInDB: TList<Tallele>;
begin
  
  if FileExists(sciezkaEdit.Text) then
  begin
    AssignFile(plik, sciezkaEdit.Text);
    reset(plik);
    i:=0;
    while not Eof(plik) do
      begin
        ReadLn(plik,linia);
        alleleInDB:=DBConnection.Manager.Find<Tallele>().Where(Linq['FnazwaALLELE']=linia).List;
        if(alleleInDB.Count=0) then
        begin
          allel:=Tallele.Create;
          allel.nazwaALLELE:=linia;
          allel.czyAKTYWNY:=1;
          DBConnection.Manager.Save(allel);
          DBConnection.Manager.Flush;
          i:=i+1;
        end
        else
        begin

        end;
      end;
      ShowMessage('Dodano ' + i.ToString + ' alleli do s³ownika');
  end;

end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    sciezkaEdit.Text:=opendialog1.FileName;
end;

end.
