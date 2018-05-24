{
Program:      Genotyp Projekt WAT
File:         OknoSekretarka
Description:  Plik okna sekretarki - wyœwietlanie rejestru i wprowadzanie danych pacjentów
Notes:        Katarzyna Nowak - formatka

}
unit OknoSekretarka;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.StdCtrls, FMX.Controls.Presentation, OknoDodajPacjenta, OknoWyswietlPacjentow;

type
  TForm3 = class(TForm)
    WprowadzDane: TButton;
    Label1: TLabel;
    ImageViewer1: TImageViewer;
    Label2: TLabel;
    WyswietlRejestr: TButton;
    Wyloguj: TButton;
    Brush1: TBrushObject;
    Brush2: TBrushObject;
    Brush3: TBrushObject;
    Brush4: TBrushObject;
    procedure WprowadzDaneClick(Sender: TObject);
    procedure WyswietlRejestrClick(Sender: TObject);
    procedure WylogujClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}
  uses OknoLogowania;
procedure TForm3.WprowadzDaneClick(Sender: TObject);
begin
  with TForm10.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TForm3.WylogujClick(Sender: TObject);
begin
  Close;
end;

procedure TForm3.WyswietlRejestrClick(Sender: TObject);
begin
  with TForm11.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
