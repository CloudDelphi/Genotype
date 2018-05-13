{
@@TODO:       WYŒWIETLANIE REJESTRU PACJENTÓW W BAZIE
              WPROWADZANIE NOWYCH REKORDÓW
}
unit OknoSekretarka;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.StdCtrls, FMX.Controls.Presentation;

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
procedure TForm3.WylogujClick(Sender: TObject);
begin

Form3.Hide;
Form3.Close;
Form2.ShowModal;


end;

end.
