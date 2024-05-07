unit uDepartement;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, DBGrids, DBCtrls;

type

  { TFrmDepartement }

  TFrmDepartement = class(TForm)
    BtnAnnuler: TButton;
    BtnFirst: TButton;
    BtnLast: TButton;
    BtnModifier: TButton;
    BtnNext: TButton;
    BtnNouveau: TButton;
    BtnPrior: TButton;
    BtnValider: TButton;
    DBedtAdresse: TDBEdit;
    DBedtDepartement: TDBEdit;
    DBedtFonction: TDBComboBox;
    DBedtPhone: TDBEdit;
    DBGrid1: TDBGrid;
    EdtRecherche: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure DBedtPhoneKeyPress(Sender: TObject; var Key: char);
  private
    function Validation_Saisie(): Boolean;

  public

  end;

var
  FrmDepartement: TFrmDepartement;

implementation
   uses UDM;
{$R *.lfm}

   { TFrmDepartement }

   procedure TFrmDepartement.BtnNouveauClick(Sender: TObject);
   begin
     DM.ZtblDepartement.Append;
    PageControl1.ActivePage:=TabSheet2;
   end;

procedure TFrmDepartement.BtnValiderClick(Sender: TObject);
begin
   if self.Validation_Saisie() = true then
    begin
        DM.ZtblDepartement.Post;
       PageControl1.ActivePage:=TabSheet1;
    end;

end;

procedure TFrmDepartement.DBedtPhoneKeyPress(Sender: TObject; var Key: char);
begin
   if NOT( key in ['0'..'9',#08]) then
  begin
     key :=#0;
  end;
end;

procedure TFrmDepartement.BtnModifierClick(Sender: TObject);
begin
   DM.ZtblDepartement.Edit;
   PageControl1.ActivePage:=TabSheet2;
end;

procedure TFrmDepartement.BtnAnnulerClick(Sender: TObject);
begin
  DM.ZtblDepartement.Cancel;
   PageControl1.ActivePage:=TabSheet1;
end;

function TFrmDepartement.Validation_Saisie(): Boolean;
begin
   Result := False;
  if (Length(trim(DBedtDepartement.Text)) < 1) then
  begin
    ShowMessage('Departementv doit etre remplis');
      DBedtDepartement.SetFocus;
    exit;
  end;
  if (Length(trim(DBedtFonction.Text)) < 1) then
  begin
    ShowMessage('Fonction doit etre remplis');
      DBedtFonction.SetFocus;
    exit;
  end;
   if Length(DBedtPhone.Text)  in [1..9] then
  begin
    ShowMessage('Telephone  en  10 Numeros');
      DBedtPhone.SetFocus;
    exit;
  end;

  Result := True;
end;
end.

