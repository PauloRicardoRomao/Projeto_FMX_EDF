unit Unit_Popup_Card_Aluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  Tform_popup_card_aluno = class(TForm)
    pnl_ppp_card_aluno: TRectangle;
    btn_inf_aluno_ppp: TRectangle;
    lbl_btn_inf_aluno_ppp: TLabel;
    btn_cad_ficha_aluno_ppp: TRectangle;
    lbl_btn_cad_ficha_aluno_ppp: TLabel;
    btn_cad_treino_aluno_ppp: TRectangle;
    lbl_cad_treino_aluno_ppp: TLabel;
    btn_hist_treino_aluno_ppp: TRectangle;
    lbl_btn_hist_treino_aluno_ppp: TLabel;
    btn_hist_fichas_consultas_aluno_ppp: TRectangle;
    lbl_btn_hist_fichas_consultas_aluno_ppp: TLabel;
    procedure btn_cad_ficha_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_cad_ficha_aluno_pppMouseLeave(Sender: TObject);
    procedure btn_inf_aluno_pppMouseLeave(Sender: TObject);
    procedure btn_inf_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_inf_aluno_pppClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cad_ficha_aluno_pppClick(Sender: TObject);
    procedure btn_cad_treino_aluno_pppMouseLeave(Sender: TObject);
    procedure btn_cad_treino_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_cad_treino_aluno_pppClick(Sender: TObject);
    procedure btn_hist_treino_aluno_pppMouseLeave(Sender: TObject);
    procedure btn_hist_treino_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_hist_treino_aluno_pppClick(Sender: TObject);
    procedure btn_hist_fichas_consultas_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_hist_fichas_consultas_aluno_pppMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_aluno : integer;
  end;

var
  form_popup_card_aluno: Tform_popup_card_aluno;

implementation

{$R *.fmx}

uses Unit_Cards_Alunos, Unit_Cliente, Unit_Ficha_Consulta,
  Unit_Info_Basica_Treino, Unit_Historico_Treinos_Aluno;


procedure Tform_popup_card_aluno.btn_cad_ficha_aluno_pppMouseEnter(
  Sender: TObject);
begin
  btn_cad_ficha_aluno_ppp.Fill.Color := $FF214358;
  lbl_btn_cad_ficha_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_cad_ficha_aluno_pppMouseLeave(
  Sender: TObject);
begin
  btn_cad_ficha_aluno_ppp.Fill.Color := $FF03223F;
  lbl_btn_cad_ficha_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_cad_treino_aluno_pppClick(Sender: TObject);
begin
  form_info_bsc_treino := Tform_info_bsc_treino.Create(Application);
  form_info_bsc_treino.id_aluno := id_aluno;
  Unit_Info_Basica_Treino.form_info_bsc_treino.ShowModal;
end;

procedure Tform_popup_card_aluno.btn_cad_treino_aluno_pppMouseEnter(
  Sender: TObject);
begin
  btn_cad_treino_aluno_ppp.Fill.Color := $FF214358;
  lbl_cad_treino_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_cad_treino_aluno_pppMouseLeave(
  Sender: TObject);
begin
  btn_cad_treino_aluno_ppp.Fill.Color := $FF03223F;
  lbl_cad_treino_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_hist_fichas_consultas_aluno_pppMouseEnter(
  Sender: TObject);
begin
  btn_hist_fichas_consultas_aluno_ppp.Fill.Color := $FF214358;
  lbl_btn_hist_fichas_consultas_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_hist_fichas_consultas_aluno_pppMouseLeave(
  Sender: TObject);
begin
  btn_hist_fichas_consultas_aluno_ppp.Fill.Color := $FF03223F;
  lbl_btn_hist_fichas_consultas_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_hist_treino_aluno_pppClick(
  Sender: TObject);
begin
  form_hist_treinos_aluno := Tform_hist_treinos_aluno.Create(Application);
  form_hist_treinos_aluno.id_aluno := id_aluno;
  Unit_Historico_Treinos_Aluno.form_hist_treinos_aluno.ShowModal;
end;

procedure Tform_popup_card_aluno.btn_hist_treino_aluno_pppMouseEnter(
  Sender: TObject);
begin
  btn_hist_treino_aluno_ppp.Fill.Color := $FF214358;
  lbl_btn_hist_treino_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_hist_treino_aluno_pppMouseLeave(
  Sender: TObject);
begin
  btn_hist_treino_aluno_ppp.Fill.Color := $FF03223F;
  lbl_btn_hist_treino_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_inf_aluno_pppMouseEnter(Sender: TObject);
begin
  btn_inf_aluno_ppp.Fill.Color := $FF214358;
  lbl_btn_inf_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_inf_aluno_pppMouseLeave(Sender: TObject);
begin
  btn_inf_aluno_ppp.Fill.Color := $FF03223F;
  lbl_btn_inf_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_inf_aluno_pppClick(Sender: TObject);
begin
  form_aluno := Tform_aluno.Create(Application);
  form_aluno.id_aluno := id_aluno;
  form_aluno.ShowModal;
  //form_popup_card_aluno.Close;
end;

procedure Tform_popup_card_aluno.btn_cad_ficha_aluno_pppClick(Sender: TObject);
begin
  form_ficha_consulta := Tform_ficha_consulta.Create(Application);
  form_ficha_consulta.id_aluno := id_aluno;
  Unit_Ficha_Consulta.form_ficha_consulta.ShowModal;
  //form_popup_card_aluno.Close;
end;

procedure Tform_popup_card_aluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_popup_card_aluno := Nil;
  form_popup_card_aluno.Free;
end;

end.
