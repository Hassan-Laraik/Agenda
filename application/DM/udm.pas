unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZDataset, ZConnection;

type

  { TDM }

  TDM = class(TDataModule)
    DSSociete: TDataSource;
    DSdepartement: TDataSource;
    DSContact: TDataSource;
    ZNX: TZConnection;
    ZtblSociete: TZTable;
    ZtblDepartement: TZTable;
    ZtblContact: TZTable;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

