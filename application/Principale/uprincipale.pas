unit uPrincipale;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFrmPrincipale }

  TFrmPrincipale = class(TForm)
    BtnSociete: TButton;
    BtnDepartement: TButton;
    BtnContact: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnContactClick(Sender: TObject);
    procedure BtnDepartementClick(Sender: TObject);
    procedure BtnSocieteClick(Sender: TObject);
  private

  public

  end;

var
  FrmPrincipale: TFrmPrincipale;

implementation
  uses uSociete,uDepartement,uContact;
{$R *.lfm}

  { TFrmPrincipale }

  procedure TFrmPrincipale.BtnSocieteClick(Sender: TObject);
  begin
    //FrmSociete.ShowModal;
    FrmSociete.ShowOnTop;
    FrmSociete.PageControl1.ActivePage := FrmSociete.TabSheet1;
    FrmSociete.PageControl1.ShowTabs:=False;
  end;

procedure TFrmPrincipale.BtnDepartementClick(Sender: TObject);
begin
  //FrmDepartement.ShowModal;
   FrmDepartement.ShowOnTop;
    FrmDepartement.PageControl1.ActivePage := FrmDepartement.TabSheet1;
    FrmDepartement.PageControl1.ShowTabs:=False;
end;

procedure TFrmPrincipale.BtnContactClick(Sender: TObject);
begin
 // FrmContact.ShowModal;
    FrmContact.ShowOnTop;
    FrmContact.PageControl1.ActivePage := FrmContact.TabSheet1;
    FrmContact.PageControl1.ShowTabs:=False;
end;

end.

