unit Unit_Menu_Novo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList,
  FMX.ImgList;

type
  Tform_menu_novo = class(TForm)
    layout_fundo: TLayout;
    layout_header: TLayout;
    pnl_fundo_header: TRectangle;
    layout_container: TLayout;
    StyleBook1: TStyleBook;
    btn_alunos: TRectangle;
    btn_novo_aluno: TRectangle;
    btn_agenda: TRectangle;
    btn_exercicios: TRectangle;
    img_alunos: TImage;
    img_novo_aluno: TImage;
    img_agenda: TImage;
    img_exercicios: TImage;
    lbl_btn_alunos: TLabel;
    lbl_btn_novo_aluno: TLabel;
    lbl_btn_agenda: TLabel;
    lbl_btn_exercicios: TLabel;
    pnl_fundo: TRectangle;
    layout_container_conteudo: TLayout;
    pnl_conteudo_container_conteudo: TRectangle;
    procedure btn_alunosMouseEnter(Sender: TObject);
    procedure btn_alunosMouseLeave(Sender: TObject);
    procedure btn_novo_alunoMouseLeave(Sender: TObject);
    procedure btn_agendaMouseLeave(Sender: TObject);
    procedure btn_exerciciosMouseLeave(Sender: TObject);
    procedure btn_novo_alunoMouseEnter(Sender: TObject);
    procedure btn_agendaMouseEnter(Sender: TObject);
    procedure btn_exerciciosMouseEnter(Sender: TObject);
    procedure btn_alunosClick(Sender: TObject);
    procedure btn_agendaClick(Sender: TObject);
    procedure btn_exerciciosClick(Sender: TObject);
    procedure btn_novo_alunoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    formAlunosVisible, formNovoAlunoVisible, formAgendaVisible, formExerciciosVisible: Boolean;
  public
    { Public declarations }
  end;

var
  form_menu_novo: Tform_menu_novo;

implementation

{$R *.fmx}

uses Unit_Cards_Alunos, Unit_Agendamentos, Unit_Exercicio, Unit_Cliente;


procedure Tform_menu_novo.btn_agendaClick(Sender: TObject);
begin
  form_agendamentos := Tform_agendamentos.Create(Application);
  form_agendamentos.ShowModal;
end;

procedure Tform_menu_novo.btn_agendaMouseEnter(Sender: TObject);
begin
  btn_agenda.Fill.Color := TAlphaColorRec.Darkslategray;
  lbl_btn_agenda.TextSettings.FontColor := TAlphaColorRec.Aliceblue;
end;

procedure Tform_menu_novo.btn_agendaMouseLeave(Sender: TObject);
begin
  btn_agenda.Fill.Color := $FF2E4347;
  lbl_btn_agenda.TextSettings.FontColor := TAlphaColorRec.Blanchedalmond;
end;

procedure Tform_menu_novo.btn_alunosClick(Sender: TObject);
begin
  //form_cards_alunos := Tform_cards_alunos.Create(Application);
 // form_cards_alunos.v_agendamento := 0;
 // Unit_Cards_Alunos.form_cards_alunos.ShowModal;

  layout_container.AddObject(Tform_cards_alunos.Create(Self).pnl_fundo);
  form_cards_alunos.v_agendamento := 0;
end;

procedure Tform_menu_novo.btn_alunosMouseEnter(Sender: TObject);
begin
  btn_alunos.Fill.Color := TAlphaColorRec.Darkslategray;
  lbl_btn_alunos.TextSettings.FontColor := TAlphaColorRec.Aliceblue;
end;

procedure Tform_menu_novo.btn_alunosMouseLeave(Sender: TObject);
begin
  btn_alunos.Fill.Color := $FF2E4347;
  lbl_btn_alunos.TextSettings.FontColor := TAlphaColorRec.Blanchedalmond;
end;

procedure Tform_menu_novo.btn_exerciciosClick(Sender: TObject);
var
  altura_cont, largura_cont: Single;
begin
  form_exercicios := Tform_exercicios.Create(Application);
  Unit_Exercicio.form_exercicios.ShowModal;

  formAlunosVisible := False;
  formNovoAlunoVisible := False;
  formAgendaVisible := False;
  //formExerciciosVisible := False;

 { if formExerciciosVisible = False then
  begin
    if not Assigned(form_exercicios) then
       form_exercicios := Tform_exercicios.Create(Self);

    formExerciciosVisible := True;
    pnl_conteudo_container_conteudo.AddObject(form_exercicios.Layout1);
    layout_container_conteudo.Width := form_exercicios.Width;
    layout_container_conteudo.Height := form_exercicios.Height;
    //layout_container.AddObject(form_exercicios.Layout1);
   // form_exercicios.Layout1.Align := TAlignLayout.Center;
    pnl_conteudo_container_conteudo.Visible := True;

  end
  else if formExerciciosVisible = True then
  begin
    // Remova o Layout1 do form_exercicios do layout_container
    //layout_container.RemoveObject(form_exercicios.Layout1);
    pnl_conteudo_container_conteudo.RemoveObject(form_exercicios.Layout1);
    formExerciciosVisible := False;
    pnl_conteudo_container_conteudo.Visible := False;
  /end;                      }

end;

procedure Tform_menu_novo.btn_exerciciosMouseEnter(Sender: TObject);
begin
  btn_exercicios.Fill.Color := TAlphaColorRec.Darkslategray;
  lbl_btn_exercicios.TextSettings.FontColor := TAlphaColorRec.Aliceblue;
end;

procedure Tform_menu_novo.btn_exerciciosMouseLeave(Sender: TObject);
begin
  btn_exercicios.Fill.Color := $FF2E4347;
  lbl_btn_exercicios.TextSettings.FontColor := TAlphaColorRec.Blanchedalmond;
end;

procedure Tform_menu_novo.btn_novo_alunoClick(Sender: TObject);
begin
  form_aluno := Tform_aluno.Create(Application);
  Unit_Cliente.form_aluno.ShowModal;

  formAlunosVisible := False;
  //formNovoAlunoVisible := False;
  formAgendaVisible := False;
  formExerciciosVisible := False;

  {if formNovoAlunoVisible = False then
  begin
    if not Assigned(form_exercicios) then
       form_aluno := Tform_aluno.Create(Self);

    formNovoAlunoVisible := True;
    pnl_conteudo_container_conteudo.AddObject(form_aluno.Layout1);
   // form_exercicios.Layout1.Align := TAlignLayout.Center;
    layout_container_conteudo.Width := form_aluno.Width;
    layout_container_conteudo.Height := form_aluno.Height;
    pnl_conteudo_container_conteudo.Visible := True;

  end
  else if formNovoAlunoVisible = True then
  begin
    // Remova o Layout1 do form_exercicios do layout_container
    pnl_conteudo_container_conteudo.RemoveObject(form_aluno.Layout1);
    formNovoAlunoVisible := False;
    pnl_conteudo_container_conteudo.Visible := False;
  end;
   }
end;

procedure Tform_menu_novo.btn_novo_alunoMouseEnter(Sender: TObject);
begin
  btn_novo_aluno.Fill.Color := TAlphaColorRec.Darkslategray;
  lbl_btn_novo_aluno.TextSettings.FontColor := TAlphaColorRec.Aliceblue;
end;

procedure Tform_menu_novo.btn_novo_alunoMouseLeave(Sender: TObject);
begin
  btn_novo_aluno.Fill.Color := $FF2E4347;
  lbl_btn_novo_aluno.TextSettings.FontColor := TAlphaColorRec.Blanchedalmond;
end;

procedure Tform_menu_novo.FormCreate(Sender: TObject);
begin
  formAlunosVisible := False;
  formNovoAlunoVisible := False;
  formAgendaVisible := False;
  formExerciciosVisible := False;
  pnl_conteudo_container_conteudo.Visible := False;
end;

end.
