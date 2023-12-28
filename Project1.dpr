program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_Cards_Alunos in 'Unit_Cards_Alunos.pas' {form_cards_alunos},
  Unit_Cliente in 'Unit_Cliente.pas' {form_aluno},
  Unit_Popup_Card_Aluno in 'Unit_Popup_Card_Aluno.pas' {form_popup_card_aluno},
  Unit_Ficha_Consulta in 'Unit_Ficha_Consulta.pas' {form_ficha_consulta},
  Unit_Menu_Principal in 'Unit_Menu_Principal.pas' {form_menu_principal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tform_menu_principal, form_menu_principal);
  Application.CreateForm(Tform_cards_alunos, form_cards_alunos);
  Application.CreateForm(Tform_aluno, form_aluno);
  Application.CreateForm(Tform_popup_card_aluno, form_popup_card_aluno);
  Application.CreateForm(Tform_ficha_consulta, form_ficha_consulta);
  Application.Run;
end.
