unit Unit_Ficha_Consulta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Menus, FMX.Layouts;

type
  Tform_ficha_consulta = class(TForm)
    pnl_fundo_med_corp: TRectangle;
    pnl_fundo_med_cir: TRectangle;
    lbl_cic_pei: TLabel;
    edt_cir_pei: TEdit;
    lbl_cir_abd: TLabel;
    edt_cir_abd: TEdit;
    lbl_cir_alt: TLabel;
    edt_cir_alt: TEdit;
    lbl_cir_bra_dir: TLabel;
    edt_cir_bra_dir: TEdit;
    lbl_cir_bra_esq: TLabel;
    edt_cir_bra_esq: TEdit;
    lbl_cir_cin: TLabel;
    edt_cir_cin: TEdit;
    lbl_cir_data: TLabel;
    edt_data_med_cir: TDateEdit;
    lbl_cir_out_med: TLabel;
    mmo_cir_out_med: TMemo;
    lbl_cir_pan_dir: TLabel;
    edt_cir_pan_dir: TEdit;
    lbl_cir_pan_esq: TLabel;
    edt_cir_pan_esq: TEdit;
    lbl_cir_per_dir: TLabel;
    edt_cir_per_dir: TEdit;
    lbl_cir_per_esq: TLabel;
    edt_cir_per_esq: TEdit;
    lbl_cir_peso: TLabel;
    edt_cir_peso: TEdit;
    lbl_cir_qua: TLabel;
    edt_cir_qua: TEdit;
    btn_grava_med_cir: TRectangle;
    lbl_btn_grava_med_cir: TLabel;
    btn_lmp_med_cir: TRectangle;
    lbl_btn_lmp_med_cir: TLabel;
    lbl_tit_fun_med_cir: TLabel;
    pnl_fundo_med_dob_cut: TRectangle;
    lbl_db_sub_med_dob_cut: TLabel;
    edt_db_sub_med_dob_cut: TEdit;
    lbl_db_sup_med_dob_cut: TLabel;
    edt_db_sup_med_dob_cut: TEdit;
    lbl_db_trc_med_dob_cut: TLabel;
    edt_db_trc_med_dob_cut: TEdit;
    lbl_db_pnm_med_dob_cut: TLabel;
    edt_db_pnm_med_dob_cut: TEdit;
    lbl_db_axl_med_dob_cut: TLabel;
    edt_db_axl_med_dob_cut: TEdit;
    lbl_data_med_dob_cut: TLabel;
    edt_data_med_dob_cut: TDateEdit;
    lbl_out_med_dob_cut: TLabel;
    mmo_out_med_dob_cut: TMemo;
    lbl_db_bcp_med_dob_cut: TLabel;
    edt_db_bcp_med_dob_cut: TEdit;
    lbl_db_abd_med_dob_cut: TLabel;
    edt_db_abd_med_dob_cut: TEdit;
    btn_grava_db_cut: TRectangle;
    lbl_btn_grava_db_cut: TLabel;
    btn_lmp_db_cut: TRectangle;
    lbl_btn_lmp_db_cut: TLabel;
    lbl_tit_fun_med_dob_cut: TLabel;
    StyleBook1: TStyleBook;
    mnu_cad: TMenuBar;
    menu_med_corp_cir: TMenuItem;
    menu_med_corp_dob_cut: TMenuItem;
    lbl_dsc_menu: TLabel;
    scr_box_fundo: TScrollBox;
    procedure menu_med_corp_cirClick(Sender: TObject);
    procedure menu_med_corp_dob_cutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_grava_med_cirMouseLeave(Sender: TObject);
    procedure btn_grava_med_cirMouseEnter(Sender: TObject);
    procedure btn_lmp_med_cirMouseEnter(Sender: TObject);
    procedure btn_lmp_med_cirMouseLeave(Sender: TObject);
    procedure btn_grava_db_cutMouseEnter(Sender: TObject);
    procedure btn_grava_db_cutMouseLeave(Sender: TObject);
    procedure btn_lmp_db_cutMouseEnter(Sender: TObject);
    procedure btn_lmp_db_cutMouseLeave(Sender: TObject);
    procedure btn_lmp_med_cirClick(Sender: TObject);
    procedure btn_lmp_db_cutClick(Sender: TObject);
    procedure btn_grava_med_cirClick(Sender: TObject);
    procedure btn_grava_db_cutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_aluno : integer;
  end;

var
  form_ficha_consulta: Tform_ficha_consulta;

implementation

{$R *.fmx}

uses Unit_DM_Principal;


procedure LimparControlesDentroDoRectangle(Rectangle: TRectangle);
var
  i, j: Integer;
begin
  for i := 0 to Rectangle.ChildrenCount - 1 do
  begin
    if Rectangle.Children[i] is TLabel then
    begin
      for j := 0 to TLabel(Rectangle.Children[i]).ChildrenCount - 1 do
      begin
        if TLabel(Rectangle.Children[i]).Children[j] is TEdit then
          TEdit(TLabel(Rectangle.Children[i]).Children[j]).Text := ''
        else if TLabel(Rectangle.Children[i]).Children[j] is TMemo then
          TMemo(TLabel(Rectangle.Children[i]).Children[j]).Lines.Clear;
      end;
    end;
  end;
end;

procedure Tform_ficha_consulta.menu_med_corp_cirClick(Sender: TObject);
begin
  pnl_fundo_med_dob_cut.Visible := False;
  pnl_fundo_med_cir.Visible := True;
end;

procedure Tform_ficha_consulta.menu_med_corp_dob_cutClick(Sender: TObject);
begin
  pnl_fundo_med_cir.Visible := False;
  pnl_fundo_med_dob_cut.Visible := True;
end;

procedure Tform_ficha_consulta.btn_grava_db_cutClick(Sender: TObject);
var
  data : TDate;
  triceps, biceps, subescapular, suprailiaca, abdominal, axilar, perna : currency;
  outras_medicoes : string;
begin

  data := edt_data_med_dob_cut.Date;
  triceps := StrToCurr(edt_db_trc_med_dob_cut.Text);
  biceps := StrToCurr(edt_db_bcp_med_dob_cut.Text);
  subescapular := StrToCurr(edt_db_sub_med_dob_cut.Text);
  suprailiaca := StrToCurr(edt_db_sup_med_dob_cut.Text);
  abdominal := StrToCurr(edt_db_abd_med_dob_cut.Text);
  axilar := StrToCurr(edt_db_axl_med_dob_cut.Text);
  perna := StrToCurr(edt_db_pnm_med_dob_cut.Text);
  outras_medicoes := mmo_out_med_dob_cut.Lines.Text;

  try
    with dm_principal do
    begin
      with ado_proc_cad_aluno_db_cut_corp.Parameters do
      begin
        ParamByName('@ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := id_aluno; //////usar adoquery para contar e verificar se tem algum aluno com tal codigo se houver abrir como att, se não houver abrir como cad
        ParamByName('@DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := data;
        ParamByName('@DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := triceps;
        ParamByName('@DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := biceps;
        ParamByName('@DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := subescapular;
        ParamByName('@DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := suprailiaca;
        ParamByName('@DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := abdominal;
        ParamByName('@DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := axilar;
        ParamByName('@DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := perna;
        ParamByName('@OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS').Value := outras_medicoes;
        ado_proc_cad_aluno_db_cut_corp.ExecProc;
      end;
    end;
    ShowMessage('Medidas cadastrada com sucesso!');
    LimparControlesDentroDoRectangle(pnl_fundo_med_dob_cut);
    except
    on E: Exception do
    begin
      // Manipular a exceção aqui
      ShowMessage('Erro: ' + E.Message);
    end;
  end;
end;

procedure Tform_ficha_consulta.btn_grava_db_cutMouseEnter(Sender: TObject);
begin
  btn_grava_db_cut.Fill.Color := $FF214358;
  lbl_btn_grava_db_cut.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_grava_db_cutMouseLeave(Sender: TObject);
begin
  btn_grava_db_cut.Fill.Color := $FF03223F;
  lbl_btn_grava_db_cut.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.btn_grava_med_cirClick(Sender: TObject);
var
  data : TDate;
  altura, peso, bra_esq, bra_dir, per_esq, per_dir, pant_esq, pant_dir,
  cir_abd, cir_cint, cir_quad, cir_peit : currency;
  outras_medicoes : string;
begin
  data := edt_data_med_cir.Date;
  altura := StrToCurr(edt_cir_alt.Text);
  peso := StrToCurr(edt_cir_peso.Text);
  bra_esq := StrToCurr(edt_cir_bra_esq.Text);
  bra_dir := StrToCurr(edt_cir_bra_dir.Text);
  per_esq := StrToCurr(edt_cir_per_esq.Text);
  per_dir := StrToCurr(edt_cir_per_dir.Text);
  pant_esq := StrToCurr(edt_cir_pan_esq.Text);
  pant_dir := StrToCurr(edt_cir_pan_dir.Text);
  cir_abd := StrToCurr(edt_cir_abd.Text);
  cir_cint := StrToCurr(edt_cir_cin.Text);
  cir_quad := StrToCurr(edt_cir_qua.Text);
  cir_peit := StrToCurr(edt_cir_pei.Text);
  outras_medicoes := mmo_cir_out_med.Lines.Text;

  try
    with dm_principal do
    begin
      with ado_proc_cad_aluno_info_circ.Parameters do
        begin
          ParamByName('@ALUNO_ID_DIMENSOES_CORPORAIS').Value := id_aluno; //////usar adoquery para contar e verificar se tem algum aluno com tal codigo se houver abrir como att, se não houver abrir como cad
          ParamByName('@DATA_MEDICAO_DIMENSOES_CORPORAIS').Value := data;
          ParamByName('@ALTURA_DIMENSOES_CORPORAIS').Value := altura;
          ParamByName('@PESO_DIMENSOES_CORPORAIS').Value := peso;
          ParamByName('@CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS').Value := bra_esq;
          ParamByName('@CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS').Value := bra_dir;
          ParamByName('@CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS').Value := per_esq;
          ParamByName('@CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS').Value := per_dir;
          ParamByName('@CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS').Value := pant_esq;
          ParamByName('@CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS').Value := pant_dir;
          ParamByName('@CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS').Value := cir_abd;
          ParamByName('@CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS').Value := cir_cint;
          ParamByName('@CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS').Value := cir_quad;
          ParamByName('@CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS').Value := cir_peit;
          ParamByName('@OUTRAS_MEDICOES_DIMENSOES_CORPORAIS').Value := outras_medicoes;
          ado_proc_cad_aluno_info_circ.ExecProc;
        end;
    end;
    ShowMessage('Medições cadastradas com sucesso!');
    LimparControlesDentroDoRectangle(pnl_fundo_med_cir);
  except
    on E: Exception do
    begin
      // Manipular a exceção aqui
      ShowMessage('Erro: ' + E.Message);
    end;
  end;

end;

procedure Tform_ficha_consulta.btn_grava_med_cirMouseEnter(Sender: TObject);
begin
  btn_grava_med_cir.Fill.Color := $FF214358;
  lbl_btn_grava_med_cir.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_grava_med_cirMouseLeave(Sender: TObject);
begin
  btn_grava_med_cir.Fill.Color := $FF03223F;
  lbl_btn_grava_med_cir.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.btn_lmp_db_cutClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_med_dob_cut);
  edt_data_med_dob_cut.Date := Now;
end;

procedure Tform_ficha_consulta.btn_lmp_db_cutMouseEnter(Sender: TObject);
begin
  btn_lmp_db_cut.Fill.Color := $FF214358;
  lbl_btn_lmp_db_cut.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_lmp_db_cutMouseLeave(Sender: TObject);
begin
  btn_lmp_db_cut.Fill.Color := $FF03223F;
  lbl_btn_lmp_db_cut.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.btn_lmp_med_cirClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_med_cir);
  edt_data_med_cir.Date := Now;
end;

procedure Tform_ficha_consulta.btn_lmp_med_cirMouseEnter(Sender: TObject);
begin
  btn_lmp_med_cir.Fill.Color := $FF214358;
  lbl_btn_lmp_med_cir.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_lmp_med_cirMouseLeave(Sender: TObject);
begin
  btn_lmp_med_cir.Fill.Color := $FF03223F;
  lbl_btn_lmp_med_cir.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_med_cir);
  LimparControlesDentroDoRectangle(pnl_fundo_med_dob_cut);
  form_ficha_consulta := nil;
  form_ficha_consulta.Free;
end;

end.
