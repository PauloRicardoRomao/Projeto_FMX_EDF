program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_Cards_Alunos in 'Unit_Cards_Alunos.pas' {form_cards_alunos},
  Unit_Cliente in 'Unit_Cliente.pas' {form_aluno},
  Unit_Popup_Card_Aluno in 'Unit_Popup_Card_Aluno.pas' {form_popup_card_aluno},
  Unit_Ficha_Consulta in 'Unit_Ficha_Consulta.pas' {form_ficha_consulta},
  Unit_Menu_Principal in 'Unit_Menu_Principal.pas' {form_menu_principal},
  Unit_Monta_Treino in 'Unit_Monta_Treino.pas' {form_monta_treino},
  Unit_Info_Basica_Treino in 'Unit_Info_Basica_Treino.pas' {form_info_bsc_treino},
  Unit_Historico_Treinos_Aluno in 'Unit_Historico_Treinos_Aluno.pas' {form_hist_treinos_aluno},
  Unit_Exercicio in 'Unit_Exercicio.pas' {form_exercicios};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tform_menu_principal, form_menu_principal);
  Application.CreateForm(Tform_cards_alunos, form_cards_alunos);
  Application.CreateForm(Tform_aluno, form_aluno);
  Application.CreateForm(Tform_popup_card_aluno, form_popup_card_aluno);
  Application.CreateForm(Tform_ficha_consulta, form_ficha_consulta);
  Application.CreateForm(Tform_monta_treino, form_monta_treino);
  Application.CreateForm(Tform_info_bsc_treino, form_info_bsc_treino);
  Application.CreateForm(Tform_hist_treinos_aluno, form_hist_treinos_aluno);
  Application.CreateForm(Tform_exercicios, form_exercicios);
  Application.Run;
end.
