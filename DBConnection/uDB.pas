{
Program:      Genotyp Projekt WAT.
File:         uDB
Description:  Podłaczenie do bazy danych MySQL Projekt
Notes:
2018-03-10    Piotr Murawski  Rozpoczęcie projektu
}

unit uDB;
interface


uses
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MySQL,
  Aurelius.Schema.MySQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Bind.Dataset,
  Aurelius.Criteria.Base,
  Aurelius.Types.Nullable,
  Aurelius.Criteria.Linq,
  Aurelius.Engine.DataBaseManager,
  Aurelius.Engine.ObjectManager,
  Aurelius.Criteria.Projections,
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Util, FireDAC.Comp.Script,
  FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  ConnectionModule,
  FireDAC.FMXUI.Wait, FireDAC.VCLUI.Wait;

type
  TDBConnection = class(TDataModule)
    DatabaseConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FConnection:IDBConnection;
    FManager: TObjectManager;
    function GetManager():TObjectManager;
  public
    property Connection:IDBConnection read FConnection write FConnection;
    property Manager: TObjectManager read GetManager write FManager;
    procedure ReCreateManager;
  end;


var
  DBConnection: TDBConnection;

implementation
uses System.UITypes, Aurelius.Drivers.Base;
{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TMyConnectionModule }

procedure TDBConnection.DataModuleCreate(Sender: TObject);
begin
  try
    FConnection:=TFireDacMySQLConnection.CreateConnection();
    TDataBaseManager.Update(FConnection);
    FManager:= TObjectManager.Create(FConnection);
  except
    //Do nothink
  end;
end;

procedure TDBConnection.DataModuleDestroy(Sender: TObject);
begin
  DatabaseConnection.Connected:=false;
  if Assigned(FManager) then
    FManager.Free;
end;

function TDBConnection.GetManager: TObjectManager;
begin
  if not Assigned(FManager) then
    begin
      FManager:= TObjectManager.Create(FConnection);
    end;
  result := FManager;
end;

procedure TDBConnection.ReCreateManager;
begin
  if Assigned(FManager) then
    begin
      FManager.Flush;
      FManager.Clear;
      FreeAndNil(FManager);
    end;
  FManager := TObjectManager.Create(FConnection);
end;

initialization
  DBConnection:=TDBConnection.Create(nil);

finalization
  DBConnection.Free;
end.
