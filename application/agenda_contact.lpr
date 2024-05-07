program Agenda_Contact;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uPrincipale, uSociete, uDepartement, uContact, uDM
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmPrincipale, FrmPrincipale);
  Application.CreateForm(TFrmSociete, FrmSociete);
  Application.CreateForm(TFrmDepartement, FrmDepartement);
  Application.CreateForm(TFrmContact, FrmContact);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

