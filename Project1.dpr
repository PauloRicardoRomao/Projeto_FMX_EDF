program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_Cards_Alunos in 'Unit_Cards_Alunos.pas' {form_cards_alunos},
  Unit_Cliente in 'Unit_Cliente.pas' {form_aluno};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tform_cards_alunos, form_cards_alunos);
  Application.CreateForm(Tform_aluno, form_aluno);
  Application.Run;
end.
