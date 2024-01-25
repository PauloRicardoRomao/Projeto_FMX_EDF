unit Unit_Menu_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FireDAC.Phys.MSSQLMeta;

type
  Tform_menu_principal = class(TForm)
    pnl_fundo: TRectangle;
    pnl_header: TPanel;
    scr_box: TScrollBox;
    StyleBook1: TStyleBook;
    btn_novo_aluno: TRectangle;
    btn_cards_alunos: TRectangle;
    btn_exercicios: TRectangle;
    lbl_btn_cards_alunos: TLabel;
    img_btn_cards_alunos: TImage;
    lbl_btn_exercicios: TLabel;
    lbl_btn_novo_aluno: TLabel;
    img_btn_exercicios: TImage;
    img_btn_novo_aluno: TImage;
    btn_agendamento: TRectangle;
    lbl_btn_agendamento: TLabel;
    img_btn_agendamento: TImage;
    procedure btn_cards_alunosClick(Sender: TObject);
    procedure btn_exerciciosClick(Sender: TObject);
    procedure btn_novo_alunoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cards_alunosMouseEnter(Sender: TObject);
    procedure btn_cards_alunosMouseLeave(Sender: TObject);
    procedure btn_exerciciosMouseLeave(Sender: TObject);
    procedure btn_exerciciosMouseEnter(Sender: TObject);
    procedure btn_novo_alunoMouseEnter(Sender: TObject);
    procedure btn_novo_alunoMouseLeave(Sender: TObject);
    procedure btn_agendamentoMouseEnter(Sender: TObject);
    procedure btn_agendamentoMouseLeave(Sender: TObject);
    procedure img_btn_agendamentoMouseLeave(Sender: TObject);
    procedure img_btn_agendamentoMouseEnter(Sender: TObject);
    procedure btn_agendamentoClick(Sender: TObject);
    procedure img_btn_agendamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_menu_principal: Tform_menu_principal;

implementation

{$R *.fmx}

uses Unit_Cards_Alunos, Unit_Cliente, Unit_Ficha_Consulta,
  Unit_Popup_Card_Aluno, Unit_Exercicio, Unit_Agendamentos;


procedure Tform_menu_principal.btn_cards_alunosMouseEnter(Sender: TObject);
begin
  btn_cards_alunos.Fill.Color := $FF942222;
end;

procedure Tform_menu_principal.btn_cards_alunosMouseLeave(Sender: TObject);
begin
  btn_cards_alunos.Fill.Color := $FF2E4347;
end;

procedure Tform_menu_principal.btn_novo_alunoMouseEnter(Sender: TObject);
begin
  btn_novo_aluno.Fill.Color := $FF942222;
end;

procedure Tform_menu_principal.btn_novo_alunoMouseLeave(Sender: TObject);
begin
  btn_novo_aluno.Fill.Color := $FF2E4347;
end;

procedure Tform_menu_principal.btn_exerciciosMouseEnter(Sender: TObject);
begin
  btn_exercicios.Fill.Color := $FF942222;
end;

procedure Tform_menu_principal.btn_exerciciosMouseLeave(Sender: TObject);
begin
  btn_exercicios.Fill.Color := $FF2E4347;
end;

procedure Tform_menu_principal.btn_agendamentoClick(Sender: TObject);
begin
  form_agendamentos := Tform_agendamentos.Create(Application);
  form_agendamentos.ShowModal;
end;

procedure Tform_menu_principal.btn_agendamentoMouseEnter(Sender: TObject);
begin
  btn_agendamento.Fill.Color := $FF942222;
end;

procedure Tform_menu_principal.btn_agendamentoMouseLeave(Sender: TObject);
begin
  btn_agendamento.Fill.Color := $FF2E4347;
end;

procedure Tform_menu_principal.btn_cards_alunosClick(Sender: TObject);
begin
  form_cards_alunos := Tform_cards_alunos.Create(Application);
  Unit_Cards_Alunos.form_cards_alunos.ShowModal;
end;

procedure Tform_menu_principal.btn_novo_alunoClick(Sender: TObject);
begin
  form_aluno := Tform_aluno.Create(Application);
  Unit_Cliente.form_aluno.ShowModal;
end;

procedure Tform_menu_principal.btn_exerciciosClick(Sender: TObject);
begin
  form_exercicios := Tform_exercicios.Create(Application);
  Unit_Exercicio.form_exercicios.ShowModal;
end;

procedure Tform_menu_principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_menu_principal := nil;
  form_menu_principal.Free;
end;

procedure Tform_menu_principal.img_btn_agendamentoClick(Sender: TObject);
begin
  form_agendamentos := Tform_agendamentos.Create(Application);
  form_agendamentos.ShowModal;
end;

procedure Tform_menu_principal.img_btn_agendamentoMouseEnter(Sender: TObject);
begin
  btn_agendamento.Fill.Color := $FF942222;
end;

procedure Tform_menu_principal.img_btn_agendamentoMouseLeave(Sender: TObject);
begin
  btn_agendamento.Fill.Color := $FF2E4347;
end;

end.
