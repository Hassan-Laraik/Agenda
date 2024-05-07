unit uSociete;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  DBGrids, StdCtrls, DBCtrls;

type

  { TFrmSociete }

  TFrmSociete = class(TForm)
    BtnFirst: TButton;
    BtnPrior: TButton;
    BtnLast: TButton;
    BtnNext: TButton;
    BtnModifier: TButton;
    BtnNouveau: TButton;
    BtnAnnuler: TButton;
    BtnValider: TButton;
    DBedtRS: TDBEdit;
    DBedtSS: TDBEdit;
    DBedtFax: TDBEdit;
    DBedtRib: TDBEdit;
    DBGrid1: TDBGrid;
    EdtRecherche: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure DBedtFaxKeyPress(Sender: TObject; var Key: char);
    procedure DBedtRibKeyPress(Sender: TObject; var Key: char);
  private
     function Validation_Saisie(): Boolean;
  public

  end;

var
  FrmSociete: TFrmSociete;

implementation
      uses UDM;
{$R *.lfm}

      { TFrmSociete }

procedure TFrmSociete.BtnNouveauClick(Sender: TObject);
begin
    DM.ZtblSociete.Append;
    PageControl1.ActivePage:=TabSheet2;
end;

procedure TFrmSociete.BtnValiderClick(Sender: TObject);
begin
    if self.Validation_Saisie() = true then
    begin
        DM.ZtblSociete.Post;
       PageControl1.ActivePage:=TabSheet1;
    end;

end;

procedure TFrmSociete.DBedtFaxKeyPress(Sender: TObject; var Key: char);
begin
  if NOT( key in ['0'..'9',#08]) then
  begin
     key :=#0;
  end;
end;

procedure TFrmSociete.DBedtRibKeyPress(Sender: TObject; var Key: char);
begin
  if NOT( key in ['0'..'9',#08]) then
  begin
     key :=#0;
  end;
end;

function TFrmSociete.Validation_Saisie(): Boolean;
begin
   Result := False;
  if (Length(trim(DBedtRS.Text)) < 1) then
  begin
    ShowMessage('Raison sociale doit etre remplis');
      DBedtRS.SetFocus;
    exit;
  end;
  if (Length(trim(DBedtSS.Text)) < 1) then
  begin
    ShowMessage('Raison sociale doit etre remplis');
      DBedtSS.SetFocus;
    exit;
  end;
   if Length(DBedtFax.Text)  in [1..9] then
  begin
    ShowMessage('Fax en  10 Numeros');
      DBedtFax.SetFocus;
    exit;
  end;
   if Length(DBedtRib.Text)  in [1..23]  then
  begin
    ShowMessage('RIB en 24 Numero');
      DBedtRib.SetFocus;
    exit;
  end;
  Result := True;
end;

procedure TFrmSociete.BtnModifierClick(Sender: TObject);
begin
   DM.ZtblSociete.Edit;
   PageControl1.ActivePage:=TabSheet2;
end;

procedure TFrmSociete.BtnAnnulerClick(Sender: TObject);
begin
   DM.ZtblSociete.Cancel;
   PageControl1.ActivePage:=TabSheet1;
end;

end.

