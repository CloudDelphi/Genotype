unit db;

interface

uses
  SysUtils,
  Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary;

type
  Taktywnosc = class;
  Tallele = class;
  Tbadanie = class;
  Tfunkcja = class;
  Tfunkcjauzytkownika = class;
  Tgrupa = class;
  Tjednostka = class;
  Tjednostkaorganizacyjna = class;
  Tkategoria = class;
  Tosoba = class;
  Tpacjent = class;
  Tpost = class;
  Trola = class;
  Tsubskrypcja = class;
  Ttemat = class;
  Ttest = class;
  Ttest_osoba = class;
  Tuzytkownik = class;
  Twidocznosc = class;
  Twynik = class;
  Tzatrudnienie = class;
  TaktywnoscTableDictionary = class;
  TalleleTableDictionary = class;
  TbadanieTableDictionary = class;
  TfunkcjaTableDictionary = class;
  TfunkcjauzytkownikaTableDictionary = class;
  TgrupaTableDictionary = class;
  TjednostkaTableDictionary = class;
  TjednostkaorganizacyjnaTableDictionary = class;
  TkategoriaTableDictionary = class;
  TosobaTableDictionary = class;
  TpacjentTableDictionary = class;
  TpostTableDictionary = class;
  TrolaTableDictionary = class;
  TsubskrypcjaTableDictionary = class;
  TtematTableDictionary = class;
  TtestTableDictionary = class;
  Ttest_osobaTableDictionary = class;
  TuzytkownikTableDictionary = class;
  TwidocznoscTableDictionary = class;
  TwynikTableDictionary = class;
  TzatrudnienieTableDictionary = class;

  [Entity]
  [Table('aktywnosc')]
  [Id('FAktywnoscId', TIdGenerator.IdentityOrSequence)]
  Taktywnosc = class
  private
    [Column('AktywnoscId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FAktywnoscId: Int64;

    [Column('Nazwa', [], 50)]
    FNazwa: Nullable<string>;

    [Column('Kolejnosc', [])]
    FKolejnosc: Nullable<Integer>;

    [Column('Aktywny', [TColumnProp.Required])]
    FAktywny: Integer;
  public
    property AktywnoscId: Int64 read FAktywnoscId write FAktywnoscId;
    property Nazwa: Nullable<string> read FNazwa write FNazwa;
    property Kolejnosc: Nullable<Integer> read FKolejnosc write FKolejnosc;
    property Aktywny: Integer read FAktywny write FAktywny;
  end;

  [Entity]
  [Table('allele')]
  [Id('FidALLELE', TIdGenerator.IdentityOrSequence)]
  Tallele = class
  private
    [Column('idALLELE', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidALLELE: Integer;

    [Column('nazwaALLELE', [TColumnProp.Required], 7)]
    FnazwaALLELE: string;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;
  public
    property idALLELE: Integer read FidALLELE write FidALLELE;
    property nazwaALLELE: string read FnazwaALLELE write FnazwaALLELE;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
  end;

  [Entity]
  [Table('badanie')]
  [Id('FidBADANIE', TIdGenerator.IdentityOrSequence)]
  Tbadanie = class
  private
    [Column('idBADANIE', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidBADANIE: Integer;

    [Column('dataBADANIE', [TColumnProp.Required])]
    FdataBADANIE: TDateTime;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('PACJENT_idPACJENT', [TColumnProp.Required], 'idPACJENT')]
    FPACJENT_idPACJENT: Proxy<Tpacjent>;
    function GetPACJENT_idPACJENT: Tpacjent;
    procedure SetPACJENT_idPACJENT(const Value: Tpacjent);
  public
    property idBADANIE: Integer read FidBADANIE write FidBADANIE;
    property dataBADANIE: TDateTime read FdataBADANIE write FdataBADANIE;
    property PACJENT_idPACJENT: Tpacjent read GetPACJENT_idPACJENT write SetPACJENT_idPACJENT;
  end;

  [Entity]
  [Table('funkcja')]
  [Id('FFunkcjaId', TIdGenerator.IdentityOrSequence)]
  Tfunkcja = class
  private
    [Column('FunkcjaId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FFunkcjaId: Int64;

    [Column('Nazwa', [], 50)]
    FNazwa: Nullable<string>;

    [Column('Kolejnosc', [])]
    FKolejnosc: Nullable<Integer>;

    [Column('Aktywny', [TColumnProp.Required])]
    FAktywny: Integer;
  public
    property FunkcjaId: Int64 read FFunkcjaId write FFunkcjaId;
    property Nazwa: Nullable<string> read FNazwa write FNazwa;
    property Kolejnosc: Nullable<Integer> read FKolejnosc write FKolejnosc;
    property Aktywny: Integer read FAktywny write FAktywny;
  end;

  [Entity]
  [Table('funkcjauzytkownika')]
  [Id('FFunkcjaUzytkownikaId', TIdGenerator.IdentityOrSequence)]
  Tfunkcjauzytkownika = class
  private
    [Column('FunkcjaUzytkownikaId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FFunkcjaUzytkownikaId: Int64;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('FunkcjaId', [], 'FunkcjaId')]
    FFunkcjaId: Proxy<Tfunkcja>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Id_uzytkownika', [], 'Id_uzytkownika')]
    FId_uzytkownika: Proxy<Tuzytkownik>;
    function GetFunkcjaId: Tfunkcja;
    procedure SetFunkcjaId(const Value: Tfunkcja);
    function GetId_uzytkownika: Tuzytkownik;
    procedure SetId_uzytkownika(const Value: Tuzytkownik);
  public
    property FunkcjaUzytkownikaId: Int64 read FFunkcjaUzytkownikaId write FFunkcjaUzytkownikaId;
    property FunkcjaId: Tfunkcja read GetFunkcjaId write SetFunkcjaId;
    property Id_uzytkownika: Tuzytkownik read GetId_uzytkownika write SetId_uzytkownika;
  end;

  [Entity]
  [Table('grupa')]
  [Id('FidGRUPA', TIdGenerator.IdentityOrSequence)]
  Tgrupa = class
  private
    [Column('idGRUPA', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidGRUPA: Integer;

    [Column('nazwaGRUPA', [TColumnProp.Required], 45)]
    FnazwaGRUPA: string;
  public
    property idGRUPA: Integer read FidGRUPA write FidGRUPA;
    property nazwaGRUPA: string read FnazwaGRUPA write FnazwaGRUPA;
  end;

  [Entity]
  [Table('jednostka')]
  [Id('FidJEDNOSTKA', TIdGenerator.IdentityOrSequence)]
  Tjednostka = class
  private
    [Column('idJEDNOSTKA', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidJEDNOSTKA: Integer;

    [Column('nazwaJEDNOSTKA', [TColumnProp.Required], 100)]
    FnazwaJEDNOSTKA: string;

    [Column('ulica', [], 100)]
    Fulica: Nullable<string>;

    [Column('nrBUDYNKU', [], 7)]
    FnrBUDYNKU: Nullable<string>;

    [Column('kodPOCZTOWY', [], 6)]
    FkodPOCZTOWY: Nullable<string>;

    [Column('miejscowosc', [], 45)]
    Fmiejscowosc: Nullable<string>;
  public
    property idJEDNOSTKA: Integer read FidJEDNOSTKA write FidJEDNOSTKA;
    property nazwaJEDNOSTKA: string read FnazwaJEDNOSTKA write FnazwaJEDNOSTKA;
    property ulica: Nullable<string> read Fulica write Fulica;
    property nrBUDYNKU: Nullable<string> read FnrBUDYNKU write FnrBUDYNKU;
    property kodPOCZTOWY: Nullable<string> read FkodPOCZTOWY write FkodPOCZTOWY;
    property miejscowosc: Nullable<string> read Fmiejscowosc write Fmiejscowosc;
  end;

  [Entity]
  [Table('jednostkaorganizacyjna')]
  [Id('FJednostkaOrganizacyjnaId', TIdGenerator.IdentityOrSequence)]
  Tjednostkaorganizacyjna = class
  private
    [Column('JednostkaOrganizacyjnaId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FJednostkaOrganizacyjnaId: Int64;

    [Column('Nazwa', [], 250)]
    FNazwa: Nullable<string>;

    [Column('Aktywny', [])]
    FAktywny: Nullable<Integer>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('JednostkaOrganizacyjnaIdId', [], 'JednostkaOrganizacyjnaId')]
    FJednostkaOrganizacyjnaIdId: Proxy<Tjednostkaorganizacyjna>;
    function GetJednostkaOrganizacyjnaIdId: Tjednostkaorganizacyjna;
    procedure SetJednostkaOrganizacyjnaIdId(const Value: Tjednostkaorganizacyjna);
  public
    property JednostkaOrganizacyjnaId: Int64 read FJednostkaOrganizacyjnaId write FJednostkaOrganizacyjnaId;
    property Nazwa: Nullable<string> read FNazwa write FNazwa;
    property Aktywny: Nullable<Integer> read FAktywny write FAktywny;
    property JednostkaOrganizacyjnaIdId: Tjednostkaorganizacyjna read GetJednostkaOrganizacyjnaIdId write SetJednostkaOrganizacyjnaIdId;
  end;

  [Entity]
  [Table('kategoria')]
  [Id('FId_Kategori', TIdGenerator.None)]
  Tkategoria = class
  private
    [Column('Id_Kategori', [TColumnProp.Required])]
    FId_Kategori: Integer;

    [Column('Nazwa', [TColumnProp.Required], 50)]
    FNazwa: string;

    [Column('Opis', [TColumnProp.Required], 50)]
    FOpis: string;
  public
    property Id_Kategori: Integer read FId_Kategori write FId_Kategori;
    property Nazwa: string read FNazwa write FNazwa;
    property Opis: string read FOpis write FOpis;
  end;

  [Entity]
  [Table('osoba')]
  [Id('FidOSOBA', TIdGenerator.IdentityOrSequence)]
  Tosoba = class
  private
    [Column('idOSOBA', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidOSOBA: Integer;

    [Column('imieOSOBA', [TColumnProp.Required], 45)]
    FimieOSOBA: string;

    [Column('nazwiskoOSOBA', [TColumnProp.Required], 45)]
    FnazwiskoOSOBA: string;

    [Column('PESEL', [], 11)]
    FPESEL: Nullable<string>;
  public
    property idOSOBA: Integer read FidOSOBA write FidOSOBA;
    property imieOSOBA: string read FimieOSOBA write FimieOSOBA;
    property nazwiskoOSOBA: string read FnazwiskoOSOBA write FnazwiskoOSOBA;
    property PESEL: Nullable<string> read FPESEL write FPESEL;
  end;

  [Entity]
  [Table('pacjent')]
  [Id('FidPACJENT', TIdGenerator.IdentityOrSequence)]
  Tpacjent = class
  private
    [Column('idPACJENT', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidPACJENT: Integer;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('JEDNOSTKA_idJEDNOSTKA', [TColumnProp.Required], 'idJEDNOSTKA')]
    FJEDNOSTKA_idJEDNOSTKA: Proxy<Tjednostka>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('OSOBA_idOSOBA', [TColumnProp.Required], 'idOSOBA')]
    FOSOBA_idOSOBA: Proxy<Tosoba>;
    function GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
    procedure SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
    function GetOSOBA_idOSOBA: Tosoba;
    procedure SetOSOBA_idOSOBA(const Value: Tosoba);
  public
    property idPACJENT: Integer read FidPACJENT write FidPACJENT;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
    property JEDNOSTKA_idJEDNOSTKA: Tjednostka read GetJEDNOSTKA_idJEDNOSTKA write SetJEDNOSTKA_idJEDNOSTKA;
    property OSOBA_idOSOBA: Tosoba read GetOSOBA_idOSOBA write SetOSOBA_idOSOBA;
  end;

  [Entity]
  [Table('post')]
  [Id('FId_posta', TIdGenerator.IdentityOrSequence)]
  Tpost = class
  private
    [Column('Id_posta', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId_posta: Int64;

    [Column('Tresc', [TColumnProp.Required], 140)]
    FTresc: string;

    [Column('Data_utworzenia', [TColumnProp.Required])]
    FData_utworzenia: TDateTime;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Id_posta_1', [], 'Id_posta')]
    FId_posta_1: Proxy<Tpost>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Id_subskrypcji', [], 'Id_subskrypcji')]
    FId_subskrypcji: Proxy<Tsubskrypcja>;
    function GetId_posta_1: Tpost;
    procedure SetId_posta_1(const Value: Tpost);
    function GetId_subskrypcji: Tsubskrypcja;
    procedure SetId_subskrypcji(const Value: Tsubskrypcja);
  public
    property Id_posta: Int64 read FId_posta write FId_posta;
    property Tresc: string read FTresc write FTresc;
    property Data_utworzenia: TDateTime read FData_utworzenia write FData_utworzenia;
    property Id_posta_1: Tpost read GetId_posta_1 write SetId_posta_1;
    property Id_subskrypcji: Tsubskrypcja read GetId_subskrypcji write SetId_subskrypcji;
  end;

  [Entity]
  [Table('rola')]
  [Id('FRolaId', TIdGenerator.IdentityOrSequence)]
  Trola = class
  private
    [Column('RolaId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FRolaId: Int64;

    [Column('Nazwa', [], 50)]
    FNazwa: Nullable<string>;

    [Column('Kolejnosc', [])]
    FKolejnosc: Nullable<Integer>;

    [Column('Aktywny', [TColumnProp.Required])]
    FAktywny: Integer;
  public
    property RolaId: Int64 read FRolaId write FRolaId;
    property Nazwa: Nullable<string> read FNazwa write FNazwa;
    property Kolejnosc: Nullable<Integer> read FKolejnosc write FKolejnosc;
    property Aktywny: Integer read FAktywny write FAktywny;
  end;

  [Entity]
  [Table('subskrypcja')]
  [Id('FId_subskrypcji', TIdGenerator.IdentityOrSequence)]
  Tsubskrypcja = class
  private
    [Column('Id_subskrypcji', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId_subskrypcji: Int64;

    [Column('Data_suba', [TColumnProp.Required])]
    FData_suba: TDateTime;

    [Column('Data_unsuba', [TColumnProp.Required])]
    FData_unsuba: TDateTime;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('RolaId', [], 'RolaId')]
    FRolaId: Proxy<Trola>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Id_tematu', [], 'Id_tematu')]
    FId_tematu: Proxy<Ttemat>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Id_uzytkownika', [], 'Id_uzytkownika')]
    FId_uzytkownika: Proxy<Tuzytkownik>;
    function GetRolaId: Trola;
    procedure SetRolaId(const Value: Trola);
    function GetId_tematu: Ttemat;
    procedure SetId_tematu(const Value: Ttemat);
    function GetId_uzytkownika: Tuzytkownik;
    procedure SetId_uzytkownika(const Value: Tuzytkownik);
  public
    property Id_subskrypcji: Int64 read FId_subskrypcji write FId_subskrypcji;
    property Data_suba: TDateTime read FData_suba write FData_suba;
    property Data_unsuba: TDateTime read FData_unsuba write FData_unsuba;
    property RolaId: Trola read GetRolaId write SetRolaId;
    property Id_tematu: Ttemat read GetId_tematu write SetId_tematu;
    property Id_uzytkownika: Tuzytkownik read GetId_uzytkownika write SetId_uzytkownika;
  end;

  [Entity]
  [Table('temat')]
  [Id('FId_tematu', TIdGenerator.IdentityOrSequence)]
  Ttemat = class
  private
    [Column('Id_tematu', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId_tematu: Int64;

    [Column('Data_Utworzenia', [TColumnProp.Required])]
    FData_Utworzenia: TDateTime;

    [Column('Nazwa', [TColumnProp.Required], 50)]
    FNazwa: string;

    [Column('NazwaKodowa', [TColumnProp.Required], 36)]
    FNazwaKodowa: string;

    [Column('Data_Zamkniecia', [TColumnProp.Required])]
    FData_Zamkniecia: TDateTime;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('AktywnoscId', [], 'AktywnoscId')]
    FAktywnoscId: Proxy<Taktywnosc>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('WidocznoscId', [], 'WidocznoscId')]
    FWidocznoscId: Proxy<Twidocznosc>;
    function GetAktywnoscId: Taktywnosc;
    procedure SetAktywnoscId(const Value: Taktywnosc);
    function GetWidocznoscId: Twidocznosc;
    procedure SetWidocznoscId(const Value: Twidocznosc);
  public
    property Id_tematu: Int64 read FId_tematu write FId_tematu;
    property Data_Utworzenia: TDateTime read FData_Utworzenia write FData_Utworzenia;
    property Nazwa: string read FNazwa write FNazwa;
    property NazwaKodowa: string read FNazwaKodowa write FNazwaKodowa;
    property Data_Zamkniecia: TDateTime read FData_Zamkniecia write FData_Zamkniecia;
    property AktywnoscId: Taktywnosc read GetAktywnoscId write SetAktywnoscId;
    property WidocznoscId: Twidocznosc read GetWidocznoscId write SetWidocznoscId;
  end;

  [Entity]
  [Table('test')]
  [Id('FtestId', TIdGenerator.IdentityOrSequence)]
  Ttest = class
  private
    [Column('testId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FtestId: Int64;

    [Column('Id_uzytkownika', [], 20)]
    FId_uzytkownika: Nullable<string>;
  public
    property testId: Int64 read FtestId write FtestId;
    property Id_uzytkownika: Nullable<string> read FId_uzytkownika write FId_uzytkownika;
  end;

  [Entity]
  [Table('test_osoba')]
  [Id('Ftest_id', TIdGenerator.IdentityOrSequence)]
  Ttest_osoba = class
  private
    [Column('test_id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    Ftest_id: Integer;

    [Column('test_login', [TColumnProp.Required], 40)]
    Ftest_login: string;

    [Column('test_haslo', [TColumnProp.Required], 40)]
    Ftest_haslo: string;

    [Column('test_typ', [])]
    Ftest_typ: Nullable<Integer>;
  public
    property test_id: Integer read Ftest_id write Ftest_id;
    property test_login: string read Ftest_login write Ftest_login;
    property test_haslo: string read Ftest_haslo write Ftest_haslo;
    property test_typ: Nullable<Integer> read Ftest_typ write Ftest_typ;
  end;

  [Entity]
  [Table('uzytkownik')]
  [Id('FId_uzytkownika', TIdGenerator.IdentityOrSequence)]
  Tuzytkownik = class
  private
    [Column('Id_uzytkownika', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId_uzytkownika: Int64;

    [Column('Login', [TColumnProp.Required], 50)]
    FLogin: string;

    [Column('Haslo', [TColumnProp.Required], 50)]
    FHaslo: string;

    [Column('Imie', [TColumnProp.Required], 50)]
    FImie: string;

    [Column('Nazwisko', [TColumnProp.Required], 50)]
    FNazwisko: string;

    [Column('Data_utworzenia', [TColumnProp.Required])]
    FData_utworzenia: TDateTime;
  public
    property Id_uzytkownika: Int64 read FId_uzytkownika write FId_uzytkownika;
    property Login: string read FLogin write FLogin;
    property Haslo: string read FHaslo write FHaslo;
    property Imie: string read FImie write FImie;
    property Nazwisko: string read FNazwisko write FNazwisko;
    property Data_utworzenia: TDateTime read FData_utworzenia write FData_utworzenia;
  end;

  [Entity]
  [Table('widocznosc')]
  [Id('FWidocznoscId', TIdGenerator.IdentityOrSequence)]
  Twidocznosc = class
  private
    [Column('WidocznoscId', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FWidocznoscId: Int64;

    [Column('Nazwa', [], 50)]
    FNazwa: Nullable<string>;

    [Column('Kolejnosc', [])]
    FKolejnosc: Nullable<Integer>;

    [Column('Aktywny', [TColumnProp.Required])]
    FAktywny: Integer;
  public
    property WidocznoscId: Int64 read FWidocznoscId write FWidocznoscId;
    property Nazwa: Nullable<string> read FNazwa write FNazwa;
    property Kolejnosc: Nullable<Integer> read FKolejnosc write FKolejnosc;
    property Aktywny: Integer read FAktywny write FAktywny;
  end;

  [Entity]
  [Table('wynik')]
  [Id('FidWYNIK', TIdGenerator.IdentityOrSequence)]
  Twynik = class
  private
    [Column('idWYNIK', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidWYNIK: Integer;

    [Column('wartosc1', [TColumnProp.Required])]
    Fwartosc1: Double;

    [Column('wartosc2', [])]
    Fwartosc2: Nullable<Double>;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('ALLELE_idALLELE', [TColumnProp.Required], 'idALLELE')]
    FALLELE_idALLELE: Proxy<Tallele>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('BADANIE_idBADANIE', [TColumnProp.Required], 'idBADANIE')]
    FBADANIE_idBADANIE: Proxy<Tbadanie>;
    function GetALLELE_idALLELE: Tallele;
    procedure SetALLELE_idALLELE(const Value: Tallele);
    function GetBADANIE_idBADANIE: Tbadanie;
    procedure SetBADANIE_idBADANIE(const Value: Tbadanie);
  public
    property idWYNIK: Integer read FidWYNIK write FidWYNIK;
    property wartosc1: Integer read Fwartosc1 write Fwartosc1;
    property wartosc2: Nullable<Integer> read Fwartosc2 write Fwartosc2;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
    property ALLELE_idALLELE: Tallele read GetALLELE_idALLELE write SetALLELE_idALLELE;
    property BADANIE_idBADANIE: Tbadanie read GetBADANIE_idBADANIE write SetBADANIE_idBADANIE;
  end;

  [Entity]
  [Table('zatrudnienie')]
  [Id('FidZATRUDNIENIE', TIdGenerator.IdentityOrSequence)]
  Tzatrudnienie = class
  private
    [Column('idZATRUDNIENIE', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FidZATRUDNIENIE: Integer;

    [Column('haslo', [], 45)]
    Fhaslo: Nullable<string>;

    [Column('login', [], 45)]
    Flogin: Nullable<string>;

    [Column('czyAKTYWNY', [])]
    FczyAKTYWNY: Nullable<Integer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('GRUPA_idGRUPA', [TColumnProp.Required], 'idGRUPA')]
    FGRUPA_idGRUPA: Proxy<Tgrupa>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('JEDNOSTKA_idJEDNOSTKA', [TColumnProp.Required], 'idJEDNOSTKA')]
    FJEDNOSTKA_idJEDNOSTKA: Proxy<Tjednostka>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('OSOBA_idOSOBA', [TColumnProp.Required], 'idOSOBA')]
    FOSOBA_idOSOBA: Proxy<Tosoba>;
    function GetGRUPA_idGRUPA: Tgrupa;
    procedure SetGRUPA_idGRUPA(const Value: Tgrupa);
    function GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
    procedure SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
    function GetOSOBA_idOSOBA: Tosoba;
    procedure SetOSOBA_idOSOBA(const Value: Tosoba);
  public
    property idZATRUDNIENIE: Integer read FidZATRUDNIENIE write FidZATRUDNIENIE;
    property haslo: Nullable<string> read Fhaslo write Fhaslo;
    property login: Nullable<string> read Flogin write Flogin;
    property czyAKTYWNY: Nullable<Integer> read FczyAKTYWNY write FczyAKTYWNY;
    property GRUPA_idGRUPA: Tgrupa read GetGRUPA_idGRUPA write SetGRUPA_idGRUPA;
    property JEDNOSTKA_idJEDNOSTKA: Tjednostka read GetJEDNOSTKA_idJEDNOSTKA write SetJEDNOSTKA_idJEDNOSTKA;
    property OSOBA_idOSOBA: Tosoba read GetOSOBA_idOSOBA write SetOSOBA_idOSOBA;
  end;

  TDicDictionary = class
  private
    Faktywnosc: TaktywnoscTableDictionary;
    Fallele: TalleleTableDictionary;
    Fbadanie: TbadanieTableDictionary;
    Ffunkcja: TfunkcjaTableDictionary;
    Ffunkcjauzytkownika: TfunkcjauzytkownikaTableDictionary;
    Fgrupa: TgrupaTableDictionary;
    Fjednostka: TjednostkaTableDictionary;
    Fjednostkaorganizacyjna: TjednostkaorganizacyjnaTableDictionary;
    Fkategoria: TkategoriaTableDictionary;
    Fosoba: TosobaTableDictionary;
    Fpacjent: TpacjentTableDictionary;
    Fpost: TpostTableDictionary;
    Frola: TrolaTableDictionary;
    Fsubskrypcja: TsubskrypcjaTableDictionary;
    Ftemat: TtematTableDictionary;
    Ftest: TtestTableDictionary;
    Ftest_osoba: Ttest_osobaTableDictionary;
    Fuzytkownik: TuzytkownikTableDictionary;
    Fwidocznosc: TwidocznoscTableDictionary;
    Fwynik: TwynikTableDictionary;
    Fzatrudnienie: TzatrudnienieTableDictionary;
    function Getaktywnosc: TaktywnoscTableDictionary;
    function Getallele: TalleleTableDictionary;
    function Getbadanie: TbadanieTableDictionary;
    function Getfunkcja: TfunkcjaTableDictionary;
    function Getfunkcjauzytkownika: TfunkcjauzytkownikaTableDictionary;
    function Getgrupa: TgrupaTableDictionary;
    function Getjednostka: TjednostkaTableDictionary;
    function Getjednostkaorganizacyjna: TjednostkaorganizacyjnaTableDictionary;
    function Getkategoria: TkategoriaTableDictionary;
    function Getosoba: TosobaTableDictionary;
    function Getpacjent: TpacjentTableDictionary;
    function Getpost: TpostTableDictionary;
    function Getrola: TrolaTableDictionary;
    function Getsubskrypcja: TsubskrypcjaTableDictionary;
    function Gettemat: TtematTableDictionary;
    function Gettest: TtestTableDictionary;
    function Gettest_osoba: Ttest_osobaTableDictionary;
    function Getuzytkownik: TuzytkownikTableDictionary;
    function Getwidocznosc: TwidocznoscTableDictionary;
    function Getwynik: TwynikTableDictionary;
    function Getzatrudnienie: TzatrudnienieTableDictionary;
  public
    destructor Destroy; override;
    property aktywnosc: TaktywnoscTableDictionary read Getaktywnosc;
    property allele: TalleleTableDictionary read Getallele;
    property badanie: TbadanieTableDictionary read Getbadanie;
    property funkcja: TfunkcjaTableDictionary read Getfunkcja;
    property funkcjauzytkownika: TfunkcjauzytkownikaTableDictionary read Getfunkcjauzytkownika;
    property grupa: TgrupaTableDictionary read Getgrupa;
    property jednostka: TjednostkaTableDictionary read Getjednostka;
    property jednostkaorganizacyjna: TjednostkaorganizacyjnaTableDictionary read Getjednostkaorganizacyjna;
    property kategoria: TkategoriaTableDictionary read Getkategoria;
    property osoba: TosobaTableDictionary read Getosoba;
    property pacjent: TpacjentTableDictionary read Getpacjent;
    property post: TpostTableDictionary read Getpost;
    property rola: TrolaTableDictionary read Getrola;
    property subskrypcja: TsubskrypcjaTableDictionary read Getsubskrypcja;
    property temat: TtematTableDictionary read Gettemat;
    property test: TtestTableDictionary read Gettest;
    property test_osoba: Ttest_osobaTableDictionary read Gettest_osoba;
    property uzytkownik: TuzytkownikTableDictionary read Getuzytkownik;
    property widocznosc: TwidocznoscTableDictionary read Getwidocznosc;
    property wynik: TwynikTableDictionary read Getwynik;
    property zatrudnienie: TzatrudnienieTableDictionary read Getzatrudnienie;
  end;

  TaktywnoscTableDictionary = class
  private
    FAktywnoscId: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FKolejnosc: TDictionaryAttribute;
    FAktywny: TDictionaryAttribute;
  public
    constructor Create;
    property AktywnoscId: TDictionaryAttribute read FAktywnoscId;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property Kolejnosc: TDictionaryAttribute read FKolejnosc;
    property Aktywny: TDictionaryAttribute read FAktywny;
  end;

  TalleleTableDictionary = class
  private
    FidALLELE: TDictionaryAttribute;
    FnazwaALLELE: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
  public
    constructor Create;
    property idALLELE: TDictionaryAttribute read FidALLELE;
    property nazwaALLELE: TDictionaryAttribute read FnazwaALLELE;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
  end;

  TbadanieTableDictionary = class
  private
    FidBADANIE: TDictionaryAttribute;
    FdataBADANIE: TDictionaryAttribute;
    FPACJENT_idPACJENT: TDictionaryAssociation;
  public
    constructor Create;
    property idBADANIE: TDictionaryAttribute read FidBADANIE;
    property dataBADANIE: TDictionaryAttribute read FdataBADANIE;
    property PACJENT_idPACJENT: TDictionaryAssociation read FPACJENT_idPACJENT;
  end;

  TfunkcjaTableDictionary = class
  private
    FFunkcjaId: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FKolejnosc: TDictionaryAttribute;
    FAktywny: TDictionaryAttribute;
  public
    constructor Create;
    property FunkcjaId: TDictionaryAttribute read FFunkcjaId;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property Kolejnosc: TDictionaryAttribute read FKolejnosc;
    property Aktywny: TDictionaryAttribute read FAktywny;
  end;

  TfunkcjauzytkownikaTableDictionary = class
  private
    FFunkcjaUzytkownikaId: TDictionaryAttribute;
    FFunkcjaId: TDictionaryAssociation;
    FId_uzytkownika: TDictionaryAssociation;
  public
    constructor Create;
    property FunkcjaUzytkownikaId: TDictionaryAttribute read FFunkcjaUzytkownikaId;
    property FunkcjaId: TDictionaryAssociation read FFunkcjaId;
    property Id_uzytkownika: TDictionaryAssociation read FId_uzytkownika;
  end;

  TgrupaTableDictionary = class
  private
    FidGRUPA: TDictionaryAttribute;
    FnazwaGRUPA: TDictionaryAttribute;
  public
    constructor Create;
    property idGRUPA: TDictionaryAttribute read FidGRUPA;
    property nazwaGRUPA: TDictionaryAttribute read FnazwaGRUPA;
  end;

  TjednostkaTableDictionary = class
  private
    FidJEDNOSTKA: TDictionaryAttribute;
    FnazwaJEDNOSTKA: TDictionaryAttribute;
    Fulica: TDictionaryAttribute;
    FnrBUDYNKU: TDictionaryAttribute;
    FkodPOCZTOWY: TDictionaryAttribute;
    Fmiejscowosc: TDictionaryAttribute;
  public
    constructor Create;
    property idJEDNOSTKA: TDictionaryAttribute read FidJEDNOSTKA;
    property nazwaJEDNOSTKA: TDictionaryAttribute read FnazwaJEDNOSTKA;
    property ulica: TDictionaryAttribute read Fulica;
    property nrBUDYNKU: TDictionaryAttribute read FnrBUDYNKU;
    property kodPOCZTOWY: TDictionaryAttribute read FkodPOCZTOWY;
    property miejscowosc: TDictionaryAttribute read Fmiejscowosc;
  end;

  TjednostkaorganizacyjnaTableDictionary = class
  private
    FJednostkaOrganizacyjnaId: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FAktywny: TDictionaryAttribute;
    FJednostkaOrganizacyjnaIdId: TDictionaryAssociation;
  public
    constructor Create;
    property JednostkaOrganizacyjnaId: TDictionaryAttribute read FJednostkaOrganizacyjnaId;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property Aktywny: TDictionaryAttribute read FAktywny;
    property JednostkaOrganizacyjnaIdId: TDictionaryAssociation read FJednostkaOrganizacyjnaIdId;
  end;

  TkategoriaTableDictionary = class
  private
    FId_Kategori: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FOpis: TDictionaryAttribute;
  public
    constructor Create;
    property Id_Kategori: TDictionaryAttribute read FId_Kategori;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property Opis: TDictionaryAttribute read FOpis;
  end;

  TosobaTableDictionary = class
  private
    FidOSOBA: TDictionaryAttribute;
    FimieOSOBA: TDictionaryAttribute;
    FnazwiskoOSOBA: TDictionaryAttribute;
    FPESEL: TDictionaryAttribute;
  public
    constructor Create;
    property idOSOBA: TDictionaryAttribute read FidOSOBA;
    property imieOSOBA: TDictionaryAttribute read FimieOSOBA;
    property nazwiskoOSOBA: TDictionaryAttribute read FnazwiskoOSOBA;
    property PESEL: TDictionaryAttribute read FPESEL;
  end;

  TpacjentTableDictionary = class
  private
    FidPACJENT: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
    FJEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation;
    FOSOBA_idOSOBA: TDictionaryAssociation;
  public
    constructor Create;
    property idPACJENT: TDictionaryAttribute read FidPACJENT;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
    property JEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation read FJEDNOSTKA_idJEDNOSTKA;
    property OSOBA_idOSOBA: TDictionaryAssociation read FOSOBA_idOSOBA;
  end;

  TpostTableDictionary = class
  private
    FId_posta: TDictionaryAttribute;
    FTresc: TDictionaryAttribute;
    FData_utworzenia: TDictionaryAttribute;
    FId_posta_1: TDictionaryAssociation;
    FId_subskrypcji: TDictionaryAssociation;
  public
    constructor Create;
    property Id_posta: TDictionaryAttribute read FId_posta;
    property Tresc: TDictionaryAttribute read FTresc;
    property Data_utworzenia: TDictionaryAttribute read FData_utworzenia;
    property Id_posta_1: TDictionaryAssociation read FId_posta_1;
    property Id_subskrypcji: TDictionaryAssociation read FId_subskrypcji;
  end;

  TrolaTableDictionary = class
  private
    FRolaId: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FKolejnosc: TDictionaryAttribute;
    FAktywny: TDictionaryAttribute;
  public
    constructor Create;
    property RolaId: TDictionaryAttribute read FRolaId;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property Kolejnosc: TDictionaryAttribute read FKolejnosc;
    property Aktywny: TDictionaryAttribute read FAktywny;
  end;

  TsubskrypcjaTableDictionary = class
  private
    FId_subskrypcji: TDictionaryAttribute;
    FData_suba: TDictionaryAttribute;
    FData_unsuba: TDictionaryAttribute;
    FRolaId: TDictionaryAssociation;
    FId_tematu: TDictionaryAssociation;
    FId_uzytkownika: TDictionaryAssociation;
  public
    constructor Create;
    property Id_subskrypcji: TDictionaryAttribute read FId_subskrypcji;
    property Data_suba: TDictionaryAttribute read FData_suba;
    property Data_unsuba: TDictionaryAttribute read FData_unsuba;
    property RolaId: TDictionaryAssociation read FRolaId;
    property Id_tematu: TDictionaryAssociation read FId_tematu;
    property Id_uzytkownika: TDictionaryAssociation read FId_uzytkownika;
  end;

  TtematTableDictionary = class
  private
    FId_tematu: TDictionaryAttribute;
    FData_Utworzenia: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FNazwaKodowa: TDictionaryAttribute;
    FData_Zamkniecia: TDictionaryAttribute;
    FAktywnoscId: TDictionaryAssociation;
    FWidocznoscId: TDictionaryAssociation;
  public
    constructor Create;
    property Id_tematu: TDictionaryAttribute read FId_tematu;
    property Data_Utworzenia: TDictionaryAttribute read FData_Utworzenia;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property NazwaKodowa: TDictionaryAttribute read FNazwaKodowa;
    property Data_Zamkniecia: TDictionaryAttribute read FData_Zamkniecia;
    property AktywnoscId: TDictionaryAssociation read FAktywnoscId;
    property WidocznoscId: TDictionaryAssociation read FWidocznoscId;
  end;

  TtestTableDictionary = class
  private
    FtestId: TDictionaryAttribute;
    FId_uzytkownika: TDictionaryAttribute;
  public
    constructor Create;
    property testId: TDictionaryAttribute read FtestId;
    property Id_uzytkownika: TDictionaryAttribute read FId_uzytkownika;
  end;

  Ttest_osobaTableDictionary = class
  private
    Ftest_id: TDictionaryAttribute;
    Ftest_login: TDictionaryAttribute;
    Ftest_haslo: TDictionaryAttribute;
    Ftest_typ: TDictionaryAttribute;
  public
    constructor Create;
    property test_id: TDictionaryAttribute read Ftest_id;
    property test_login: TDictionaryAttribute read Ftest_login;
    property test_haslo: TDictionaryAttribute read Ftest_haslo;
    property test_typ: TDictionaryAttribute read Ftest_typ;
  end;

  TuzytkownikTableDictionary = class
  private
    FId_uzytkownika: TDictionaryAttribute;
    FLogin: TDictionaryAttribute;
    FHaslo: TDictionaryAttribute;
    FImie: TDictionaryAttribute;
    FNazwisko: TDictionaryAttribute;
    FData_utworzenia: TDictionaryAttribute;
  public
    constructor Create;
    property Id_uzytkownika: TDictionaryAttribute read FId_uzytkownika;
    property Login: TDictionaryAttribute read FLogin;
    property Haslo: TDictionaryAttribute read FHaslo;
    property Imie: TDictionaryAttribute read FImie;
    property Nazwisko: TDictionaryAttribute read FNazwisko;
    property Data_utworzenia: TDictionaryAttribute read FData_utworzenia;
  end;

  TwidocznoscTableDictionary = class
  private
    FWidocznoscId: TDictionaryAttribute;
    FNazwa: TDictionaryAttribute;
    FKolejnosc: TDictionaryAttribute;
    FAktywny: TDictionaryAttribute;
  public
    constructor Create;
    property WidocznoscId: TDictionaryAttribute read FWidocznoscId;
    property Nazwa: TDictionaryAttribute read FNazwa;
    property Kolejnosc: TDictionaryAttribute read FKolejnosc;
    property Aktywny: TDictionaryAttribute read FAktywny;
  end;

  TwynikTableDictionary = class
  private
    FidWYNIK: TDictionaryAttribute;
    Fwartosc1: TDictionaryAttribute;
    Fwartosc2: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
    FALLELE_idALLELE: TDictionaryAssociation;
    FBADANIE_idBADANIE: TDictionaryAssociation;
  public
    constructor Create;
    property idWYNIK: TDictionaryAttribute read FidWYNIK;
    property wartosc1: TDictionaryAttribute read Fwartosc1;
    property wartosc2: TDictionaryAttribute read Fwartosc2;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
    property ALLELE_idALLELE: TDictionaryAssociation read FALLELE_idALLELE;
    property BADANIE_idBADANIE: TDictionaryAssociation read FBADANIE_idBADANIE;
  end;

  TzatrudnienieTableDictionary = class
  private
    FidZATRUDNIENIE: TDictionaryAttribute;
    Fhaslo: TDictionaryAttribute;
    Flogin: TDictionaryAttribute;
    FczyAKTYWNY: TDictionaryAttribute;
    FGRUPA_idGRUPA: TDictionaryAssociation;
    FJEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation;
    FOSOBA_idOSOBA: TDictionaryAssociation;
  public
    constructor Create;
    property idZATRUDNIENIE: TDictionaryAttribute read FidZATRUDNIENIE;
    property haslo: TDictionaryAttribute read Fhaslo;
    property login: TDictionaryAttribute read Flogin;
    property czyAKTYWNY: TDictionaryAttribute read FczyAKTYWNY;
    property GRUPA_idGRUPA: TDictionaryAssociation read FGRUPA_idGRUPA;
    property JEDNOSTKA_idJEDNOSTKA: TDictionaryAssociation read FJEDNOSTKA_idJEDNOSTKA;
    property OSOBA_idOSOBA: TDictionaryAssociation read FOSOBA_idOSOBA;
  end;

function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ Tbadanie }

function Tbadanie.GetPACJENT_idPACJENT: Tpacjent;
begin
  result := FPACJENT_idPACJENT.Value;
end;

procedure Tbadanie.SetPACJENT_idPACJENT(const Value: Tpacjent);
begin
  FPACJENT_idPACJENT.Value := Value;
end;

{ Tfunkcjauzytkownika }

function Tfunkcjauzytkownika.GetFunkcjaId: Tfunkcja;
begin
  result := FFunkcjaId.Value;
end;

procedure Tfunkcjauzytkownika.SetFunkcjaId(const Value: Tfunkcja);
begin
  FFunkcjaId.Value := Value;
end;

function Tfunkcjauzytkownika.GetId_uzytkownika: Tuzytkownik;
begin
  result := FId_uzytkownika.Value;
end;

procedure Tfunkcjauzytkownika.SetId_uzytkownika(const Value: Tuzytkownik);
begin
  FId_uzytkownika.Value := Value;
end;

{ Tjednostkaorganizacyjna }

function Tjednostkaorganizacyjna.GetJednostkaOrganizacyjnaIdId: Tjednostkaorganizacyjna;
begin
  result := FJednostkaOrganizacyjnaIdId.Value;
end;

procedure Tjednostkaorganizacyjna.SetJednostkaOrganizacyjnaIdId(const Value: Tjednostkaorganizacyjna);
begin
  FJednostkaOrganizacyjnaIdId.Value := Value;
end;

{ Tpacjent }

function Tpacjent.GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
begin
  result := FJEDNOSTKA_idJEDNOSTKA.Value;
end;

procedure Tpacjent.SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
begin
  FJEDNOSTKA_idJEDNOSTKA.Value := Value;
end;

function Tpacjent.GetOSOBA_idOSOBA: Tosoba;
begin
  result := FOSOBA_idOSOBA.Value;
end;

procedure Tpacjent.SetOSOBA_idOSOBA(const Value: Tosoba);
begin
  FOSOBA_idOSOBA.Value := Value;
end;

{ Tpost }

function Tpost.GetId_posta_1: Tpost;
begin
  result := FId_posta_1.Value;
end;

procedure Tpost.SetId_posta_1(const Value: Tpost);
begin
  FId_posta_1.Value := Value;
end;

function Tpost.GetId_subskrypcji: Tsubskrypcja;
begin
  result := FId_subskrypcji.Value;
end;

procedure Tpost.SetId_subskrypcji(const Value: Tsubskrypcja);
begin
  FId_subskrypcji.Value := Value;
end;

{ Tsubskrypcja }

function Tsubskrypcja.GetRolaId: Trola;
begin
  result := FRolaId.Value;
end;

procedure Tsubskrypcja.SetRolaId(const Value: Trola);
begin
  FRolaId.Value := Value;
end;

function Tsubskrypcja.GetId_tematu: Ttemat;
begin
  result := FId_tematu.Value;
end;

procedure Tsubskrypcja.SetId_tematu(const Value: Ttemat);
begin
  FId_tematu.Value := Value;
end;

function Tsubskrypcja.GetId_uzytkownika: Tuzytkownik;
begin
  result := FId_uzytkownika.Value;
end;

procedure Tsubskrypcja.SetId_uzytkownika(const Value: Tuzytkownik);
begin
  FId_uzytkownika.Value := Value;
end;

{ Ttemat }

function Ttemat.GetAktywnoscId: Taktywnosc;
begin
  result := FAktywnoscId.Value;
end;

procedure Ttemat.SetAktywnoscId(const Value: Taktywnosc);
begin
  FAktywnoscId.Value := Value;
end;

function Ttemat.GetWidocznoscId: Twidocznosc;
begin
  result := FWidocznoscId.Value;
end;

procedure Ttemat.SetWidocznoscId(const Value: Twidocznosc);
begin
  FWidocznoscId.Value := Value;
end;

{ Twynik }

function Twynik.GetALLELE_idALLELE: Tallele;
begin
  result := FALLELE_idALLELE.Value;
end;

procedure Twynik.SetALLELE_idALLELE(const Value: Tallele);
begin
  FALLELE_idALLELE.Value := Value;
end;

function Twynik.GetBADANIE_idBADANIE: Tbadanie;
begin
  result := FBADANIE_idBADANIE.Value;
end;

procedure Twynik.SetBADANIE_idBADANIE(const Value: Tbadanie);
begin
  FBADANIE_idBADANIE.Value := Value;
end;

{ Tzatrudnienie }

function Tzatrudnienie.GetGRUPA_idGRUPA: Tgrupa;
begin
  result := FGRUPA_idGRUPA.Value;
end;

procedure Tzatrudnienie.SetGRUPA_idGRUPA(const Value: Tgrupa);
begin
  FGRUPA_idGRUPA.Value := Value;
end;

function Tzatrudnienie.GetJEDNOSTKA_idJEDNOSTKA: Tjednostka;
begin
  result := FJEDNOSTKA_idJEDNOSTKA.Value;
end;

procedure Tzatrudnienie.SetJEDNOSTKA_idJEDNOSTKA(const Value: Tjednostka);
begin
  FJEDNOSTKA_idJEDNOSTKA.Value := Value;
end;

function Tzatrudnienie.GetOSOBA_idOSOBA: Tosoba;
begin
  result := FOSOBA_idOSOBA.Value;
end;

procedure Tzatrudnienie.SetOSOBA_idOSOBA(const Value: Tosoba);
begin
  FOSOBA_idOSOBA.Value := Value;
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if Fzatrudnienie <> nil then Fzatrudnienie.Free;
  if Fwynik <> nil then Fwynik.Free;
  if Fwidocznosc <> nil then Fwidocznosc.Free;
  if Fuzytkownik <> nil then Fuzytkownik.Free;
  if Ftest_osoba <> nil then Ftest_osoba.Free;
  if Ftest <> nil then Ftest.Free;
  if Ftemat <> nil then Ftemat.Free;
  if Fsubskrypcja <> nil then Fsubskrypcja.Free;
  if Frola <> nil then Frola.Free;
  if Fpost <> nil then Fpost.Free;
  if Fpacjent <> nil then Fpacjent.Free;
  if Fosoba <> nil then Fosoba.Free;
  if Fkategoria <> nil then Fkategoria.Free;
  if Fjednostkaorganizacyjna <> nil then Fjednostkaorganizacyjna.Free;
  if Fjednostka <> nil then Fjednostka.Free;
  if Fgrupa <> nil then Fgrupa.Free;
  if Ffunkcjauzytkownika <> nil then Ffunkcjauzytkownika.Free;
  if Ffunkcja <> nil then Ffunkcja.Free;
  if Fbadanie <> nil then Fbadanie.Free;
  if Fallele <> nil then Fallele.Free;
  if Faktywnosc <> nil then Faktywnosc.Free;
  inherited;
end;

function TDicDictionary.Getaktywnosc: TaktywnoscTableDictionary;
begin
  if Faktywnosc = nil then Faktywnosc := TaktywnoscTableDictionary.Create;
  result := Faktywnosc;
end;

function TDicDictionary.Getallele: TalleleTableDictionary;
begin
  if Fallele = nil then Fallele := TalleleTableDictionary.Create;
  result := Fallele;
end;

function TDicDictionary.Getbadanie: TbadanieTableDictionary;
begin
  if Fbadanie = nil then Fbadanie := TbadanieTableDictionary.Create;
  result := Fbadanie;
end;

function TDicDictionary.Getfunkcja: TfunkcjaTableDictionary;
begin
  if Ffunkcja = nil then Ffunkcja := TfunkcjaTableDictionary.Create;
  result := Ffunkcja;
end;

function TDicDictionary.Getfunkcjauzytkownika: TfunkcjauzytkownikaTableDictionary;
begin
  if Ffunkcjauzytkownika = nil then Ffunkcjauzytkownika := TfunkcjauzytkownikaTableDictionary.Create;
  result := Ffunkcjauzytkownika;
end;

function TDicDictionary.Getgrupa: TgrupaTableDictionary;
begin
  if Fgrupa = nil then Fgrupa := TgrupaTableDictionary.Create;
  result := Fgrupa;
end;

function TDicDictionary.Getjednostka: TjednostkaTableDictionary;
begin
  if Fjednostka = nil then Fjednostka := TjednostkaTableDictionary.Create;
  result := Fjednostka;
end;

function TDicDictionary.Getjednostkaorganizacyjna: TjednostkaorganizacyjnaTableDictionary;
begin
  if Fjednostkaorganizacyjna = nil then Fjednostkaorganizacyjna := TjednostkaorganizacyjnaTableDictionary.Create;
  result := Fjednostkaorganizacyjna;
end;

function TDicDictionary.Getkategoria: TkategoriaTableDictionary;
begin
  if Fkategoria = nil then Fkategoria := TkategoriaTableDictionary.Create;
  result := Fkategoria;
end;

function TDicDictionary.Getosoba: TosobaTableDictionary;
begin
  if Fosoba = nil then Fosoba := TosobaTableDictionary.Create;
  result := Fosoba;
end;

function TDicDictionary.Getpacjent: TpacjentTableDictionary;
begin
  if Fpacjent = nil then Fpacjent := TpacjentTableDictionary.Create;
  result := Fpacjent;
end;

function TDicDictionary.Getpost: TpostTableDictionary;
begin
  if Fpost = nil then Fpost := TpostTableDictionary.Create;
  result := Fpost;
end;

function TDicDictionary.Getrola: TrolaTableDictionary;
begin
  if Frola = nil then Frola := TrolaTableDictionary.Create;
  result := Frola;
end;

function TDicDictionary.Getsubskrypcja: TsubskrypcjaTableDictionary;
begin
  if Fsubskrypcja = nil then Fsubskrypcja := TsubskrypcjaTableDictionary.Create;
  result := Fsubskrypcja;
end;

function TDicDictionary.Gettemat: TtematTableDictionary;
begin
  if Ftemat = nil then Ftemat := TtematTableDictionary.Create;
  result := Ftemat;
end;

function TDicDictionary.Gettest: TtestTableDictionary;
begin
  if Ftest = nil then Ftest := TtestTableDictionary.Create;
  result := Ftest;
end;

function TDicDictionary.Gettest_osoba: Ttest_osobaTableDictionary;
begin
  if Ftest_osoba = nil then Ftest_osoba := Ttest_osobaTableDictionary.Create;
  result := Ftest_osoba;
end;

function TDicDictionary.Getuzytkownik: TuzytkownikTableDictionary;
begin
  if Fuzytkownik = nil then Fuzytkownik := TuzytkownikTableDictionary.Create;
  result := Fuzytkownik;
end;

function TDicDictionary.Getwidocznosc: TwidocznoscTableDictionary;
begin
  if Fwidocznosc = nil then Fwidocznosc := TwidocznoscTableDictionary.Create;
  result := Fwidocznosc;
end;

function TDicDictionary.Getwynik: TwynikTableDictionary;
begin
  if Fwynik = nil then Fwynik := TwynikTableDictionary.Create;
  result := Fwynik;
end;

function TDicDictionary.Getzatrudnienie: TzatrudnienieTableDictionary;
begin
  if Fzatrudnienie = nil then Fzatrudnienie := TzatrudnienieTableDictionary.Create;
  result := Fzatrudnienie;
end;

{ TaktywnoscTableDictionary }

constructor TaktywnoscTableDictionary.Create;
begin
  inherited;
  FAktywnoscId := TDictionaryAttribute.Create('AktywnoscId');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FKolejnosc := TDictionaryAttribute.Create('Kolejnosc');
  FAktywny := TDictionaryAttribute.Create('Aktywny');
end;

{ TalleleTableDictionary }

constructor TalleleTableDictionary.Create;
begin
  inherited;
  FidALLELE := TDictionaryAttribute.Create('idALLELE');
  FnazwaALLELE := TDictionaryAttribute.Create('nazwaALLELE');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
end;

{ TbadanieTableDictionary }

constructor TbadanieTableDictionary.Create;
begin
  inherited;
  FidBADANIE := TDictionaryAttribute.Create('idBADANIE');
  FdataBADANIE := TDictionaryAttribute.Create('dataBADANIE');
  FPACJENT_idPACJENT := TDictionaryAssociation.Create('PACJENT_idPACJENT');
end;

{ TfunkcjaTableDictionary }

constructor TfunkcjaTableDictionary.Create;
begin
  inherited;
  FFunkcjaId := TDictionaryAttribute.Create('FunkcjaId');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FKolejnosc := TDictionaryAttribute.Create('Kolejnosc');
  FAktywny := TDictionaryAttribute.Create('Aktywny');
end;

{ TfunkcjauzytkownikaTableDictionary }

constructor TfunkcjauzytkownikaTableDictionary.Create;
begin
  inherited;
  FFunkcjaUzytkownikaId := TDictionaryAttribute.Create('FunkcjaUzytkownikaId');
  FFunkcjaId := TDictionaryAssociation.Create('FunkcjaId');
  FId_uzytkownika := TDictionaryAssociation.Create('Id_uzytkownika');
end;

{ TgrupaTableDictionary }

constructor TgrupaTableDictionary.Create;
begin
  inherited;
  FidGRUPA := TDictionaryAttribute.Create('idGRUPA');
  FnazwaGRUPA := TDictionaryAttribute.Create('nazwaGRUPA');
end;

{ TjednostkaTableDictionary }

constructor TjednostkaTableDictionary.Create;
begin
  inherited;
  FidJEDNOSTKA := TDictionaryAttribute.Create('idJEDNOSTKA');
  FnazwaJEDNOSTKA := TDictionaryAttribute.Create('nazwaJEDNOSTKA');
  Fulica := TDictionaryAttribute.Create('ulica');
  FnrBUDYNKU := TDictionaryAttribute.Create('nrBUDYNKU');
  FkodPOCZTOWY := TDictionaryAttribute.Create('kodPOCZTOWY');
  Fmiejscowosc := TDictionaryAttribute.Create('miejscowosc');
end;

{ TjednostkaorganizacyjnaTableDictionary }

constructor TjednostkaorganizacyjnaTableDictionary.Create;
begin
  inherited;
  FJednostkaOrganizacyjnaId := TDictionaryAttribute.Create('JednostkaOrganizacyjnaId');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FAktywny := TDictionaryAttribute.Create('Aktywny');
  FJednostkaOrganizacyjnaIdId := TDictionaryAssociation.Create('JednostkaOrganizacyjnaIdId');
end;

{ TkategoriaTableDictionary }

constructor TkategoriaTableDictionary.Create;
begin
  inherited;
  FId_Kategori := TDictionaryAttribute.Create('Id_Kategori');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FOpis := TDictionaryAttribute.Create('Opis');
end;

{ TosobaTableDictionary }

constructor TosobaTableDictionary.Create;
begin
  inherited;
  FidOSOBA := TDictionaryAttribute.Create('idOSOBA');
  FimieOSOBA := TDictionaryAttribute.Create('imieOSOBA');
  FnazwiskoOSOBA := TDictionaryAttribute.Create('nazwiskoOSOBA');
  FPESEL := TDictionaryAttribute.Create('PESEL');
end;

{ TpacjentTableDictionary }

constructor TpacjentTableDictionary.Create;
begin
  inherited;
  FidPACJENT := TDictionaryAttribute.Create('idPACJENT');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
  FJEDNOSTKA_idJEDNOSTKA := TDictionaryAssociation.Create('JEDNOSTKA_idJEDNOSTKA');
  FOSOBA_idOSOBA := TDictionaryAssociation.Create('OSOBA_idOSOBA');
end;

{ TpostTableDictionary }

constructor TpostTableDictionary.Create;
begin
  inherited;
  FId_posta := TDictionaryAttribute.Create('Id_posta');
  FTresc := TDictionaryAttribute.Create('Tresc');
  FData_utworzenia := TDictionaryAttribute.Create('Data_utworzenia');
  FId_posta_1 := TDictionaryAssociation.Create('Id_posta_1');
  FId_subskrypcji := TDictionaryAssociation.Create('Id_subskrypcji');
end;

{ TrolaTableDictionary }

constructor TrolaTableDictionary.Create;
begin
  inherited;
  FRolaId := TDictionaryAttribute.Create('RolaId');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FKolejnosc := TDictionaryAttribute.Create('Kolejnosc');
  FAktywny := TDictionaryAttribute.Create('Aktywny');
end;

{ TsubskrypcjaTableDictionary }

constructor TsubskrypcjaTableDictionary.Create;
begin
  inherited;
  FId_subskrypcji := TDictionaryAttribute.Create('Id_subskrypcji');
  FData_suba := TDictionaryAttribute.Create('Data_suba');
  FData_unsuba := TDictionaryAttribute.Create('Data_unsuba');
  FRolaId := TDictionaryAssociation.Create('RolaId');
  FId_tematu := TDictionaryAssociation.Create('Id_tematu');
  FId_uzytkownika := TDictionaryAssociation.Create('Id_uzytkownika');
end;

{ TtematTableDictionary }

constructor TtematTableDictionary.Create;
begin
  inherited;
  FId_tematu := TDictionaryAttribute.Create('Id_tematu');
  FData_Utworzenia := TDictionaryAttribute.Create('Data_Utworzenia');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FNazwaKodowa := TDictionaryAttribute.Create('NazwaKodowa');
  FData_Zamkniecia := TDictionaryAttribute.Create('Data_Zamkniecia');
  FAktywnoscId := TDictionaryAssociation.Create('AktywnoscId');
  FWidocznoscId := TDictionaryAssociation.Create('WidocznoscId');
end;

{ TtestTableDictionary }

constructor TtestTableDictionary.Create;
begin
  inherited;
  FtestId := TDictionaryAttribute.Create('testId');
  FId_uzytkownika := TDictionaryAttribute.Create('Id_uzytkownika');
end;

{ Ttest_osobaTableDictionary }

constructor Ttest_osobaTableDictionary.Create;
begin
  inherited;
  Ftest_id := TDictionaryAttribute.Create('test_id');
  Ftest_login := TDictionaryAttribute.Create('test_login');
  Ftest_haslo := TDictionaryAttribute.Create('test_haslo');
  Ftest_typ := TDictionaryAttribute.Create('test_typ');
end;

{ TuzytkownikTableDictionary }

constructor TuzytkownikTableDictionary.Create;
begin
  inherited;
  FId_uzytkownika := TDictionaryAttribute.Create('Id_uzytkownika');
  FLogin := TDictionaryAttribute.Create('Login');
  FHaslo := TDictionaryAttribute.Create('Haslo');
  FImie := TDictionaryAttribute.Create('Imie');
  FNazwisko := TDictionaryAttribute.Create('Nazwisko');
  FData_utworzenia := TDictionaryAttribute.Create('Data_utworzenia');
end;

{ TwidocznoscTableDictionary }

constructor TwidocznoscTableDictionary.Create;
begin
  inherited;
  FWidocznoscId := TDictionaryAttribute.Create('WidocznoscId');
  FNazwa := TDictionaryAttribute.Create('Nazwa');
  FKolejnosc := TDictionaryAttribute.Create('Kolejnosc');
  FAktywny := TDictionaryAttribute.Create('Aktywny');
end;

{ TwynikTableDictionary }

constructor TwynikTableDictionary.Create;
begin
  inherited;
  FidWYNIK := TDictionaryAttribute.Create('idWYNIK');
  Fwartosc1 := TDictionaryAttribute.Create('wartosc1');
  Fwartosc2 := TDictionaryAttribute.Create('wartosc2');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
  FALLELE_idALLELE := TDictionaryAssociation.Create('ALLELE_idALLELE');
  FBADANIE_idBADANIE := TDictionaryAssociation.Create('BADANIE_idBADANIE');
end;

{ TzatrudnienieTableDictionary }

constructor TzatrudnienieTableDictionary.Create;
begin
  inherited;
  FidZATRUDNIENIE := TDictionaryAttribute.Create('idZATRUDNIENIE');
  Fhaslo := TDictionaryAttribute.Create('haslo');
  Flogin := TDictionaryAttribute.Create('login');
  FczyAKTYWNY := TDictionaryAttribute.Create('czyAKTYWNY');
  FGRUPA_idGRUPA := TDictionaryAssociation.Create('GRUPA_idGRUPA');
  FJEDNOSTKA_idJEDNOSTKA := TDictionaryAssociation.Create('JEDNOSTKA_idJEDNOSTKA');
  FOSOBA_idOSOBA := TDictionaryAssociation.Create('OSOBA_idOSOBA');
end;

initialization
  RegisterEntity(Taktywnosc);
  RegisterEntity(Tallele);
  RegisterEntity(Tbadanie);
  RegisterEntity(Tfunkcja);
  RegisterEntity(Tfunkcjauzytkownika);
  RegisterEntity(Tgrupa);
  RegisterEntity(Tjednostka);
  RegisterEntity(Tjednostkaorganizacyjna);
  RegisterEntity(Tkategoria);
  RegisterEntity(Tosoba);
  RegisterEntity(Tpacjent);
  RegisterEntity(Tpost);
  RegisterEntity(Trola);
  RegisterEntity(Tsubskrypcja);
  RegisterEntity(Ttemat);
  RegisterEntity(Ttest);
  RegisterEntity(Ttest_osoba);
  RegisterEntity(Tuzytkownik);
  RegisterEntity(Twidocznosc);
  RegisterEntity(Twynik);
  RegisterEntity(Tzatrudnienie);

finalization
  if __Dic <> nil then __Dic.Free

end.
