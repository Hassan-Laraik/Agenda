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
    FrmSociete.ShowModal;
  end;

procedure TFrmPrincipale.BtnDepartementClick(Sender: TObject);
begin
  FrmDepartement.ShowModal;
end;

procedure TFrmPrincipale.BtnContactClick(Sender: TObject);
begin
  FrmContact.ShowModal;
end;

end.

