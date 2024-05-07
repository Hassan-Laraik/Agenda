unit uContact;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, DBGrids;

type

  { TFrmContact }

  TFrmContact = class(TForm)
    BtnAnnuler: TButton;
    BtnFirst: TButton;
    BtnLast: TButton;
    BtnModifier: TButton;
    BtnNext: TButton;
    BtnNouveau: TButton;
    BtnPrior: TButton;
    BtnValider: TButton;
    DBGrid1: TDBGrid;
    EdtRecherche: TEdit;
    PageControl1: TPageControl;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
  private

  public

  end;

var
  FrmContact: TFrmContact;

implementation
       uses UDM;
{$R *.lfm}

end.

