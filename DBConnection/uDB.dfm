object DBConnection: TDBConnection
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 198
  Width = 282
  object DatabaseConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=ProjektWAT')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
end
