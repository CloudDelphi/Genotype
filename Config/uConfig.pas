{
Program:      Genotyp Projekt WAT.
File:         uConfig
Description:  Obiekt parametrów konfiguracyjnych systemu
Notes:
2018-03-10    Piotr Murawski  Rozpoczêcie projektu
}

unit uConfig;

interface
type
  TConfig = class
    private
      FDataBaseUserPassword: String;
      FDatabaseServerAddress: String;
      FDataBaseUserName: String;
      FUserPassword: String;
      FDataBaseName: String;
      FUserName: String;
      procedure SetDataBaseName(const Value: String);
      procedure SetDatabaseServerAddress(const Value: String);
      procedure SetDataBaseUserName(const Value: String);
      procedure SetDataBaseUserPassword(const Value: String);
      procedure SetUserName(const Value: String);
      procedure SetUserPassword(const Value: String);
    public
      constructor Create();
      property UserName:String read FUserName write SetUserName;
      property UserPassword:String read FUserPassword write SetUserPassword;
      property DataBaseName:String read FDataBaseName write SetDataBaseName;
      property DatabaseServerAddress:String read FDatabaseServerAddress write SetDatabaseServerAddress;
      property DataBaseUserName:String read FDataBaseUserName write SetDataBaseUserName;
      property DataBaseUserPassword:String read FDataBaseUserPassword write SetDataBaseUserPassword;
  end;

var
  Config:TConfig;

implementation
uses System.SysUtils;

{ TConfig }

constructor TConfig.Create;
begin
  FDataBaseName:='ProjektWAT';
  FDataBaseUserName:='genotyp';
  FDataBaseUserPassword:='genotyp';
  FDatabaseServerAddress:='192.168.5.50';
  FUserPassword:='';
  FUserName:='';
end;

procedure TConfig.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;

procedure TConfig.SetDatabaseServerAddress(const Value: String);
begin
  FDatabaseServerAddress := Value;
end;

procedure TConfig.SetDataBaseUserName(const Value: String);
begin
  FDataBaseUserName := Value;
end;

procedure TConfig.SetDataBaseUserPassword(const Value: String);
begin
  FDataBaseUserPassword := Value;
end;

procedure TConfig.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

procedure TConfig.SetUserPassword(const Value: String);
begin
  FUserPassword := Value;
end;

initialization
  Config:=TConfig.Create();

finalization
  FreeAndNil(Config);

end.
