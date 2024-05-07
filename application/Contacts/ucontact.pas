unit uContact;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, DBGrids, DBCtrls, ExtDlgs, PopupNotifier,db;

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
    BtnAjouterPhoto: TButton;
    BtnEffacerPhoto: TButton;
    CMBXDep: TDBLookupComboBox;
    DbedtNom: TDBEdit;
    DbedtGSM: TDBEdit;
    DBGrid1: TDBGrid;
    DBImage1: TDBImage;
    CMBXRS: TDBLookupComboBox;
    EdtRecherche: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PopupNotifier1: TPopupNotifier;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BtnAjouterPhotoClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnEffacerPhotoClick(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnPriorClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
  private
    function Validation_Saisie(): Boolean;

  public

  end;

var
  FrmContact: TFrmContact;

implementation
       uses UDM;
{$R *.lfm}

       { TFrmContact }

procedure TFrmContact.BtnAjouterPhotoClick(Sender: TObject);
begin
if DM.ZtblContact.state in [dsBrowse]  then  exit;
   if OpenPictureDialog1.Execute then
   begin
     TBlobField(DM.ZtblContact.FieldByName('photo')).LoadFromFile(
         OpenPictureDialog1.FileName
     );
   end else
   begin
       DM.ZtblContact.FieldByName('photo').Value:= nil;
   end;
end;

procedure TFrmContact.BtnAnnulerClick(Sender: TObject);
begin
   DM.ZtblContact.Cancel;
   PageControl1.ActivePage:=TabSheet1;
end;

procedure TFrmContact.BtnEffacerPhotoClick(Sender: TObject);
begin
   if DM.ZtblContact.state in [dsBrowse]  then  exit;
     DM.ZtblContact.FieldByName('photo').Value:= nil;
end;

procedure TFrmContact.BtnFirstClick(Sender: TObject);
begin
   DM.ZtblContact.First;
end;

procedure TFrmContact.BtnLastClick(Sender: TObject);
begin
  DM.ZtblContact.Last;
end;

procedure TFrmContact.BtnModifierClick(Sender: TObject);
begin
  DM.ZtblContact.Edit;
   PageControl1.ActivePage:=TabSheet2;
end;

procedure TFrmContact.BtnNextClick(Sender: TObject);
begin
  DM.ZtblContact.NextResultSet;
end;

procedure TFrmContact.BtnNouveauClick(Sender: TObject);
begin
   DM.ZtblContact.Append;
   PageControl1.ActivePage:=TabSheet2;
end;

procedure TFrmContact.BtnPriorClick(Sender: TObject);
begin
  DM.ZtblContact.Prior;
end;

procedure TFrmContact.BtnValiderClick(Sender: TObject);
var
  DataAction: TDataAction  ;
  oldValue : integer;
begin
  PopupNotifier1.Visible:=False;
   if not (Self.Validation_Saisie() = true )then  exit;
   if DM.ZtblContact.State = dsInsert then
    begin
       try
         DM.ZtblContact.Post;
         PageControl1.ActivePage:=TabSheet1;
         exit;
       except
          PopupNotifier1.Text:='Ajout Avortée:  verifier vos données';
          PopupNotifier1.ShowAtPos(500,100);
          PopupNotifier1.Visible:=true;
          DataAction := daAbort;
       end;

    end;
    if DM.ZtblContact.State = dsEdit then
    begin
       try
         oldValue :=  DM.ZtblContact.FieldByName('idcontacts').OldValue;
          DM.ZtblContact.Post;
          PageControl1.ActivePage:=TabSheet1;
          exit;
       except
          PopupNotifier1.Text:='Modification Avortée:  verifier verifier vos données';
          PopupNotifier1.ShowAtPos(500,100);
          PopupNotifier1.Visible:=true;
           DM.ZtblContact.close;
           DM.ZtblContact.Open;
           DM.ZtblContact.Locate('idcontacts',oldValue,[]);
           DM.ZtblContact.Edit;
       end;

    end;





end;

function TFrmContact.Validation_Saisie(): Boolean;
begin
   Result := False;
  if (Length(trim(CMBXRS.Text)) < 1) then
  begin
    ShowMessage('Raison Social doit etre remplis');
      CMBXRS.SetFocus;
    exit;
  end;
  if (Length(trim(CMBXDep.Text)) < 1) then
  begin
    ShowMessage('Departement doit etre remplis');
      CMBXDep.SetFocus;
    exit;
  end;
  if Length(trim(DbedtNom.Text)) < 4 then
  begin
    ShowMessage('Nom, Complet Doit etre remplis');
      DbedtNom.SetFocus;
    exit;
  end;
   if Length(DbedtGSM.Text)  in [1..9] then
  begin
    ShowMessage('Telephone  en  10 Numeros');
      DbedtGSM.SetFocus;
    exit;
  end;

  Result := True;
end;

end.

