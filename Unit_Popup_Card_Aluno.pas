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
    btn_treino_atual_ppp: TRectangle;
    lbl_btn_treino_atual_ppp: TLabel;
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
    procedure btn_treino_atual_pppMouseLeave(Sender: TObject);
    procedure btn_treino_atual_pppMouseEnter(Sender: TObject);
    procedure btn_treino_atual_pppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_aluno, i : integer;
    nome_aluno : string;
  end;

var
  form_popup_card_aluno: Tform_popup_card_aluno;

implementation

{$R *.fmx}

uses Unit_Cards_Alunos, Unit_Cliente, Unit_Ficha_Consulta,
  Unit_Info_Basica_Treino, Unit_DM_Treino, Unit_Consulta_Treino_Atual,
  Unit_Historico_Treinos_Aluno, Unit_DM_Principal;//, Unit_Historico_Treinos_Aluno;


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
  with dm_principal do
  begin
    ado_query_consulta_aluno.Close;
    ado_query_consulta_aluno.Parameters.ParamByName('ID_ALUNO').Value := id_aluno;
    ado_query_consulta_aluno.Open;
    nome_aluno := ado_query_consulta_alunoNOME_ALUNO.AsString;
  end;
  form_hist_treinos_aluno := Tform_hist_treinos_aluno.Create(Application);
  form_hist_treinos_aluno.id_aluno := id_aluno;
  form_hist_treinos_aluno.ShowModal;
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

procedure Tform_popup_card_aluno.btn_treino_atual_pppClick(Sender: TObject);
var
  j : integer;
begin
  i := 0;
  with dm_treino do
  begin
    ado_proc_consulta_treino_atual.Parameters.ParamByName('@ID_ALUNO').Value := id_aluno;
    ado_proc_consulta_treino_atual.ExecProc;
    ado_query_consulta_aluno_auxiliar.Close;
    ado_query_consulta_aluno_auxiliar.Parameters.ParamByName('ID_ALUNO').Value := id_aluno;
    ado_query_consulta_aluno_auxiliar.Open;
    ado_proc_consulta_treino_atual.Open;
    with ado_proc_consulta_treino_atual do
    begin
      while not ado_proc_consulta_treino_atual.Eof do
      begin
        j := ado_proc_consulta_treino_atual.FieldByName('ID_TREINO_DIA').AsInteger;
        i := i + 1;
        ado_proc_consulta_treino_atual.Next;
      end;
    end;
    form_consulta_treino_atual := Tform_consulta_treino_atual.Create(Application);
    with form_consulta_treino_atual do
    begin
      lbl_tit_fun_consulta_treino.Text := form_consulta_treino_atual.lbl_tit_fun_consulta_treino.Text + ado_query_consulta_aluno_auxiliarNOME_ALUNO.AsString;
      lbl_mdl_treino.Text := lbl_mdl_treino.Text + ' ' + ado_proc_consulta_treino_atual.FieldByName('MODELO_TREINO').AsString;
      lbl_fco_treino.Text := lbl_fco_treino.Text + ' ' + ado_proc_consulta_treino_atual.FieldByName('FOCO_TREINO').AsString;
    end;
  end;
  form_consulta_treino_atual.ShowModal
end;

procedure Tform_popup_card_aluno.btn_treino_atual_pppMouseEnter(
  Sender: TObject);
begin
  btn_treino_atual_ppp.Fill.Color := $FF214358;
  lbl_btn_treino_atual_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_treino_atual_pppMouseLeave(Sender: TObject);
begin
  btn_treino_atual_ppp.Fill.Color := $FF03223F;
  lbl_btn_treino_atual_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
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
